Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98923AACF71
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 23:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5356F10E108;
	Tue,  6 May 2025 21:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Syu3QwzE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9764710E070;
 Tue,  6 May 2025 21:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746567022; x=1778103022;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bMkyd/XoLCc0ZoHm8Ow3cS2S4ZDsTDhrYeLOtKPFyGA=;
 b=Syu3QwzEJDcZaq3iWuMrLl+/YL3qfEkEUYNsrmpd00jQcCqEyGrN0P34
 igUptOOum7FqnRTzICRd7IsBEAZCbDBldXV8/0vPloIUwgfpBaCrStG0p
 sFtKT1VZcYfIc2AcR0ARVm3MEfQajLx7umNOcEPhQUhgGu9Xr5Gf6NWf2
 eOMtuDjK8RBc7iPM2pvOQv3fMnxKv4HODhCjUXbw/HBAlXBIQ+rWfB5Wu
 MBkTDKyMhF/v7y4mUBYB6avrExp4heiUqfvOQ9nYiKiz1cckcRnDzFfZT
 4WY0wYLf34X7Wxyz99dkv8tBBrTNi/TYYTHgXB7oYjzfoeJ5nSSk0C4c/ A==;
X-CSE-ConnectionGUID: LMl/sy+VTcmjAIRCSQWiQA==
X-CSE-MsgGUID: +APatm1vRA+m+NqeSYEE8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58893519"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="58893519"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 14:30:20 -0700
X-CSE-ConnectionGUID: 8mIWUnXuSkCFzhfKHz/Ztg==
X-CSE-MsgGUID: vcM04eJnScWZpWBPfPX2Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="140593324"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 14:30:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 14:30:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 14:30:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 14:30:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2KNV5iHMVUYiMpdUPFfPvwZvHhDcryFeC4Xlc3gFuBxiJgECkosckD1AkKqevxRh+mh2sn+tK5gtEuz7hwYd3kNbdvDczZCbOpOcB8NH9b1RxOtgAxFoBC4JD1LXh3HjiSMOzVUJpQawH46NC12YCz8j4Ngle0ggftjRfL15HYiOS4/5rO0JB9TKZFxwnBr1pD1K6iJV1xHp6MGKjrvtBKr82P0c+v9cjCbhOGYqPs4JHS9p5h/4MfvYomDRjuJRXqpmw/QwomG3JL7EISfS2mGvdUpDqciAWlUTc4ldLtqeVefHQBpTAsPYMWOjjf5Q5ZRsANOX9lPXWV9/u5gwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ngr1owOzZLAayav1uuqveIYnJa9LWI3IgA/9c5snZVg=;
 b=TZI5mKEPFhgUMIGnvluRPjAeLtRtt4T+nDUetKQWpsBA9csyhi8Veg/hrkR55xxgUlLsCN25Z50Na3XgReF0qJbGi94kq36GBzPnFOETebKVl6z6qFywylvvIxKI1TXqSqRR+wwDcryqNVrNBC872xvFJs4SmSu1qNyvdSBJdohPTPQ1yeqilHgE2kC7F6FWvdVWE5F9+uVGUwii+R5kkXT8O3Zq3S9a5Sz/Pcv48eS/SiuYNPYSFfqtcEKSrCMmkZh1emqzOlPoBRVf0oRr5D57g1FzuXfTKnVqB+2jylpvf0kFdO99AhAK34bZbRd4XISFQ0oPoQlsbo/BCL5cWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM6PR11MB4579.namprd11.prod.outlook.com (2603:10b6:5:2ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 21:30:11 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8722.018; Tue, 6 May 2025
 21:30:11 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Hirschfeld, Dafna" <dafna.hirschfeld@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Zhang,
 Jianxun" <jianxun.zhang@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Mrozek, Michal"
 <michal.mrozek@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>, "Briano, Ivan" <ivan.briano@intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH v23 2/5] drm/xe/xe_gt_pagefault: Move pagefault struct to
 header
Thread-Topic: [PATCH v23 2/5] drm/xe/xe_gt_pagefault: Move pagefault struct to
 header
