Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF3FC16F0A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 22:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965FF10E66D;
	Tue, 28 Oct 2025 21:24:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a35luTJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21C410E669;
 Tue, 28 Oct 2025 21:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761686654; x=1793222654;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PuHZV/r2OVdjZVQP8AMH1aWEXs95hcRXrcjy2rX6L5s=;
 b=a35luTJM/fFYhWKPANd8PXQR6F0LZq18cvsmLetR1d3lxVHKnNdHAXlo
 iUTw1OO6BWjRD5DaYiJviTeuHZWIGlk+DOmPa0JORvQYboCcGv7XT3+ML
 WObBbv1UmjrtTDVgZKDibc74HNAMPsO3j/+WV71TaEJNKf0FejFNHBT8M
 j+yeewG0YEeUE/tGSVHdbx5a5OAh2cdld3M0g1quni3JqYFdgeeRnw+n1
 ovzghKcjpbiylEHc1sDlzTtu1qh3rQTuByFj9lVjWByXYemsj7MlmwDTu
 RbH+pVs3MYTu2TSdX0BmF1g8kuPuQ9A2E3XEbVVfNdA9CCuSYcVY8ziHQ Q==;
X-CSE-ConnectionGUID: l1LlxFbMQUOpf+x3+Jv7jQ==
X-CSE-MsgGUID: u4tzU/GEQ7ilUuSWrkDKIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75143590"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="75143590"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 14:24:13 -0700
X-CSE-ConnectionGUID: KH84vPd5QcC/Su2t6tRsEg==
X-CSE-MsgGUID: 6Mq5rXEKQ3Cg4fHZVz/IPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="185548027"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 14:24:14 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 14:24:12 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 14:24:12 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 14:24:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hdW9q4fk2GQ7fd4EPRjn3L0H0R/BOR1pXPLdeO0yN9lQRjkLMVIfj7+R6wQpt3gunWK/88U7JGWfnol9Sq0rJmcBb6JQOHN34RZvHIYhiPmUQEE3ubl0hTjoRMSpKrZHNEWUnOHWBdYsDNEU68JubRNjRKVQbpfaUMNbVY79hYOheMqQqaYrPCD2hg4WTeBBtarylMwE3EiNujCv1sSJTlcUOoVL3H9yN/4u2kYOi8KUl136SPDulOBTrdiZnHlTHnLoC+xlxT7N+g2c9hHqMDlcZdAbbvV0T9BKZXB75M+rztr9wMFVVtleTjc30AKsARpizl36FNgFmy5OlAKeKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wgc3P1rQhtBzdXBQBU1041S2GpAVods4xEfqRJN1ylc=;
 b=JcM2vkwNzF4HZRpPvY7PHRuotOzmbyhf6Pp/rIf34gq2eWbkBWPNynduPSb0HplNzy8qWlB8RcVbP0+dkyPBNh7zl6mmf8KCYKa6rUzlfwHz5dUBQWhXp3MTecGWKiCX0loVnjcPAQutnkZkpAlL2cUusbGYYwQiu4xdTHGUge/mzW7w9P01c+V9J81qicC38dI6eLDznYdNem5EfYrm797TAD6NeOrZqlnXdKLjc4RPmjKcgvG7kye3P07nqFAP4Ob+2rBLPEGepv+hVJoeTtzw2Nnfsztbvc0c7DNtRrZxAWvOnmrCk0Ymm8i6jtVoFXApXpV+d3JDmCvRD45l+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7940.namprd11.prod.outlook.com (2603:10b6:610:130::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 21:24:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 21:24:08 +0000
Date: Tue, 28 Oct 2025 16:24:04 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Simon Richter
 <Simon.Richter@hogyros.de>, Alex Deucher <alexander.deucher@amd.com>,
 <amd-gfx@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>, "David
 Airlie" <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, <linux-pci@vger.kernel.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/9] drm/xe: Remove driver side BAR release before resize
Message-ID: <3ts3e2fwom7inbu2kzrvljo5mm7wz5ruaf6daib6cf5tk3v4al@njzufk22tcsy>
References: <20251028173551.22578-1-ilpo.jarvinen@linux.intel.com>
 <20251028173551.22578-7-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028173551.22578-7-ilpo.jarvinen@linux.intel.com>
X-ClientProxiedBy: SJ2PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a03:505::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: a4b8d401-9a35-4a32-1406-08de1668543b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?9A5dRdB4ca1o4K+teWTW1XvpmYHv1yv1d/+3Q1nK7Aug37td2dy8duf9AY?=
 =?iso-8859-1?Q?IdNuhJOp5t+F/xXF4lloQKMd8sgXqpueCMUWqUIZGcdeOVRm6uLxYeHbwn?=
 =?iso-8859-1?Q?SCpQa6eNY/AD7NOMbBs+SExz3f8IUiH+bvbxe7JCUkNEkegDjfaHD2rudz?=
 =?iso-8859-1?Q?V18pfTOcouZSe+J1Xws+9YG+g3oxTwF4R6FSB8bEbSwrOFI55IdDdDeTS7?=
 =?iso-8859-1?Q?yY3wJpAufuHR24up8d2JodK6BNtcnUClla5R1CtfaN5XN9Ch7sHWuARRtC?=
 =?iso-8859-1?Q?nLVN4LjqRQk0p3FDOMGWH1CenvCXrR4BTfp3VdWV6MYirJFKXL+BRWBZ28?=
 =?iso-8859-1?Q?DlrDyGbYCvvxNz0wn1ANEfKC6jLmovkNCDjR+FcfypjufN3fcLAbtG9gkd?=
 =?iso-8859-1?Q?1BDYfgY1tAniFNtZBZMwr8ZdaMLpQHnWmtDoLt9R4/aARQvfGq89pAyi5v?=
 =?iso-8859-1?Q?t0C6iOL3TraMhKLlnvttqzbocHGUQBIAq1ICdCFdec9AujVdrUl1WrMXGb?=
 =?iso-8859-1?Q?vKmDGfgU2Zd9jUU1KCj7K4+OsWZ7AjW7/iqSRaOw64g6ATaxd+mN209fC1?=
 =?iso-8859-1?Q?7RMQK8I7px/ClsiVY1AEoLshWXbS72CR5YOmG5FkwZaM8wmneQ73TFrqg7?=
 =?iso-8859-1?Q?Tg6Dif/yVQ1boSU+R2f3xi9atdjQt8RPfDmY+bwNLwks4r/suUKcZSsnLk?=
 =?iso-8859-1?Q?2fUJ277HXiH7b2ClHGR7R4el6mz8/Wk5pzhPNVjfKWbdsIMG2f+e1bQ+Rz?=
 =?iso-8859-1?Q?0uis/l5l49MvJOAZGyzmMx3GvH4SYl0zyvdk7My4FzsjevlgVIZ1o8FeWp?=
 =?iso-8859-1?Q?lCT5cqO0SAWJvCQ/RceuBKuF5VUWIBOWN70heyKrSZh+TmBrD4jZDbfDZ9?=
 =?iso-8859-1?Q?wXkFLc+M1ctNFn4RSLS0kvNmOjWN2Hb9zdsmaIWLuhkk1llld7yYTWXrFZ?=
 =?iso-8859-1?Q?fuO3OQIkEYvhKgwKGS/JKdIrdGNrx0hJhinXK85QIo0eGNhKz3rFObnxL4?=
 =?iso-8859-1?Q?CSDe6PRYrJDBaF1OBrhngjKT6EUemk59h8IzQEUftmHpDDoukSyZ3bsZg0?=
 =?iso-8859-1?Q?W5oMuCng5ZjgxAU7hwxv75Oq89Vybs6dXrO2E5G5m6k9ICpB4f+tPchZcu?=
 =?iso-8859-1?Q?EH9lkscP84Nuem1USgIjLEjDQKr1hn0EngduhIb4m9lnbHjXu56mH/P6nE?=
 =?iso-8859-1?Q?wxQXsOFoa0Qmk1tTAj/zSPL8jSmy/4BszuKsapR47wBgfpXCJ77O2aqiIX?=
 =?iso-8859-1?Q?CMtTygi1WcdkD0zJg9KCvXWz4FXpWITg1kot1TK51e59Wa1PGZpfkVvWgc?=
 =?iso-8859-1?Q?UzLotrwWd9zucN70u4awG+Yn18ZtgZISS1BYgoC4YCX3RTDCiT+PnzOzyt?=
 =?iso-8859-1?Q?YGnf8tdyyLidTd958s/MhvZ0eJEWrAaJDLnorqRzabOuIEODdOBkk67o9m?=
 =?iso-8859-1?Q?+0Aqqe89dNTPo7qw4mSZuF+DFyFMXSmIfh7IrePDQw0aj2pKun8utYWu6R?=
 =?iso-8859-1?Q?de1GwGVq91+aOKIxQLqI53JPy0RmtTMyUhgcEPOKbuHQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gpqiHiapxs4v+tPDcbxYNgVuSuRZ3WlKekbEZ3FKPX9AqkOAg7iWByBS9p?=
 =?iso-8859-1?Q?0uyAgPX6bMaBBZYPuuM+nRIKxlyjREVe6Kk0SDOwXimNH3AxeJm6/EtSsq?=
 =?iso-8859-1?Q?J7fI1BTkaMi8teHSStF8X6d1OjKWkPJTbukTLZDC0Ra+xlRQztDSM09IvU?=
 =?iso-8859-1?Q?B6fzJ4Ag86xo+s+GRxz6gsCJWjv2b+mWXtLibck3fjFk6hhCDxgs8o07iv?=
 =?iso-8859-1?Q?GIr70TbawD/Bq06SvQp+ag/5ZFDEg6f99VNv9mArpXUuYsfgLRYz6li5JP?=
 =?iso-8859-1?Q?GUHQF8wi2b58L05q+fUV2K/L0reiLlCD1CtpcjFpX+Zu7ppu2UQLLEOjI6?=
 =?iso-8859-1?Q?MixP12Kmq2pbfxql0kXYI7vjKN+kZAQP88NGzTOW2H0eeZoORZswskCh8I?=
 =?iso-8859-1?Q?at9p1HtAplIc3syvY4pdjBwB0FQzLha5S6ZtO9UTFUYHI8T36gWejmnFUT?=
 =?iso-8859-1?Q?29+zxSxyGAPwFpEIuGFQ2+l4tHMuNj4MPYRM0pTXPhb+CoZUYa8CDHDEEr?=
 =?iso-8859-1?Q?s379GjgANYk2TA02fzWnhFmDYySsW74hUo/wJQppITi/trOaD/WDAzfwji?=
 =?iso-8859-1?Q?H5N8+nU5o5b3Z2EcB12TLi+xoYz7Ob6SMPT1tWpXRCG2/6SiFbaW5hS8XX?=
 =?iso-8859-1?Q?QNy6o+aVQr8TUEOHpzQTFo6mqwqlzUzdd183UkMxdC2cSY3uH8KadOIszq?=
 =?iso-8859-1?Q?6038xbgPQmum8d3ZusctuFq1q/IG8hMuzrm/KiLvtoFToEtf+OmV9/3c1e?=
 =?iso-8859-1?Q?9e+ZWLCIq7N7r62iFNalHtRtVU7b7hcZR9bYAPdBb47AZFu2pfiLnTN9lD?=
 =?iso-8859-1?Q?gJfhivHErFJk6BJTUi9v2L2sj94lAB6N9XBedGRGTPQdxxOkoyzg/Pji0Q?=
 =?iso-8859-1?Q?5XcA25D922f6Shb64mLHV/eNUrDK6UpxbkKLWLAVBSUCyA8TIqsLMd2Iuy?=
 =?iso-8859-1?Q?6W5UqeOEgvswRmoSqZFz1iCpkwrQUIkSeW6enakGw/fNSwTUetVB3T9+tj?=
 =?iso-8859-1?Q?rx2jx/QONW5lH+lc2Dmo2+Hs0B8KNMRrJKtDBigyx8L8P1J9M7XqUYErRA?=
 =?iso-8859-1?Q?ubmbGDsJ0LVvwk3+Ottqdu+h+D9GUs/FoTqArsfsRfmgo4vihH2CI2+0mt?=
 =?iso-8859-1?Q?7veedWVcBHMwbU3RUWiMN0CfZd86IH4SuPN0Hkub9gG4gRy6c9wUeTfx1l?=
 =?iso-8859-1?Q?XzHamwe34/lw0mhu4Ta/6EeXcFZ7JTmjCwihUMPBBzdggewLPF4FmyF+e1?=
 =?iso-8859-1?Q?3X4syaJ2i2MRg89ske+XJzCFeGvYpJ19jGfZ4omZa2vH62ebhv8AiC0zng?=
 =?iso-8859-1?Q?rjloGzoJWNldAPbR8ivqpVmqxLqUfHgT8JpQfa8402OBm232bKkU64iifG?=
 =?iso-8859-1?Q?wmLpxFMwjUZquCJi8LPP+YaFvPQHnoJm7U1DAf5IJnWlVFhFaiqit65WUz?=
 =?iso-8859-1?Q?teJeLCquM+FDqkloz1x6QLYwqq0/38dpLW3xdaPtLHKwQLZi+MnkoQ0kGl?=
 =?iso-8859-1?Q?J9uSMeGHEHT7w7CpvdEJCWWuP77ShFAtTpzHsrKadWEzHHPxA74K+xm/E4?=
 =?iso-8859-1?Q?1N4iWdr/6dVgMHSsMBKqa3LNfR2B2e9SeDdlNKNMGdzda/0w7bM6JqmYpo?=
 =?iso-8859-1?Q?GsHsFiazj5I5OFO+l839ILXc/8WD5eatVV4O0j+UXq8XpkJDVCCTlTsQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b8d401-9a35-4a32-1406-08de1668543b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 21:24:08.0592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7EgTkg+rwpM/rB9Lwq4uWM4M9Y+jBIm0tY4dKgG5Tpuy9TOWRIt3n8DaCBk2xEgGYBnm4gtqGrGXX0+CAVLvsE0Md641QjEkCTLVzVfADVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7940
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 28, 2025 at 07:35:48PM +0200, Ilpo Järvinen wrote:
>PCI core handles releasing device's resources and their rollback in
>case of failure of a BAR resizing operation. Releasing resource prior
>to calling pci_resize_resource() prevents PCI core from restoring the
>BARs as they were.
>
>Remove driver-side release of BARs from the xe driver.
>
>Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_vram.c | 3 ---
> 1 file changed, 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
>index b44ebf50fedb..929412f0d131 100644
>--- a/drivers/gpu/drm/xe/xe_vram.c
>+++ b/drivers/gpu/drm/xe/xe_vram.c
>@@ -33,9 +33,6 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
> 	int bar_size = pci_rebar_bytes_to_size(size);
> 	int ret;
>
>-	if (pci_resource_len(pdev, resno))
>-		pci_release_resource(pdev, resno);
>-

conflict with drm-xe-next:

++<<<<<<< ours
  +      release_bars(pdev);
  +
++=======
++>>>>>>> theirs

if we don't need to release the BARs anymore to call
pci_resize_resource(), then the resolution is simply to drop the
function release_bars() function.

I'm sending that to our CI for coverage:
https://lore.kernel.org/intel-xe/20251028211613.3228940-2-lucas.demarchi@intel.com/T/#u

thanks
Lucas De Marchi

> 	ret = pci_resize_resource(pdev, resno, bar_size);
> 	if (ret) {
> 		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
>-- 
>2.39.5
>
