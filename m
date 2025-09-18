Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC24B84E7D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 15:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E0F10E8C4;
	Thu, 18 Sep 2025 13:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G23orj9S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6406C10E8C1;
 Thu, 18 Sep 2025 13:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758203333; x=1789739333;
 h=resent-from:resent-date:resent-message-id:resent-to:date:
 from:to:cc:subject:message-id:mime-version;
 bh=Aa9DyO78/A663fyE4Sz9EvYuZA9+lvgfFXFqxd7MR8I=;
 b=G23orj9Sujj7UDv+jvvL0ILlc1rCka16VfFI/nkcUNZfzfZzFVgTLD6A
 LcN9heu6zfcckd42xQyznyb9+Vo8qzbwPYst4ukCMBRPz8wKgeRyz9fWC
 UehF+3GI2u/e0ok8dHn2q4hK6GMXXVm5vaxjjoeKgOavVoHn3jfhzr5Ic
 FT/pG0D+EfxXGH3sd0xz8dG5auXZx1G4oMGMmoN9r/DLLSS5Wmcm+t345
 39NBNY7YP16v/zzK7tWSXDwOFca255W+ylA9a7rghs8dQxOuDGW8IeK7Y
 5PV4xQTXfs140kgH75d7WMgMcBZLlKzcTsOcKWj1ZUH9Pgjg1XPsry/NJ g==;