Thread-Index: AQHbtVpgi1/2p1GPXUq6RBiICW9LNbO6uX6AgAEYnICAAKhQEIAJtm9A
Date: Tue, 6 May 2025 21:30:11 +0000
Message-ID: <CH0PR11MB5444933BBAEC7F96B0E04762E589A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250424204917.172708-1-jonathan.cavitt@intel.com>
 <20250424204917.172708-3-jonathan.cavitt@intel.com>
 <zqvdl3mu7q5vynymsbz7ax76sz2opyfhr4cwyp6vsi5yz4fl5w@jxxwcgbzoqhf>
 <c6abnjkhl2szjpql5hkvg4is3oxdeqzjdhskijlznif3gbbh2m@tc6evykceayg>
 <CH0PR11MB54441430BC7884703A315AF7E5832@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB54441430BC7884703A315AF7E5832@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: matthew.brost@intel.com,Michal.Wajdeczko@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM6PR11MB4579:EE_
x-ms-office365-filtering-correlation-id: e6657ffa-6a3d-4bc9-7cb8-08dd8ce52e7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?GJHoSJTb+fApg6dRXnMCPXtEKRvLbOizWFJwUBoNwKfSJ/uIuFbKQYuAHZRZ?=
 =?us-ascii?Q?LsmEECi6/cgIOmZUn4PGY5ZAPCuCxrQ8uy7htUTEnvzc2G3Cb32Gd3LM3jcl?=
 =?us-ascii?Q?ITws0NpNLxkr9H8PxCzZtvhk7/wfYrh2+u/7uHFCJduuhBXssT9ea0BzbxZo?=
 =?us-ascii?Q?rJ8w5spx6YBvxzNM9A/pbv5N3zgRl1PE4RkxT3JBu8OmmLMLVruIXDiPGAaa?=
 =?us-ascii?Q?ygot24gU00vHLDUblbtqEGEQBDRCJVR98ZBgPXpX8mfxl7WzFb1Jgma0ZVub?=
 =?us-ascii?Q?okpXrsmuLM7RQmgpCHfZpKZ30fFHrMJxP2hS/1XdkQPjbAw0KGptEmHPejXv?=
 =?us-ascii?Q?gQqbXMTc9lDPfvHZ2AELT/JREQ8OntWQYgXEi2nEkmM6+mMu7V65VDFay4Po?=
 =?us-ascii?Q?Mc+ctFd8r4e02oZiswYOBNIXp0ZUCX0x4FgSVoGhRiKXVl5PX2o99B6ASemo?=
 =?us-ascii?Q?EB1Pf5phgSGfW4Mb0eNOyzX01N02w1+e9/BPZ2gVDJ1a0M60LAsLnRVwUPPn?=
 =?us-ascii?Q?EY8a84Y3fjt1skrsMUtl/bkVVV0cWCKUuUgRnEVyzWv1wlu4a+f7QMpJQh95?=
 =?us-ascii?Q?l2O2O5H4aFRVE9CoxexeXsHJrCHs5KYDDEYIkXUEwkPFHV91Xb6iRsxuyfK4?=
 =?us-ascii?Q?Li4HG3eUNCMYAjmHGYutvKSsEQiupgrGfKkUf+1gzEZV1cDXIkKoFA4kggaZ?=
 =?us-ascii?Q?hMgaXBAtqK8A/OpdqjXzkEgO1B/AON1B9YltuDsegavQbJmi8NdRYrejPdLS?=
 =?us-ascii?Q?I3vtnzRxeeQ/GGiZkrZyYycG6MhAQAe2DSfCtoqikEUSoMQGs+aUWhEhln/R?=
 =?us-ascii?Q?CeTBxvPsswJz+TP5h3wrfXoismFy2MgjiqizqBcXKB+1H5MsIfYDQtE6H+W7?=
 =?us-ascii?Q?fbGGwcbmjjGQDPSeaAHhanHeWko3lSzoUFzzm4yjzrGZ0s3bb4V47diXLL5U?=
 =?us-ascii?Q?99AvnB6aGCixed8e3nfzPZNiJvQYQpb6paIRDt3jbMIYidatiWIW5y38ectk?=
 =?us-ascii?Q?cK+8W6mRmDqODiESHBN2DICZ2q0f/6Pwdsv5SvXJSaU/JpBk3haN5E3g/o/m?=
 =?us-ascii?Q?DjeIKdynJp32iHwC/U2boeF7yRb9fb8cl5c9gXVsFcBgGjLSe0ARVhdAxHcC?=
 =?us-ascii?Q?1fOxdFibL7Wr9pwR5QmaN6qnnnP3/8KQvnHKLXN6NNFlxvSvYhX8Em3xs1FS?=
 =?us-ascii?Q?6qpvJeidSXup/t4Zi518HZEDbW3zrrYkKPby9TYrRkf/c2oez4Cf3BLSD+Wj?=
 =?us-ascii?Q?iK4gE+1xyqBZaZPxB6by/gG/xvOfeGFTiMKAgsyn6lpDfaZb9d0RjAUojKdE?=
 =?us-ascii?Q?0YXmMjC9HpHNS/q1fJVr3RJl/lSaUCxNjt/cmZML3SymS9Km+3EZ5fftsvgu?=
 =?us-ascii?Q?dEkHD2kES67LsFqsj2XcJCah6xV3/4lM+bnazSKQUIB1b+PsT/h8IZBJ0crS?=
 =?us-ascii?Q?PrIHlPs/ZwiBKyqFs1OcGbxoPJcsLB9a9c+SFlggWQV/vWt6aiT9yA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JrEQ0wpDcpY8n8gwCFT1h42ofKATZ0eZSSRh+81eW/OnoZSIQcxW0JpOh4hz?=
 =?us-ascii?Q?QKO8+NbCy60JSUwDU/Zm3Hh2IpavZjIInQKtH/YZC64bpGXviMm64aZmNvnQ?=
 =?us-ascii?Q?K0PkdfeRa4hgxh0hskXT7MERd79JBLS2lUj37RkDrDD3KWHrg2P9NchwTPNS?=
 =?us-ascii?Q?Ku9aZddQQSH4/1WwtcE+KcxfTyAQurGufQyuC4ceI4LRmgnfoYC9ybH83iYb?=
 =?us-ascii?Q?NgeVp9fDRaqpXhvF1foLKcrvSB+4wex7Rj2Yfi1VyvMX756ExbFfPvONIpsz?=
 =?us-ascii?Q?T0d5l37N6Z5e5Jra45kWs7Wt2BoLrxKOt/qZMuAgpU1kU5PS3RwQoqlcd23E?=
 =?us-ascii?Q?cpYMGJ4hX+WqnBtkG5FEmmy3MDTKNW6h5rTT1Te65Hpk4fXNLIJukZFzAvhM?=
 =?us-ascii?Q?X/JCKh247I/A6FbR/Lu3/ZRb6UofU7qldQ2tfotIR/20jso19ukTqM5P5GkK?=
 =?us-ascii?Q?zTCIpa1iaPM9dmucfDPsGngpxyIDfW0ssL6MLKZ6wUx+tdZG2TxvQI23FYMU?=
 =?us-ascii?Q?NOHqcLJoJGQuueQhfhOXT41slEF4ECD7u7MOZkPJb9mPl3P+GBOcrwSoELwn?=
 =?us-ascii?Q?VoUFdfq6Q+HyYr8KJOYE2h/HLsZlKxurKZtIoM7xmd6TruqC9WS9YTmpe9M5?=
 =?us-ascii?Q?vd8oADkBRTNOTlTobdItR7aLRPlOQwj7QngYYV50NgJaIty7PHS/BK578N6a?=
 =?us-ascii?Q?mABPiqnuMgK2eCEw84r1llaHHDk0nI/qegKRStKcMue1KqmH6/dlxiFrHAyz?=
 =?us-ascii?Q?jwkH1PlCuUiBUr7ce4ZwYDqmG2I7gySQqcOwc4lrvmoO5A6skbYZ4WaZvVWb?=
 =?us-ascii?Q?WsZoemTkSeD3f6hwP4lTH5umloC1OAft5jaqzO3dVS369wRCbbfhyLNHj48h?=
 =?us-ascii?Q?OWbZ75ujNW7DM+HWbSnJmv2n8CdmoKwRKMy5izroX3tijL8fqjCjWYpDE+8q?=
 =?us-ascii?Q?KyrwFoKQBuhJBUBpYCd7PCOV/Pqlucz5HZ5U+7OtXaqlmCf8S33KSuxbiQzB?=
 =?us-ascii?Q?+QQF2L6XDzyUd8inasQk2kmorzHmXlPtVhThPmlNacTX8QRFlBnCFgkyfZzd?=
 =?us-ascii?Q?quFDhYnY2yAr0faYQ9Xlz+y3IngNC/3HCEPVruMmBtICnuA53JcqYJtGFS3b?=
 =?us-ascii?Q?7DXbh5DmaVHqxAsGsIrwpd4meDRhePRuVLk6e71cktvlXnt3SNCS+Sbhwn+i?=
 =?us-ascii?Q?iJdypjFQQTZyjBDoUkEJ2AySZBjop0oqUeYHz+FSIQG+MGFA4Aebecf3TIf9?=
 =?us-ascii?Q?Fa9vJgOiqpgd+5DsXkYDIIIWtNf5GiP0l16NOCbVDKkaQhXnhtzHC9mo30hv?=
 =?us-ascii?Q?Hb3bd6GuipgFc0PsQ8g9/ioN56wYIT0hHaj950CEcPUOrSDna0fkAnOF98Sq?=
 =?us-ascii?Q?hMyZ2yMCI/My1DRybNIMtk9BJTHnJeDBdGp864SZMDqQd/ji1af7FbQmh6gE?=
 =?us-ascii?Q?xqFfiG/lr+rexcJRL8EdEA3A1nK6a+MHswCwMw2dQl+mIJpOrkBxBtdToYqU?=
 =?us-ascii?Q?qysg4bMQl0Rznca5nYv8E9jdabog3O/9lWn4+DHrkCHmsHtxN3VetTIXo0hu?=
 =?us-ascii?Q?wxtefYV2T7xQhAKgbanGpOHbVhcetQGgYRLFT8II?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6657ffa-6a3d-4bc9-7cb8-08dd8ce52e7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 21:30:11.1679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g6UeRE6dR3HBA6w5PXFEL6JQeJ3mfbPfmMy+eMTX7XWM02lUbZDP0sUF0V1fXRJwCgu+irwVBWtBVzHsPT9MkXpdsUDVdHcV77E+rw8FQFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4579
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

