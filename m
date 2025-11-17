Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9C2C6399E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 11:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1566510E040;
	Mon, 17 Nov 2025 10:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OkHP2g8G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1527010E03A;
 Mon, 17 Nov 2025 10:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763376104; x=1794912104;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=GI82tn2ZJhtuos9hbhxIExYbQ+jcCSOo74ZRrkwmhDw=;
 b=OkHP2g8GpiUdhi9C7AiFfRvr1ps342YnHpucmO2+WvU3iWnmh6pR6Rra
 cDzBENP2v0lfa+c34rgPNtd1D0QsQ+sUg8P+H3oNWvBiA6Fel29oKKbT+
 OzI1r0sPZI2Xr5rCs3jCDUaggKc/5yjQbDIaSiLzGndBHMlJ7T2BeYyN9
 i3d5acuIgPVnahrIfjleLe6y9TE7A9sR3TxADEHMdDEIEzICDuCfTks3a
 3XvkekAXWwHqEnSQOpIXXaa1AqQ+YeBXPI2OQV/Zo4QTdMH6xoORv7NOY
 +RwfANEt3aytCDlRBcLw2DB2NXXQK1dFYhTNIDQaKzENqTkKJBKL7DnSe Q==;
X-CSE-ConnectionGUID: dLdnAF+ZRgG5dCtVOOFQ6g==
X-CSE-MsgGUID: iBIPOyTRSueFSUeg4Ortjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65405202"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="65405202"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:41:44 -0800
X-CSE-ConnectionGUID: A1ubmi4pQrq3Qtag3M4CEA==
X-CSE-MsgGUID: A/Cs37T6RqKrEpZi62R1PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="191202646"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 02:41:43 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 02:41:43 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 02:41:43 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.63) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 02:41:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dCZnf39Ha/ylGtqgMPG/yumIgzbm32RRGVIiG4EDgrQRk1KxlkmVsuByDy16tT+qSKPUOtg2IB1Fz+QnOwerbmr81e3xE/9DK5M/yPJhB3pr4+nWoO41n5tAlpFtEQbsPaJPWV+X+g9c2C+ygAFLKjoxs4F44TijLUwHlJqkplPUWKXDZYrHCNfZ66QoX4sS8or1yFPs3LNjObGTtz6cya6zKOeupwTDqCqbT7HyaIkwedllPTEFXSNa6RgWGTTuKbfMjQ12L7PPNYnVHs0UafTxxejT7McMNHLgiL4A4zNXza9MgVywuXXoJZh3SyYfXVQq+lNJmyoQnX1KnBwgJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgJm4fBOUEUoxhEtj9n4Y3pmBj3JTYPPgMEW8oyXhKs=;
 b=tS5pOn4bte39PZY4BEgVY56WRNR/BIawjCPv2JKyXOe2blgInjH62FAlnPZ0ncGlKorxlrG5S8pRtoxR62KV0a37Ypkagi+vsOlkxYvO2O6HilnY0vPOs1zvjyYDnfy9gmQeygItNSTSsr9yEmFFrcMp/YnsvVgzVIO1W9qi/IhYlreG2YhMHZg87cGMPkoqy6HVjWWIYJGAM70xQOFPHN+G7vx0S/eBKJrV9cXGjdC1dvsW9a9N3J8KHU1o7O1hsKu7/qC4+mlZkQqIwxf94Sn2GEvqLfKzS5Krj1C0I7tjmGnlBRXLBZsFHTquRCUbLE9Avcox9J/kGpUtqBljkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by DS0PR11MB8230.namprd11.prod.outlook.com (2603:10b6:8:158::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Mon, 17 Nov
 2025 10:41:40 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 10:41:40 +0000
Date: Mon, 17 Nov 2025 12:41:35 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Suraj Kandpal <suraj.kandpal@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, Ankit K Nautiyal
 <ankit.k.nautiyal@intel.com>, Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
Message-ID: <aRr739mIZ1MfdaQl@ideak-desk>
References: <20251113043918.716367-1-suraj.kandpal@intel.com>
 <aRWU-ovOdSRUQI-B@ideak-desk>
 <689e22d69f7ad9be4f4a78b5194d8c4965be8ca8@intel.com>
 <DM3PPF208195D8D4E9B5E427A947CB14523E3C9A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <aRr0MJbOaHXMXEtO@ideak-desk>
 <2804e0989a1251c4223aeb64b1220e0b01ba66ef@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2804e0989a1251c4223aeb64b1220e0b01ba66ef@intel.com>
X-ClientProxiedBy: LO2P265CA0124.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::16) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|DS0PR11MB8230:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c6c02b-c7e3-4b55-e70a-08de25c5e459
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nYD36FUUMiZ76kEHCgjZEOSijpaLrPL0JFtUX6fspXMQwRyOEbU9ArGfp1mE?=
 =?us-ascii?Q?Zpix/5Vz4POiqpBPtCdRsLyYtNkLra4s/jqtn7l/y1VpDqGr3frcvfVQfaPg?=
 =?us-ascii?Q?lNzEElcc0wefcr64oh3QEdOWpB4LMuwR0w58JRVCRHmeHdQeCwATAhBiwG8a?=
 =?us-ascii?Q?R7suisagDJdb5OLnlrvP9ujrGp8T7OmS4w6a0duh9Re86BjYxBmtKGdbvTVy?=
 =?us-ascii?Q?/Uz/fGvQxe0vPZsW8WPowMQVWYQaWrQkyxQn3xxSmsgr5lAFZ1QePXq8KW1S?=
 =?us-ascii?Q?7Q+4Y9IP1L3YHl93YbzgETsd4VmihQz2SLvXBAsXVoPjpMuGutXSzvco8A2Q?=
 =?us-ascii?Q?mCKR+0lsy+OK6No4kOY0LL5h3CQ2Z0qAbRZkVTUovivvKEzD6usXh6pRQNLT?=
 =?us-ascii?Q?w3KSP0nX+eRS5k7N57wa8KFx/MKwf6mofGDIhhXcWXtN41oHx6hwTdA7X3Fl?=
 =?us-ascii?Q?OPqAq5KT3pTLeoZDeVtTp5HrhSGGVKoykmgXanJpjXUjizXNEWIuRIFLYjqO?=
 =?us-ascii?Q?diKc9nSKPPJTpl4CKfJdhyDQUlQWsrZd1cuQEf5xaCxhNAAzCT+nSiHMpnyV?=
 =?us-ascii?Q?8FS+ijh2rQ50khGEwCi8MgexXerwGkMoHW4CPq1kEQ8X+XGhOqnSs2nboaKa?=
 =?us-ascii?Q?ib1AOduxly8GHk2yAPbWpaaONFge/+Q3xdhgeI9ClfssqMkGoRPD0PkwQ9tn?=
 =?us-ascii?Q?wA/9+S2oMM3C9oUoqPjjmdI1bnc/qC8bzlholm+YveeXKizkz5R+HZnqPLTA?=
 =?us-ascii?Q?zdNxEv/DaoazvDfTkP/P3HIhxiJSXIO89aX2o/fqW1uXbhdJxUEipsbQnJrI?=
 =?us-ascii?Q?ceo9jwThrxox5BYyY/EfZqqL+Z7H7ODvA9is5rJYWXh86O2l4jd/4KYxYe5l?=
 =?us-ascii?Q?s0gnFGgIGIR90KlB8r4jgpEKTA6DWVCh0fzj0cNj4t1Zx38d1K3yFAlk64B5?=
 =?us-ascii?Q?oEZyyoibOrPWtmvSndVcnHp+UY9mOy1kkaPH8+cjygIQh8TeJS+0FYBGS2Xt?=
 =?us-ascii?Q?OGXDuxZ37JAMui4XPFKtebotucJqqdPfZDk9QJdRfWzFYFRH1gwmQ9G567Jj?=
 =?us-ascii?Q?vjLmXAPYu47vD01V2Tz0uA8+9A5UJe4Oni8ZfN/cH/QODXgNuV3MKMqoGfNK?=
 =?us-ascii?Q?hcaAPAmipiAxUgaXL/0AwK9Ke9aK1o72LwRHzdL9wqdDi7aeMXpdudl2Gupk?=
 =?us-ascii?Q?XAvlWyU+j9mfcg8OZq4j2qNAUk6PsRL3Vf4HOQAos5sMf0ZdQNdcbUOxwTqG?=
 =?us-ascii?Q?uG91KgaM+ghQPNSDPn6tikQLMHaSvC+UH3+0e0UBfd3biG2gSUYFC6EXPNN9?=
 =?us-ascii?Q?2MhhKyX+EPSbYJvK/RPmLpOXesuIomwhE0GVcb7FzE+5CMmoIhhw827Zco5y?=
 =?us-ascii?Q?Qrp/mtsIJLlYMRs/px22VOmU6XK6IAqQSxtHEl34gRVisXmfInN7/0zrIDAY?=
 =?us-ascii?Q?fsIA082UGizTo/i3a1pUn336XUHcVrmh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cqE5PIdqrgghmN6kpztAIy1FYKE6eY7jF6ZuLbQ7JjTfliaxRwYZQczmvLQG?=
 =?us-ascii?Q?nHR4DJsSoaomlhQfWdZa+5A4HBtfnYK92sga/cuyoX2u+e4axc4hSwFklffA?=
 =?us-ascii?Q?a26925kLhbFeEEAjYe5nro3+QpowuQqlPzfC/L/m/5hJomvMliuOCUKQutaZ?=
 =?us-ascii?Q?kPpDo9IXmtjh2CWtdzS9E/BhuwitEXD2Y1CKQqlP35uvRQryEPacZDRNmYzU?=
 =?us-ascii?Q?OjjCvhK9z0jPTQt7DW8VGhS4AcPhk6ALFONBF4wynpsbo5+Irl/UzjEkiZsz?=
 =?us-ascii?Q?DnoJPx261fR61y8Juy6vVYqaipssF51tjf3MNqbgRMJKQLnCOuccUwi2f8wp?=
 =?us-ascii?Q?5IusYwavw4pEKFm/2N3DEfTu1bYC6CHexUFmJZ/GJgfbcD8whe9R4/zAv/VT?=
 =?us-ascii?Q?CX9diOEIC/iEx6PJGkkH6UJuh022xq98B1xf/53+l/MI9B4Zl1e5HjDr95jT?=
 =?us-ascii?Q?W66f0nf6XzufdanTy/AvyMoWuhOPWXMF2tUNnkQBLrbtTDaOCD6jntwrVWsK?=
 =?us-ascii?Q?cAGn1QHC8Hs44vW7l+kMjNhLGQ2qUU30UfUulofQ6Xqc/8PszR6ceUoOJZmO?=
 =?us-ascii?Q?6GtyKgBlzSysMtBkgSpMRoUEx3O7K3r30sMTFMkEOQVsDPtdZVXXdKnC6IKQ?=
 =?us-ascii?Q?ZyYlt+HAZTD0m84gAxJ7GfvOT1BQUg6Sl3hESRSN3rKmiBHBLQtcSIYx6S21?=
 =?us-ascii?Q?2OmzXv1yFZ/gase7kR599S2U0WXEQMaR4jo5DtvgGdFT9Dr/9AkJc2WdtjpA?=
 =?us-ascii?Q?GHP/EtPUHv4rTbXQKQnQKEBUJEaIMAZB7Qisb2XJHJnDnn43bXRAGYbi7oxv?=
 =?us-ascii?Q?S7B6ZSlLwx7n/sMXUxzQVbyMKrBo6MLObbVBDM07gTR6jBfvaPJAzgSQT54Q?=
 =?us-ascii?Q?/rcAQhTkxVBjQFMD/h1enKwYJjjFm7BwGERQ2kvZ6AagV/ubg3tqCRQ8mbRG?=
 =?us-ascii?Q?rvgA7bIm8B+CsEx0ksdZDiSgi38S05dH5Oal2NAK276nFSdJp6pQPOXQY4hk?=
 =?us-ascii?Q?u/et3/XuJ7G7eu3ZS4Yky5GaPSZsDcl8cLq8Y3RfGn9n4hcL1D1V+rMTqyNO?=
 =?us-ascii?Q?ovjwbGBoN29GC24jGxDzmSo2uf+49Djmlq/+d7vwurR3/lRSzLsoPP+Mtzn3?=
 =?us-ascii?Q?5U23jxQQejFtdYETyvYN5lRxDELuZi1BttygTj51XLRVX0VHfVKdg6Yqpvgw?=
 =?us-ascii?Q?/9S8OEjoW/LFvVL1Glgae/SOEa+ihhNukFNfb3ZrxLTf7p0jzPZDVjN87G68?=
 =?us-ascii?Q?ERV8Y9EgOZbR4Y173ayGNBedUOABTZGKhsHFQrkqSD+HE7IqnwLRqdvc/1nI?=
 =?us-ascii?Q?GBKJL/BM5G8Pf67UQUfBUy+bUDtX9Yjus7isbrGUgc/2hmDWn1kngnguYaBr?=
 =?us-ascii?Q?xjBd0hkhF/DFeIoqrBzjRiHLIcJM1iaQpnXPfz2uE8zRDSv4SQUHeD1j0HgF?=
 =?us-ascii?Q?x48yva8+Gf0VpQhWRTLkr+h12cL2GDLlL34HDCSEVyJyLJ10k7P6z8IP/7iC?=
 =?us-ascii?Q?XrR6+Mixa+5LGhw8lUGH/fBw413SMm0DDlMHLhCflM/HIwNow6zd1YxbkbTs?=
 =?us-ascii?Q?cjP0GBvxRQd6rWodrCjNxaqThOFVUTxRAuMqwefjLJvZZCJ/xDnfsIe98Y5I?=
 =?us-ascii?Q?eflrHFj3NKoSCdDKdWL55mRSbkewn03YNvqvx9xNkyoY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c6c02b-c7e3-4b55-e70a-08de25c5e459
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 10:41:40.6714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vBxCLy1O4v7Viph+vVyBNJIAaAV73xryeOIygFR+AxTD3VWqjN7CUhdPVx4JE/0iH/WDKgZUZ8LTenkNJ/lnyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8230
X-OriginatorOrg: intel.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 17, 2025 at 12:19:18PM +0200, Jani Nikula wrote:
> On Mon, 17 Nov 2025, Imre Deak <imre.deak@intel.com> wrote:
> > On Mon, Nov 17, 2025 at 07:09:38AM +0200, Suraj Kandpal wrote:
> >> > -----Original Message-----
> >> > From: Jani Nikula <jani.nikula@linux.intel.com>
> >> > Sent: Thursday, November 13, 2025 9:55 PM
> >> > To: Deak, Imre <imre.deak@intel.com>; Kandpal, Suraj
> >> > <suraj.kandpal@intel.com>
> >> > Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; intel-
> >> > gfx@lists.freedesktop.org; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>;
> >> > Murthy, Arun R <arun.r.murthy@intel.com>
> >> > Subject: Re: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
> >> > 
> >> > On Thu, 13 Nov 2025, Imre Deak <imre.deak@intel.com> wrote:
> >> > > On Thu, Nov 13, 2025 at 10:09:19AM +0530, Suraj Kandpal wrote:
> >> > >> When releasing a timeslot there is a slight chance we may end up with
> >> > >> the wrong payload mask due to overflow if the delayed_destroy_work
> >> > >> ends up coming into play after a DP 2.1 monitor gets disconnected
> >> > >> which causes vcpi to become 0 then we try to make the payload =
> >> > >> ~BIT(vcpi - 1) which is a negative shift.
> >> > >>
> >> > >> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> >> > >> ---
> >> > >>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 +++-
> >> > >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >> > >>
> >> > >> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> >> > >> b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> >> > >> index 64e5c176d5cc..3cf1eafcfcb5 100644
> >> > >> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> >> > >> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> >> > >> @@ -4531,6 +4531,7 @@ int drm_dp_atomic_release_time_slots(struct
> >> > drm_atomic_state *state,
> >> > >>  	struct drm_dp_mst_atomic_payload *payload;
> >> > >>  	struct drm_connector_state *old_conn_state, *new_conn_state;
> >> > >>  	bool update_payload = true;
> >> > >> +	int bit;
> >> > >>
> >> > >>  	old_conn_state = drm_atomic_get_old_connector_state(state, port-
> >> > >connector);
> >> > >>  	if (!old_conn_state->crtc)
> >> > >> @@ -4572,7 +4573,8 @@ int drm_dp_atomic_release_time_slots(struct
> >> > drm_atomic_state *state,
> >> > >>  	if (!payload->delete) {
> >> > >>  		payload->pbn = 0;
> >> > >>  		payload->delete = true;
> >> > >> -		topology_state->payload_mask &= ~BIT(payload->vcpi - 1);
> >> > >> +		bit = payload->vcpi ? payload->vcpi - 1 : 0;
> >> > >> +		topology_state->payload_mask &= ~BIT(bit);
> >> > >
> >> > > This looks wrong, clearing the bit for an unrelated payload.
> >> > 
> >> > Agreed.
> >> > 
> >> > The logs have, among other things,
> >> > 
> >> > <7> [515.138211] xe 0000:03:00.0: [drm:intel_dp_sink_set_dsc_decompression
> >> > [xe]] Failed to enable sink decompression state
> >> > 
> >> > <7> [515.193484] xe 0000:03:00.0: [drm:drm_dp_add_payload_part1
> >> > [drm_display_helper]] VCPI 0 for port ffff888126ce9000 not in topology, not
> >> > creating a payload to remote
> >> > 
> >> > <7> [515.194671] xe 0000:03:00.0: [drm:drm_dp_add_payload_part2
> >> > [drm_display_helper]] Part 1 of payload creation for DP-5 failed, skipping part 2
> >> > 
> >> > <7> [515.347331] xe 0000:03:00.0: [drm:drm_dp_remove_payload_part1
> >> > [drm_display_helper]] Payload for VCPI 0 not in topology, not sending remove
> >> > 
> >> > So it's no wonder the port's not in topology and everything fails. We obviously
> >> > need to skip payload_mask updates when the VCPI is 0, but that's just a
> >> > symptom of other stuff going wrong first. Perhaps we could do with some
> >> > earlier error handling too?
> >> 
> >> Yes I agree the question is how high will the error handling needs to be added.
> >> A lot of weird things going on here.
> >>
> >> 1st one is how is it finding a payload which we do not create while we
> >> call destroy function
> >>
> >> 2nd how is VCPI with id 0 possible from what I see VCPI are 1 at least
> >> that's what I gather from drm_dp_mst_atomic_check_payload_alloc_limits.So what
> >> are we missing when we create a payload?
> >>
> >> Imre, Jani any idea still new to how payload creation work so am I
> >> missing something.
> >
> > A VCPI ID will be assigned to a payload during an atomic commit only if
> > the corresponding MST connector is still connected. If the MST connector
> > gets disconnected by the time of the atomic commit - as in the above
> > case - no VCPI ID will assigned and the allocation table in the branch
> > device cannot be updated either for the payload, as indicated by the
> > above payload creation/removal failed messages.
> >
> > I think the fix should be not to clear the VCPI ID if it's 0. Valid VCPI
> > IDs start from 1.
> 
> Agreed. As I said above, "We obviously need to skip payload_mask updates
> when the VCPI is 0".
> 
> But there are *also* a bunch of other things going wrong before that,
> but we plunge on. Should we do something about that?

Creating or removing a payload, which need to update the payload table
in the branch device can fail expectedly if the corresponding MST
connector is disconnected by the time of the atomic commit. This is
indicated by the above

VCPI 0 for port ffff888126ce9000 not in topology, not creating a payload to remote
Part 1 of payload creation for DP-5 failed, skipping part 2
Payload for VCPI 0 not in topology, not sending remove

debug messages. The commit must still continue and complete since the
user should be able to disable each MST connector in a topology one
MST connector at a time.

> BR,
> Jani.
> 
> 
> 
> 
> >
> >> Regards
> >> Suraj Kandpal 
> >> 
> >> > BR,
> >> > Jani.
> >> > 
> >> > 
> >> > >
> >> > >>  	}
> >> > >>
> >> > >>  	return 0;
> >> > >> --
> >> > >> 2.34.1
> >> > >>
> >> > 
> >> > --
> >> > Jani Nikula, Intel
> 
> -- 
> Jani Nikula, Intel