X-CSE-ConnectionGUID: FQ43q/97QU6ND4TU3BSxKw==
X-CSE-MsgGUID: h4cOm47pS7+2FrPxxFo+qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="59752705"
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="59752705"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 06:48:53 -0700
X-CSE-ConnectionGUID: PhG1OdMaQHGDxysQsjGvkA==
X-CSE-MsgGUID: xAxrDvaORRSKOwzvZb7FSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,275,1751266800"; d="scan'208";a="175118727"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 06:48:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 06:48:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 18 Sep 2025 06:48:50 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.56)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 06:48:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsXJ83cohiHnKPK5XacOzGXTCY8q4q/fxUZMsD6cVW5Fqlnn5KD/+XwHNWjYpZdgvEBbNd1LU6LpdcO5CDa4G0KmQpZgHCqJoyfL291h+C6eQwyHNLQCRd2Z20TzarfaNnFXr7jfOV+NUkBzmkniGKQOorbKMSmu/msY4FNPVsKCn2NZ7eAI5svq5R+AcDYjnI6dFWx3h5jzUvxiJLtS8HOoRP8qeZ9BTAsmFw9RipGF5+t1bVowKn/2ue4MiAKC9gbtly+5NYnEhN4EXZXwF+y3x6iufpNlxrfApvE3us5xGlge29yRKsbpBPEeoLBi+YGKXbvpcWCGqaU0qL6MJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaQJUqTXJE20GlC2WMDfTWKCcnW3pA2tT5msvzdcA2k=;
 b=tqVZ+Ni3OMUy7GeQxPOsfBq2XgViiq/1c0UkfkC2c4BbPQ39Qz6Bz2V4SotV1Bm3NIF6TkqdQt2p254Jf3djJzWZQeee41mE2xpOgjAf6qVCfz9QpCMEtD2wPEKzeHK+Gh7hnHB5touLvOyMG1kyqV87V7Pujs5yqJh4io4uj1dxjs8QN+f0JurtLklJh/VXOotXTGZDYEFrH1Ki3xSQUkxqEXO7nWwqTkgydlNBC6qcnVALHUVszLK/lK8flqNyhPNBtDJKJJsrMMjoeKekQwjVKFAs4aMD/tKD+RFcGX0IU2m50CXqL0ao8cc8p8rLd5o0ovQ04KT4cMnKkYQ7rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CO1PR11MB5204.namprd11.prod.outlook.com (2603:10b6:303:6e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 13:48:48 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 13:48:48 +0000
Resent-From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Resent-Date: Thu, 18 Sep 2025 09:48:44 -0400
Resent-Message-ID: <aMwNvM2GaeuWcpMm@intel.com>
Resent-To: Dave Airlie <airlied@gmail.com>, <simona.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dim-tools@lists.freedesktop.org>
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Date: Thu, 18 Sep 2025 09:41:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <aMwL7vxFP1L94IML@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BY5PR20CA0021.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::34) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CO1PR11MB4930:EE_|CYYPR11MB8430:EE_|CO1PR11MB5204:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a83dcaf-9a3e-45cf-0881-08ddf6ba17e2
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|35042699022|376014|14060799003|1800799024; 
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(35042699022)(376014)(14060799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e265553-40ef-4ebb-17bf-08ddf6b90537
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 13:41:07.6541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NhLmch6xjNAOe3vhYXe7xD81l9ON8KIiSJ1yiR9l7ZFk87qT8ffLMunOfKc2GLObBNV8ZeSBlYsbpySA12DKlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4930
X-MS-Exchange-Transport-EndToEndLatency: 00:00:02.2542982
X-MS-Exchange-Processed-By-BccFoldering: 15.20.9137.005
X-Microsoft-Antispam-Mailbox-Delivery: rwl:1; ucf:0; jmr:0; auth:0; dest:I;
 ENG:(910005)(944506478)(944626604)(920097)(815096)(255002)(410001)(930097)(140003);
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HY10NIDn3azHFRkQF9O/y1AFOzx0bHn6d6YsvtkUUGDEKp8gch8sTURUYsao?=
 =?us-ascii?Q?EdRHNhb86spc6eiulnZVlPbgzHnemZnEzsLGN23moaTSpm9o9au6paPl2W84?=
 =?us-ascii?Q?R1fGFlXjoblO45zqq+vYzuXxLnPAUJ0ie5kM/Y8LZMLnaLwoi9l2ILO3zUb9?=
 =?us-ascii?Q?fCPtF2elIFUe70VX5/6rbouXNKr954VW3XHyVq7Na7ps+Al/Xz+jZwL1MRal?=
 =?us-ascii?Q?N6ZCz7OBmAhP4FS5ko4JlMvX5sMDXp43V6hQi2IBcEWVU3qRssSu8hIlxBvB?=
 =?us-ascii?Q?nOreFUD0fzA4ZJd+TSgm6cFxPnlQleLfegJyGZM2YBc7Qf5ZtGJ/1SblnZk0?=
 =?us-ascii?Q?OrnYNF+5y4sEhNFX6uFACshkBKJSmWQZpKI7es6Ap/wFZpS2QoHaqTpeEc6p?=
 =?us-ascii?Q?BSJzzFYkIY/EbZu/xlMKY3kexaYNGv1qmAJDQL10A1m+KMKVfYxuxi18M/0h?=
 =?us-ascii?Q?B1Ds/LyYYezg2axXMQIsXemuOM0+bnBuNQr9DTQeLrfb4SRKILgW7dyV5S5y?=
 =?us-ascii?Q?WvgTvEZ9umeJSQUovF5jm6ekWRdhTsdF6isyGXuNFd2Hw/bEyIL+LaRAdSde?=
 =?us-ascii?Q?cIRGLX8yqzfg3Q3JiNUnzMHnYUcr6znU1feMADWszlRdLuzqdHuYsuXTMz2L?=
 =?us-ascii?Q?eKVw2NG4M1xxC8DTOMCoy44b/2UffTOUqLEvxBaUEV8CRZdug8ycS1nT2xgN?=
 =?us-ascii?Q?QOtHOGReSPuvi50Y1tGUFp08kJRGtkMkbZ+DO0307VApiHFwDBq+J54pDmEg?=
 =?us-ascii?Q?F1M5Ia5ND9Bv32dX6R5cV5YZUyR3/czvVlZ2W/gEdz5ys79KlXgQsY3mimMM?=
 =?us-ascii?Q?Ev+7EiQL7mtei3H5vXcJRmk303ROdwBcbrpm9jFMdJ/bCF/dp0SDPU0LlKkE?=
 =?us-ascii?Q?ImDBVZ+J25DsE61TN/nmsRDs8p/P+py5t+0BXF//D4eEsahCR/J/BiU8yH0F?=
 =?us-ascii?Q?3eZz527JQ0kgB+L9Wsdn7YpZRB2DjEGVTGQfqMv7oD/IL9swqVqUJeFv5CFi?=
 =?us-ascii?Q?+QAUAmZm6oIYJkGsVi8UIer03e+fgNs016K/Ho2OgKdOEAZ5ysbYPMCypLuE?=
 =?us-ascii?Q?fRFgctj56Jyou054HBXpbt2OVZmVhEZuC7wb4nfkfwTqtHkLuBHaPNbpv+xw?=
 =?us-ascii?Q?V1s5wOSDIxlNGrB6WeRTPBYjfYf116dVXd3gdtjDnUaY7/HeH6Y9sxsOXzYe?=
 =?us-ascii?Q?6j2xpMR3WzApvppdd1Tcbtf0lNvrB6PHaglK8gnRXFsRZ0qRrKSzPnF4cYRn?=
 =?us-ascii?Q?zz64LzFI77rOXMT6BJz3qliCxwN8imn2JS8GHCNwlVgJdZBXeT7+VciUv2RA?=
 =?us-ascii?Q?ilN+9cLaussjjTbK20nNvpH09N0beqaSfOcwo/LNnCI3zJLdiT3DOvC67VW7?=
 =?us-ascii?Q?Igc5TbA=3D?=
X-ClientProxiedBy: BYAPR06CA0067.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::44) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2e265553-40ef-4ebb-17bf-08ddf6b90537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ULEmkSGNqgE0mf5nYwM5lAF//yyp5GfjAt40zbXlZ6sS8RkbD8BVYoZer9R2?=
 =?us-ascii?Q?IRqCVBhyJ5nvHtxGwDoAShWjnTt7nDQAkibCCeBLS3Vso5w0wLUkbJzUNLMj?=
 =?us-ascii?Q?8396rQjakO7DRKjkbnHoHesX0RKwIKUjgWjeS6O/opfPoj7GcwDvYduY4UWX?=
 =?us-ascii?Q?Zo8YhjKGzw49z2t8quIEwYAHqVpqKoFYVFS1XTJ8eHLtPQVBoL6Hw0TmgHYy?=
 =?us-ascii?Q?j3o8Utia14CR1jLFtOuVCLKkz+tOOAX5uyqNlCFbZUfVZwN4GttW3NSgNDfz?=
 =?us-ascii?Q?S7vT4ac8y/VTYQ1L0KMNs9s/Zi9NfumZ+RH1QWS+VKsX6nNIDsJz4VUMXQzx?=
 =?us-ascii?Q?Z0XFY1nm8O3qTRuGUiEdzJfcZqbObUs54mLtpqxjXkhKdl70nvcd4s4NwRQp?=
 =?us-ascii?Q?GdtcFK5h6D7zB5Y9kcKRbEdm7q1DVzpIgFmntocsCyUnA/9xUcxofJvAejhc?=
 =?us-ascii?Q?g1aJOjRpo/lHaJVH11bJ5/WhtOr+EXi+LMlm1n9O1FArOl2eaPUmirtXL/0i?=
 =?us-ascii?Q?+Z3GGm0Az6auycWIHeAQljih4Q6/86gE9wpRcr9e8pzGW1Cfm0ks9DI4eqY1?=
 =?us-ascii?Q?Snfb56QGKz1kVkt1onqe+s4ohoilnYQfFWEEd5AE23ie7CNDBSiVrx03GRqJ?=
 =?us-ascii?Q?oW9BipxlEvUQW5neRgc8Yfx8JT7zPD+sehYRLn+YxfmpXoQNsOZJEtIFuPFg?=
 =?us-ascii?Q?lmz6QYV0ffrx4vnsy2W+vb3s434AO55TYFr9YK2M0+HRqE1+CENSGap/EtDm?=
 =?us-ascii?Q?n6EEKb6K50G1Zfa3ITPXfV3g4bzlGARO1AwyFzKf9XvvSFvfquWMJHUYiF1Q?=
 =?us-ascii?Q?YxCwgCwVGV4U1zrILxJFB+ZxDR8A3oVYd3yRmXGKJ9K5v2C4SnYBAG2nE1dr?=
 =?us-ascii?Q?jARb2f0McvWBXHHseRJnLQur5OrBz+3akHdWU+n9gRfbfZBudFemOreai/y9?=
 =?us-ascii?Q?YzWMRGQPWWydwFHjOb+yoMz8YoeNGTP+MFWW7avTYYb0N56BLEK0M6UmHc3f?=
 =?us-ascii?Q?OO/CpuEy/XDoMNbc7b6av7X6YlwdaGzv+ld9lZPqaYre+7XH7THSwHLO7cHq?=
 =?us-ascii?Q?YIOXSviEcy2JFaPhNHRTD/axmud/21mZseqMUieKzd1g35dv9SuPYByp4MSw?=
 =?us-ascii?Q?I8hq5piZHvpcWB5mxcCCHS8bI8xska3Ggr/H1RbJNGedgzsHpI6GsUivcuZo?=
 =?us-ascii?Q?9OCSbXgw0XnOa9yz95W7XvPD/Wbysf81B8J2AzXm0mFTx9rMYlnzlfJ/SNuJ?=
 =?us-ascii?Q?4vstR+4iCosEOcGy+0tpE3JMWpf+mSKvCOSM3TYiaHooKdPDHCD/r5/Ha552?=
 =?us-ascii?Q?GFyYH5INb2ujyLSa+tQQkbTMB4YRwWqRpmww81xK9IO2ooZCyqroD5i87Vdx?=
 =?us-ascii?Q?oqhG9UePh7iNRI++y08uvDD6RCvRrIuyt4oi6mBbB8wkgcSU50rTY38hPIh0?=
 =?us-ascii?Q?P1nkXV3bHaaCv85YSohBiFagnheiF16LVtecVXffrJmsPgyjkhN8SDs/aIWo?=
 =?us-ascii?Q?8rKmSm82E9bwHqz0mCMDF5bBZr6Zni8Xv+zVm0a+chj+tPvMVnPG+TiSe9df?=
 =?us-ascii?Q?7VYPrw2Dbyl6reS8istYr7phE8t4/rDIA+PsEz5Wef21s/mwmEhDK2ZlJj1Z?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a83dcaf-9a3e-45cf-0881-08ddf6ba17e2
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 13:48:48.3397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fooGnjAl9A3XF9K5t+rqsR6nEpeZmH1lufju/y7ss71Fm8SJVioBEBqLAuJBQH9Q+/VrWdX/zb7iOgkkkocXDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5204
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