I think this patch series is still blocked on these requests.  Do you want =
me to implement these
suggested changes, or should they be dropped?
@Brost, Matthew and @Wajdeczko, Michal
-Jonathan Cavitt

-----Original Message-----
From: Cavitt, Jonathan <jonathan.cavitt@intel.com>=20
Sent: Wednesday, April 30, 2025 11:42 AM
To: Hirschfeld, Dafna <dafna.hirschfeld@intel.com>; Brost, Matthew <matthew=
.brost@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Zhang=
, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.co=
m>; dri-devel@lists.freedesktop.org; Mrozek, Michal <michal.mrozek@intel.co=
m>; Jadav, Raag <raag.jadav@intel.com>; Harrison, John C <john.c.harrison@i=
ntel.com>; Briano, Ivan <ivan.briano@intel.com>; Auld, Matthew <matthew.aul=
d@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v23 2/5] drm/xe/xe_gt_pagefault: Move pagefault struct =
to header
>=20
> -----Original Message-----
> From: Hirschfeld, Dafna <dafna.hirschfeld@intel.com>=20
> Sent: Wednesday, April 30, 2025 12:07 AM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel=
.com>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Bro=
st, Matthew <matthew.brost@intel.com>; Zhang, Jianxun <jianxun.zhang@intel.=
com>; Lin, Shuicheng <shuicheng.lin@intel.com>; dri-devel@lists.freedesktop=
.org; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Mrozek, Michal <micha=
l.mrozek@intel.com>; Jadav, Raag <raag.jadav@intel.com>; Harrison, John C <=
john.c.harrison@intel.com>; Briano, Ivan <ivan.briano@intel.com>; Auld, Mat=
thew <matthew.auld@intel.com>
> Subject: Re: [PATCH v23 2/5] drm/xe/xe_gt_pagefault: Move pagefault struc=
t to header
> >=20
> > On 29.04.2025 17:22, Dafna Hirschfeld wrote:
> > >On 24.04.2025 20:49, Jonathan Cavitt wrote:
> > >>Move the pagefault struct from xe_gt_pagefault.c to the
> > >>xe_gt_pagefault_types.h header file, and move the associated enum val=
ues
> > >>into the regs folder under xe_pagefault_desc.h
> > >>
> > >>Since xe_pagefault_desc.h is being initialized here, also move the
> > >>xe_guc_pagefault_desc hardware formats to the new file.
> > >>
> > >>v2:
> > >>- Normalize names for common header (Matt Brost)
> > >>
> > >>v3:
> > >>- s/Migrate/Move (Michal W)
> > >>- s/xe_pagefault/xe_gt_pagefault (Michal W)
> > >>- Create new header file, xe_gt_pagefault_types.h (Michal W)
> > >>- Add kernel docs (Michal W)
> > >>
> > >>v4:
> > >>- Fix includes usage (Michal W)
> > >>- Reference Bspec (Michal W)
> > >>
> > >>v5:
> > >>- Convert enums to defines in regs folder (Michal W)
> > >>- Move xe_guc_pagefault_desc to regs folder (Michal W)
> > >>
> > >>Bspec: 77412
> > >>Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > >>Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > >>Acked-by: Matthew Brost <matthew.brost@intel.com>
> > >>Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
> > >>---
> > >>drivers/gpu/drm/xe/regs/xe_pagefault_desc.h | 49 ++++++++++++++++++++=
+
> > >>drivers/gpu/drm/xe/xe_gt_pagefault.c        | 43 ++++--------------
> > >>drivers/gpu/drm/xe/xe_gt_pagefault_types.h  | 42 ++++++++++++++++++
> > >>drivers/gpu/drm/xe/xe_guc_fwif.h            | 28 ------------
> > >>4 files changed, 100 insertions(+), 62 deletions(-)
> > >>create mode 100644 drivers/gpu/drm/xe/regs/xe_pagefault_desc.h
> > >>create mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> > >>
> > >>diff --git a/drivers/gpu/drm/xe/regs/xe_pagefault_desc.h b/drivers/gp=
u/drm/xe/regs/xe_pagefault_desc.h
> > >>new file mode 100644
> > >>index 000000000000..a169ac274e14
> > >>--- /dev/null
> > >>+++ b/drivers/gpu/drm/xe/regs/xe_pagefault_desc.h
> > >
> > >Maybe change the file name to xe_guc_pagefault_desc.h ,
> > >since this is currently guc specific.
>=20
> On paper, this shouldn't be a difficult change, though I'd like to ask
> @Brost, Matthew and @Wajdeczko, Michal if this request is
> amenable.
>=20
> > >
> > >Also, the define 'PF_MSG_LEN_DW	4' relates to the
> > >length of this struct so should move here.
>=20
> I don't see the harm in moving it, though I'd like to wait for a second
> opinion before proceeding.
>=20
> >=20
> > Actually, the struct 'xe_guc_acc_desc' and its defines should
> > also move here.
>=20
> IMO, I think that if xe_guc_acc_desc needed to be extracted from the
> xe_gt_pagefault.c file, it should be put in its own header file in the re=
gs
> folder, rather than sharing a file with xe_guc_pagefault_desc.h.  Say,
> regs/xe_guc_acc_desc.h?
>=20
> Though at that point, I think the migration would be out of scope for
> this series.
> -Jonathan Cavitt
>=20
> >=20
> > Thanks,
> > Dafna
> >=20
> > >
> > >Thanks,
> > >Dafna
> > >
> > >>@@ -0,0 +1,49 @@
> > >>+/* SPDX-License-Identifier: MIT */
> > >>+/*
> > >>+ * Copyright (c) 2025 Intel Corporation
> > >>+ */
> > >>+
> > >>+#ifndef _XE_PAGEFAULT_DESC_H_
> > >>+#define _XE_PAGEFAULT_DESC_H_
> > >>+
> > >>+#include <linux/bits.h>
> > >>+#include <linux/types.h>
> > >>+
> > >>+struct xe_guc_pagefault_desc {
> > >>+	u32 dw0;
> > >>+#define PFD_FAULT_LEVEL		GENMASK(2, 0)
> > >>+#define PFD_SRC_ID		GENMASK(10, 3)
> > >>+#define PFD_RSVD_0		GENMASK(17, 11)
> > >>+#define XE2_PFD_TRVA_FAULT	BIT(18)
> > >>+#define PFD_ENG_INSTANCE	GENMASK(24, 19)
> > >>+#define PFD_ENG_CLASS		GENMASK(27, 25)
> > >>+#define PFD_PDATA_LO		GENMASK(31, 28)
> > >>+
> > >>+	u32 dw1;
> > >>+#define PFD_PDATA_HI		GENMASK(11, 0)
> > >>+#define PFD_PDATA_HI_SHIFT	4
> > >>+#define PFD_ASID		GENMASK(31, 12)
> > >>+
> > >>+	u32 dw2;
> > >>+#define PFD_ACCESS_TYPE		GENMASK(1, 0)
> > >>+#define PFD_FAULT_TYPE		GENMASK(3, 2)
> > >>+#define PFD_VFID		GENMASK(9, 4)
> > >>+#define PFD_RSVD_1		GENMASK(11, 10)
> > >>+#define PFD_VIRTUAL_ADDR_LO	GENMASK(31, 12)
> > >>+#define PFD_VIRTUAL_ADDR_LO_SHIFT 12
> > >>+
> > >>+	u32 dw3;
> > >>+#define PFD_VIRTUAL_ADDR_HI	GENMASK(31, 0)
> > >>+#define PFD_VIRTUAL_ADDR_HI_SHIFT 32
> > >>+} __packed;
> > >>+
> > >>+#define FLT_ACCESS_TYPE_READ		0u
> > >>+#define FLT_ACCESS_TYPE_WRITE		1u
> > >>+#define FLT_ACCESS_TYPE_ATOMIC		2u
> > >>+#define FLT_ACCESS_TYPE_RESERVED	3u
> > >>+
> > >>+#define FLT_TYPE_NOT_PRESENT_FAULT		0u
> > >>+#define FLT_TYPE_WRITE_ACCESS_VIOLATION		1u
> > >>+#define FLT_TYPE_ATOMIC_ACCESS_VIOLATION	2u
> > >>+
> > >>+#endif
> > >>diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/x=
e/xe_gt_pagefault.c
> > >>index d4e3b7eb165a..93afa54c8780 100644
> > >>--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > >>+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > >>@@ -12,8 +12,10 @@
> > >>#include <drm/drm_managed.h>
> > >>
> > >>#include "abi/guc_actions_abi.h"
> > >>+#include "regs/xe_pagefault_desc.h"
> > >>#include "xe_bo.h"
> > >>#include "xe_gt.h"
> > >>+#include "xe_gt_pagefault_types.h"
> > >>#include "xe_gt_stats.h"
> > >>#include "xe_gt_tlb_invalidation.h"
> > >>#include "xe_guc.h"
> > >>@@ -23,33 +25,6 @@
> > >>#include "xe_trace_bo.h"
> > >>#include "xe_vm.h"
> > >>
> > >>-struct pagefault {
> > >>-	u64 page_addr;
> > >>-	u32 asid;
> > >>-	u16 pdata;
> > >>-	u8 vfid;
> > >>-	u8 access_type;
> > >>-	u8 fault_type;
> > >>-	u8 fault_level;
> > >>-	u8 engine_class;
> > >>-	u8 engine_instance;
> > >>-	u8 fault_unsuccessful;
> > >>-	bool trva_fault;
> > >>-};
> > >>-
> > >>-enum access_type {
> > >>-	ACCESS_TYPE_READ =3D 0,
> > >>-	ACCESS_TYPE_WRITE =3D 1,
> > >>-	ACCESS_TYPE_ATOMIC =3D 2,
> > >>-	ACCESS_TYPE_RESERVED =3D 3,
> > >>-};
> > >>-
> > >>-enum fault_type {
> > >>-	NOT_PRESENT =3D 0,
> > >>-	WRITE_ACCESS_VIOLATION =3D 1,
> > >>-	ATOMIC_ACCESS_VIOLATION =3D 2,
> > >>-};
> > >>-
> > >>struct acc {
> > >>	u64 va_range_base;
> > >>	u32 asid;
> > >>@@ -61,9 +36,9 @@ struct acc {
> > >>	u8 engine_instance;
> > >>};
> > >>
> > >>-static bool access_is_atomic(enum access_type access_type)
> > >>+static bool access_is_atomic(u32 access_type)
> > >>{
> > >>-	return access_type =3D=3D ACCESS_TYPE_ATOMIC;
> > >>+	return access_type =3D=3D FLT_ACCESS_TYPE_ATOMIC;
> > >>}
> > >>
> > >>static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
> > >>@@ -205,7 +180,7 @@ static struct xe_vm *asid_to_vm(struct xe_device =
*xe, u32 asid)
> > >>	return vm;
> > >>}
> > >>
> > >>-static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> > >>+static int handle_pagefault(struct xe_gt *gt, struct xe_gt_pagefault=
 *pf)
