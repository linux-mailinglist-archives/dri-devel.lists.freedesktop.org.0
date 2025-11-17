Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 303ECC64AC3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 15:39:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5092D10E17A;
	Mon, 17 Nov 2025 14:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nqcqX2fH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012050.outbound.protection.outlook.com
 [40.107.200.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8BDE10E0AB;
 Mon, 17 Nov 2025 14:39:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnIf8uxwLM2OlfZOukQxpRrGKU+D/w4s8/U/RGKUi1I7IOqukjAic3S9hucq90NxfO5cm8rRZRTKi+KRIMTlhCcO4mUPS5NirdWjPQHKBPfj3JnkyeAQRvMK0WwrIIDOsdwI3RcdZuKYiTQJOUEX6DEV6NJa/tEEdBnjoSuOBrH+/1CKodWozKTXhj3KyIvfXk5XcCMgKYrg38HxWN/3iE6eC4lzk/nEiBS4TAGGLdKDq73A9PA6BX7vQItV38VDzT4aE8FqTmRxrxmDRF3dW5SK0Ibyu5MJ2PI1Ij81aDs29VtlaMnPptS/0BBELPEnQGJ7I/foSKJkVPb53AuVDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eq4rJt14SttsHVbcZGaocthxp2lmXRaxOwFsIyycdKE=;
 b=oLGf4/8fPdV18204SjMYyT4FAwkds3VCv1Dm+7mPhc6eeVAPyLAZGfUjpdP9uBOujLVSJXEXv4NDf5zJQP4XmzlSekBg7IMoCg+rnwR70sXTVqM5qecjzPgUxxKdEsyByZuPb+CCii2q8BXjUypiS0DZzXo85zpQf46jj85MjIEGjckn09m99CI+H7YmQdZLan3UCLxUetKmr53FKyco8Xqn5u4J/5qpiJiuCXcsMVcExhJ+XVXDrd+GdXAeevhmbAvjtiulArd7yn2o7yPFgRD945m4bDPflVIeOyJKTmedZZsBMKv5u568DPDM+MIZT2vQ6jbDxmzll0zujOX6mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eq4rJt14SttsHVbcZGaocthxp2lmXRaxOwFsIyycdKE=;
 b=nqcqX2fHAhD3x+uV1lULpyqtXRjzYYEWcny/rLUmH5M0HYQeLfn+Fz00QlN05z2AOneGlXHG69UiMKI9gfaBbsFIH4S4slSqh/4yl9gByhfHTwj9ZI+ChFCtfCb6LFh2Dh9XNrdCGOdoDIR50kJnh4s1a0LJrfDo/zsHsGi5GgEki56fEqAWegGyS2SOnTO+c2eG9tkIFPt1XecVMj3s6SE8nCriIzd5381WkLwKyjL8bUIlo1BtGBbqOqWAWcGBcIeUz57blJzUSIM/CKAwj0QW2Z83td8U3/F7L4NMVMMKafuJ4e/sNsep7g1YTH7kW2J2HMSZyajS6jK23RSIdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by BL1PR12MB5707.namprd12.prod.outlook.com (2603:10b6:208:386::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Mon, 17 Nov
 2025 14:39:35 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 14:39:32 +0000
Date: Mon, 17 Nov 2025 10:39:31 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Dave Airlie <airlied@gmail.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 Lukas Wunner <lukas@wunner.de>,
 Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 "Zhou1, Tao" <Tao.Zhou1@amd.com>, "Liu, Xiang(Dean)" <Xiang.Liu@amd.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 John Hubbard <jhubbard@nvidia.com>, Jiri Pirko <jiri@nvidia.com>
Subject: Re: DRM_RAS for CPER Error logging?!
Message-ID: <20251117143931.GA10864@nvidia.com>
References: <20250929214415.326414-4-rodrigo.vivi@intel.com>
 <aQEVy1qjaDCwL_cc@intel.com>
 <BN9PR12MB52574F4EE2FF679D2230BBEFFCFAA@BN9PR12MB5257.namprd12.prod.outlook.com>
 <aQyftlgZN11YYQXy@intel.com>
 <CAPM=9tybY_LECdMNH6iw5pzxtd2=Z+4vwLt-_kuMQFUaEXsdpw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9tybY_LECdMNH6iw5pzxtd2=Z+4vwLt-_kuMQFUaEXsdpw@mail.gmail.com>
X-ClientProxiedBy: MN0P222CA0005.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::8) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|BL1PR12MB5707:EE_
X-MS-Office365-Filtering-Correlation-Id: ce93ee60-2193-4bac-b86a-08de25e71ed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MUfh+9SOTZrWs0BcJ4TpBvcP9EiJsHIY+jO2Qm0vMmqrlDFy3uDqYKvq3Ps6?=
 =?us-ascii?Q?4lvEU+oMdIH1rE/557PeQl0A88kcgArFU1oFfJN777D07+e8SJOxdzCnZQ7p?=
 =?us-ascii?Q?ZCMixscCHadXssMvOP9i1bonp703+T5Zef2YFKdIkILzeB5hfJJOAKz+QKFA?=
 =?us-ascii?Q?W7U23vOxNG7tYSckzcsMefJ9H+bKtxeuxqLJZZK9c8Pgy1ktLulNaFVgbFWG?=
 =?us-ascii?Q?9t+LBllxVTv6AHqaR649kiCbB5OyoAOHTU1zfuMleN5fxZi1MQkVXF1638k2?=
 =?us-ascii?Q?FBSsd6NTDqohD8t1m/Cz8rqt4Ztye4u5k9nwN+9BIt3s/Fpr6KLpV1tYjSQ7?=
 =?us-ascii?Q?cHrxma16rWlxHqWaWI22aobpANbyrfb//MKrAkini39wEHbcm9rThZBU4EW8?=
 =?us-ascii?Q?8PxtMlwLJ9SAvytbOpLw0qzonomf+UaBNzqwfFbaK97jCFUKs3VjXUlJUYeC?=
 =?us-ascii?Q?JaWfusasc1uVdoRBpMQNyBfZfRGUfNVPKRFivGRhvbeiv2xAMz4VUjP+bAgq?=
 =?us-ascii?Q?O5hirCnBF/dNKZMAA3wchIIkoiTWL2+nMfmiFTsu7eRy7KemaDtFu8wvLel3?=
 =?us-ascii?Q?hWGUerZ/QCHo64I1LhTurESZar/D6wvTGxh2+Q7dBpw5s05VWNyLP2U+UQKi?=
 =?us-ascii?Q?LV2SZVxsJjNXVU2W5FeL+qlpGEdW0d7p9sxG5nFTlZnH7AC+Wua368FP8pjU?=
 =?us-ascii?Q?PBZzRDJbfEoe++Eyq1WXx5U7G+oadU5dvo05mm/QzSbNhCBsPB2f2KoXFfKJ?=
 =?us-ascii?Q?w847sk8qzrxolQFCFnKxMWn8OcY1DQs3I8jr8rUzJMfEim+EdJIzk0IBTDHI?=
 =?us-ascii?Q?yjNKXrQqjVjMdQKG30m+Xi7dr1DkuHdLXVNCmLQyTXOEFvk43ayvdCvC0W10?=
 =?us-ascii?Q?qlB7oiIbCMfHLKdYBidsr+rilDObw0iPgqTHA5L9fUbwmOIi/GpfajkTWkWQ?=
 =?us-ascii?Q?qLPKiQkHHfA+a1e/StvYie6qNSrH+r1+yexREOhOrn4V0baUY048SmsSOWMg?=
 =?us-ascii?Q?zWNb5BMVhCibD6aDVlwhDba/hC4GZC+RkCk2HLMjEItJidsBzADPPzJUIZxI?=
 =?us-ascii?Q?Sp+Kwplfsi4rnISTns0At+vJuhkM+NpbE3z2v0wmWxuggs7jF4wwJi58vqED?=
 =?us-ascii?Q?VTfrHayiJjSW2H7dO2LHCkPCVt3W04gpmDVsRHxKPMT3y5Te97FGzqxMMkNG?=
 =?us-ascii?Q?/5gjwVoErqpNINpPYI/YVnSFg+cE3UNa0Rxz+B+/v8qCfDWYYnmyr2td1TON?=
 =?us-ascii?Q?8rM1ElQ2VbjLmtB2ZFqzD3GV3Alzt0UO/VLfWWaK+ainmEs1wM5aqwLXDDeF?=
 =?us-ascii?Q?akg2ucMfGagI0EQ61atN2MmNSot25TxnwLW5kOSkLjV0e3NduqCHt0VMqvQK?=
 =?us-ascii?Q?p5DLF2uT9m51igmxSD4wXZ0Mu9kYyjNx9IpYlV3tqbFxPpAxdZ7Bjdiag6og?=
 =?us-ascii?Q?26pfrC6UswgLQmCduO+3q5X5gk3qItgf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1Ty5D6a8Jdrniv/tN4bYdCerQiD8s61Qdg5CiyYpJady/CaVSvhaWUL+OAN8?=
 =?us-ascii?Q?5gYwGXid9tMyP3+Er6AIjvbNHi17wIgWwC/nSs/s9MDUAAP5zJ4diw0Lhw23?=
 =?us-ascii?Q?zxA6ZP/9yT5NmPbAnmN22+MfxqTxaPQ1lA2s0nP0UA8pVFAOnMS7CSjNfa0E?=
 =?us-ascii?Q?vUSY8UaYT4LiMfmdgW8E00lIp6cxezecSYpoYIqNgfFDHgbIeWgAhxN7j3He?=
 =?us-ascii?Q?nhmqqQtdOJVrNpDJjl/tQWkkvrx+MQTNP2VnpqSzHHa9V/LSkVvG31x8rojs?=
 =?us-ascii?Q?UN5flyIHWuKiUxcsActI1Yx2u45kXSH0fKQStr9UaGmqH2+HM9EuJGCSWSiY?=
 =?us-ascii?Q?f084j8A6sRrGfGTFXPP7QXk4hSDbKPZF3H6MyxnEooBGffV7pX1pc3a52sJi?=
 =?us-ascii?Q?Nl2sR0hFfDPu8RRcNJHIgtQm+FKdSyl6Q8Rlx+GeodwBrX+EiuFwnNQqj1le?=
 =?us-ascii?Q?zCqgGmiDQneq3uKco/eiWN9n5UEdn0CNR5ebL428/Ash3MH3kvMmcpxHo82G?=
 =?us-ascii?Q?3VFvTLnlBWB3kPFRh/bSOFUzQ8Yl1ty1Fibz4NA6m3xvEA2tWYu2rZ+rIDrg?=
 =?us-ascii?Q?YTrVqV5jfBBx3aN3+lobHUBqBZ5jjXt1QVwsSoSDUHjiirWJTZw5Miaz4wpU?=
 =?us-ascii?Q?+U6qpYdSMPNWKUD5l9eADh69yYexb1CPMTq2sEK6KW7d9oC3v/204sW50Yfr?=
 =?us-ascii?Q?j0Nj6fXOsNQ9+2WL/zooo/o5BmKyi8hajbJyL5qVMI7g1U8oBN+a2kinoqG/?=
 =?us-ascii?Q?gTl6FIx/RF+Q7GEHYQujYeBBgoKQwQdi7u7+C8iz7vb8Cuflhpfelq63SY7m?=
 =?us-ascii?Q?voZYojFAhhzO2dorufoykGXI7XHCN7iVLSvqTE46c6Qcga/hxu9lGx978ht+?=
 =?us-ascii?Q?dMGR0c7RTZg4aqMW3BkD+M4t/y6tsbL3TH0JlNlA/AzfOHMxg+tICRgX6FoZ?=
 =?us-ascii?Q?DMCpcjcobW0LYwjeSzLMB8WD06hqrHzYMrK4kBO+dulI9AmzJBFOgHPozQam?=
 =?us-ascii?Q?olCUl1wuoRv7TFa8aE0tfgElnEaV2LorxtHoUow89NhT0nyQZIfxiF67IpQd?=
 =?us-ascii?Q?7Y+GN24/++ZwWYXpmQW+95T0szatwJCB9svH4MMbqsAYlF9SRm2ik9RvC+7P?=
 =?us-ascii?Q?6uGwqd+XGHpBW0KuVWYDN77mHrQqSGcsdsSx4Of+KMHsen6tMjtkLAMA0fBi?=
 =?us-ascii?Q?jvrNXKjTRunW61QlhcBtfhM2tVtv+u7JefYKHz0WKtvZ+x19N3ZZU/ihdVva?=
 =?us-ascii?Q?CkinMisNrwG6HUN9vs/kyyyY3xHpqW4UIBucAJWnGCcDb0ozwIq0f7SkG9gH?=
 =?us-ascii?Q?OSOC0TmM31+hrdZUsJviNXeXa9/VT5KaburNxJ3+ZWvM0hQ2zgvW1oPN9WGN?=
 =?us-ascii?Q?S4CuaMwUNVXsPB0FSVUr4+jOAZeV2zaCYw98+67HpdPqNuoGN+Bx9t0rv9tI?=
 =?us-ascii?Q?cTu10haq6Yr2a3NgYR1ubgNNFz7SW3cLjaLWAHT4+l7vs7S9OXBlv2XItDDQ?=
 =?us-ascii?Q?TMbeL0IDW2aJgDZm6YZ6F0mWhPUONzTIyKmaAjkkMfW1qJ3Z0f1mTyLIaEtU?=
 =?us-ascii?Q?/8MRILsRQxbL24gedOY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce93ee60-2193-4bac-b86a-08de25e71ed4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 14:39:32.0275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LL4dK1f+uRND4hMylNHLYDOs8frYHkoyzHZ/awzD6BPQKpeV+zbO7gKuV5q8cV/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5707
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

On Mon, Nov 10, 2025 at 01:34:22PM +1000, Dave Airlie wrote:

> I'm ccing a few other people that might have opinions on exposing CPER
> compatible logs for RAS purposes from devices, I assume there might be
> more than GPUs wanting to do something like this,

Use devlink health? It already exists for enterprise HW and has an
ecosystem around it.

Jason