Hi Dave and Sima,

Here goes our drm-xe-fixes.
It has more fixes than normal for this time of the cycle,
but nothing very critical.

Perhaps the most critical one is the RCS/CCS yield policy
which prevents starvation in the CCS engine on BMG. A
patch that was slightly modified to add a missing include
that was preventing it to build after cherry-pick.

Thanks,
Rodrigo.

drm-xe-fixes-2025-09-18:
- Release kobject for the failure path (Shuicheng)
- SRIOV PF: Drop rounddown_pow_of_two fair (Michal)
- Remove type casting on hwmon (Mallesh)
- Defer free of NVM auxiliary container to device release (Nitin)
- Fix a NULL vs IS_ERR (Dan)
- Add cleanup action in xe_device_sysfs_init (Zongyao)
- Fix error handling if PXP fails to start (Daniele)
- Set GuC RCS/CCS yield policy (Daniele)
The following changes since commit f83ec76bf285bea5727f478a68b894f5543ca76e:

  Linux 6.17-rc6 (2025-09-14 14:21:14 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-09-18

for you to fetch changes up to 26caeae9fb482ec443753b4e3307e5122b60b850:

  drm/xe/guc: Set RCS/CCS yield policy (2025-09-17 20:23:47 -0400)

----------------------------------------------------------------
- Release kobject for the failure path (Shuicheng)
- SRIOV PF: Drop rounddown_pow_of_two fair (Michal)
- Remove type casting on hwmon (Mallesh)
- Defer free of NVM auxiliary container to device release (Nitin)
- Fix a NULL vs IS_ERR (Dan)
- Add cleanup action in xe_device_sysfs_init (Zongyao)
- Fix error handling if PXP fails to start (Daniele)
- Set GuC RCS/CCS yield policy (Daniele)

----------------------------------------------------------------
Dan Carpenter (1):
      drm/xe: Fix a NULL vs IS_ERR() in xe_vm_add_compute_exec_queue()

Daniele Ceraolo Spurio (2):
      drm/xe: Fix error handling if PXP fails to start
      drm/xe/guc: Set RCS/CCS yield policy

Mallesh Koujalagi (1):
      drm/xe/hwmon: Remove type casting

Michal Wajdeczko (1):
      drm/xe/pf: Drop rounddown_pow_of_two fair LMEM limitation

Nitin Gote (1):
      drm/xe: defer free of NVM auxiliary container to device release callback

Shuicheng Lin (1):
      drm/xe/tile: Release kobject for the failure path

Zongyao Bai (1):
      drm/xe/sysfs: Add cleanup action in xe_device_sysfs_init

 drivers/gpu/drm/xe/abi/guc_actions_abi.h     |   1 +
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h        |  25 ++++++
 drivers/gpu/drm/xe/xe_device_sysfs.c         |   8 +-
 drivers/gpu/drm/xe/xe_exec_queue.c           |  22 +++--
 drivers/gpu/drm/xe/xe_exec_queue_types.h     |   8 +-
 drivers/gpu/drm/xe/xe_execlist.c             |  25 ++++--
 drivers/gpu/drm/xe/xe_execlist_types.h       |   2 +-
 drivers/gpu/drm/xe/xe_gt.c                   |   3 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c   |   1 -
 drivers/gpu/drm/xe/xe_guc.c                  |   6 +-
 drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |   4 +-
 drivers/gpu/drm/xe/xe_guc_submit.c           | 120 ++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_guc_submit.h           |   2 +
 drivers/gpu/drm/xe/xe_hwmon.c                |  35 ++++----
 drivers/gpu/drm/xe/xe_nvm.c                  |   5 +-
 drivers/gpu/drm/xe/xe_tile_sysfs.c           |  12 +--
 drivers/gpu/drm/xe/xe_vm.c                   |   4 +-
 17 files changed, 209 insertions(+), 74 deletions(-)