> > >>{
> > >>	struct xe_device *xe =3D gt_to_xe(gt);
> > >>	struct xe_vm *vm;
> > >>@@ -237,7 +212,7 @@ static int handle_pagefault(struct xe_gt *gt, str=
uct pagefault *pf)
> > >>		goto unlock_vm;
> > >>	}
> > >>
> > >>-	if (xe_vma_read_only(vma) && pf->access_type !=3D ACCESS_TYPE_READ)=
 {
> > >>+	if (xe_vma_read_only(vma) && pf->access_type !=3D FLT_ACCESS_TYPE_R=
EAD) {
> > >>		err =3D -EPERM;
> > >>		goto unlock_vm;
> > >>	}
> > >>@@ -271,7 +246,7 @@ static int send_pagefault_reply(struct xe_guc *gu=
c,
> > >>	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> > >>}
> > >>
> > >>-static void print_pagefault(struct xe_device *xe, struct pagefault *=
pf)
> > >>+static void print_pagefault(struct xe_device *xe, struct xe_gt_pagef=
ault *pf)
> > >>{
> > >>	drm_dbg(&xe->drm, "\n\tASID: %d\n"
> > >>		 "\tVFID: %d\n"
> > >>@@ -291,7 +266,7 @@ static void print_pagefault(struct xe_device *xe,=
 struct pagefault *pf)
> > >>
> > >>#define PF_MSG_LEN_DW	4
> > >>
> > >>-static bool get_pagefault(struct pf_queue *pf_queue, struct pagefaul=
t *pf)
> > >>+static bool get_pagefault(struct pf_queue *pf_queue, struct xe_gt_pa=
gefault *pf)
> > >>{
> > >>	const struct xe_guc_pagefault_desc *desc;
> > >>	bool ret =3D false;
> > >>@@ -378,7 +353,7 @@ static void pf_queue_work_func(struct work_struct=
 *w)
> > >>	struct xe_gt *gt =3D pf_queue->gt;
> > >>	struct xe_device *xe =3D gt_to_xe(gt);
> > >>	struct xe_guc_pagefault_reply reply =3D {};
> > >>-	struct pagefault pf =3D {};
> > >>+	struct xe_gt_pagefault pf =3D {};
> > >>	unsigned long threshold;
> > >>	int ret;
> > >>
> > >>diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault_types.h b/drivers/gpu=
/drm/xe/xe_gt_pagefault_types.h
> > >>new file mode 100644
> > >>index 000000000000..b7d41b558de3
> > >>--- /dev/null
> > >>+++ b/drivers/gpu/drm/xe/xe_gt_pagefault_types.h
> > >>@@ -0,0 +1,42 @@
> > >>+/* SPDX-License-Identifier: MIT */
> > >>+/*
> > >>+ * Copyright (c) 2022-2025 Intel Corporation
> > >>+ */
> > >>+
> > >>+#ifndef _XE_GT_PAGEFAULT_TYPES_H_
> > >>+#define _XE_GT_PAGEFAULT_TYPES_H_
> > >>+
> > >>+#include <linux/types.h>
> > >>+
> > >>+/**
> > >>+ * struct xe_gt_pagefault - Structure of pagefaults returned by the
> > >>+ * pagefault handler
> > >>+ */
> > >>+struct xe_gt_pagefault {
> > >>+	/** @page_addr: faulted address of this pagefault */
> > >>+	u64 page_addr;
> > >>+	/** @asid: ASID of this pagefault */
> > >>+	u32 asid;
> > >>+	/** @pdata: PDATA of this pagefault */
> > >>+	u16 pdata;
> > >>+	/** @vfid: VFID of this pagefault */
> > >>+	u8 vfid;
> > >>+	/** @access_type: access type of this pagefault */
> > >>+	u8 access_type;
> > >>+	/** @fault_type: fault type of this pagefault */
> > >>+	u8 fault_type;
> > >>+	/** @fault_level: fault level of this pagefault */
> > >>+	u8 fault_level;
> > >>+	/** @engine_class: engine class this pagefault was reported on */
> > >>+	u8 engine_class;
> > >>+	/** @engine_instance: engine instance this pagefault was reported o=
n */
> > >>+	u8 engine_instance;
> > >>+	/** @fault_unsuccessful: flag for if the pagefault recovered or not=
 */
> > >>+	u8 fault_unsuccessful;
> > >>+	/** @prefetch: unused */
> > >>+	bool prefetch;
> > >>+	/** @trva_fault: is set if this is a TRTT fault */
> > >>+	bool trva_fault;
> > >>+};
> > >>+
> > >>+#endif
> > >>diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe=
_guc_fwif.h
> > >>index 6f57578b07cb..30ac21bb4f15 100644
> > >>--- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> > >>+++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > >>@@ -290,34 +290,6 @@ enum xe_guc_response_desc_type {
> > >>	FAULT_RESPONSE_DESC
> > >>};
> > >>
> > >>-struct xe_guc_pagefault_desc {
> > >>-	u32 dw0;
> > >>-#define PFD_FAULT_LEVEL		GENMASK(2, 0)
> > >>-#define PFD_SRC_ID		GENMASK(10, 3)
> > >>-#define PFD_RSVD_0		GENMASK(17, 11)
> > >>-#define XE2_PFD_TRVA_FAULT	BIT(18)
> > >>-#define PFD_ENG_INSTANCE	GENMASK(24, 19)
> > >>-#define PFD_ENG_CLASS		GENMASK(27, 25)
> > >>-#define PFD_PDATA_LO		GENMASK(31, 28)
> > >>-
> > >>-	u32 dw1;
> > >>-#define PFD_PDATA_HI		GENMASK(11, 0)
> > >>-#define PFD_PDATA_HI_SHIFT	4
> > >>-#define PFD_ASID		GENMASK(31, 12)
> > >>-
> > >>-	u32 dw2;
> > >>-#define PFD_ACCESS_TYPE		GENMASK(1, 0)
> > >>-#define PFD_FAULT_TYPE		GENMASK(3, 2)
> > >>-#define PFD_VFID		GENMASK(9, 4)
> > >>-#define PFD_RSVD_1		GENMASK(11, 10)
> > >>-#define PFD_VIRTUAL_ADDR_LO	GENMASK(31, 12)
> > >>-#define PFD_VIRTUAL_ADDR_LO_SHIFT 12
> > >>-
> > >>-	u32 dw3;
> > >>-#define PFD_VIRTUAL_ADDR_HI	GENMASK(31, 0)
> > >>-#define PFD_VIRTUAL_ADDR_HI_SHIFT 32
> > >>-} __packed;
> > >>-
> > >>struct xe_guc_pagefault_reply {
> > >>	u32 dw0;
> > >>#define PFR_VALID		BIT(0)
> > >>--=20
> > >>2.43.0
> > >>
> >=20
>=20
