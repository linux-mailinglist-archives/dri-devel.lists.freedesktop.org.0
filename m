Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEW3OMCMk2mK6QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 22:31:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1884D147BA1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 22:31:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467FF10E3F7;
	Mon, 16 Feb 2026 21:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pF1O+KSg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011068.outbound.protection.outlook.com
 [40.93.194.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75DB10E3F6;
 Mon, 16 Feb 2026 21:31:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jh7Rb//AaLwCRytYpPTyBEfsObE2k5uU5jFCuUUaYI1XE0KKP1+PYZYnR5msn934lUSuIEuemPL2ZyDo66ooC4dpcz61UVHAL/56elq65ULF93s2NdrZ0zL24zRJzT/5pyug7RMS6H+CCnEHJ2U9RD+TxhZpjKwBy5XH6LE8ZzxWCTOvExcbijGMzWLBF+XvDPKx49sGMnXI3m/Ywxgdkl6XLN5Yf0Kof7obeowqS5CYWXRqyGaQMEWtqNU+nNU4a+pmvMssPuXIgU6L/AUCcydNxKORtk7dbALPwDH4+F7G3R7WaQhs8vc+ZVlXjGHQpR04xnlbgfQUitx5Z2mRww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+hLPNvgzuCb+RgbY3wM1qIQI/xLRR2pVY9BknF71ag=;
 b=ToafYaTooR7lblS1b/KkphRfZujBQm7RNF/wYk14G+gpFH6mibHxknFrvd30U5evVwJ9KoBzxIXKjNGaqhuI4QMnZ8APlyDV+VB82QZYAl/5yYvUsHS4X4wCUE/sCVmY25BFEicRQc7EPLDnjcIa2NiepO+gYvy33AJWvcmAlNDstDK90aQ1/svj7dpqKKOVT9S8PdKdZ9x8EVSFEfqbulbcEy6+ViJvoTLOZhk1lJdY3AyCFe1TtGU4wgb/LUxbuYkbMkkxDhEEkjaW11VTRPKA6U9mTMzeeZNqBX34xwUYsov3HBSnEKCzS/PJNNbGVXFL+WORYMbD71DcAU3qdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+hLPNvgzuCb+RgbY3wM1qIQI/xLRR2pVY9BknF71ag=;
 b=pF1O+KSgoYP52exiEyVlW/sZ+/JiInfZHP8bg4Q4G/tw3Iu6mTy0BjdiJiMtDUKyGUCUidRMQmOU8499hWBAgDqsomoOtZppkZz92cIZoGv5BsObngBVRML5CukWFIL7AMaX28067p5y6K77eTAYfdrFZXWOUZZkpMP5gaT46QIfSqil1mOISAL3kgKyZz6iFZSMAG2wYImUAs/GwdIzpoVziQLWKU5rbXHvCRqIyM3qFHgzz2qzHe9Gq1qYI+F3m2fD9XzJkwv7qIrv90JJ4LeYiQHWa2C5gyQTJUzZVZGfnwi7yN9yHaQ2patQ2J5xgJupd2M10vUGNwa/flSnJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 LV3PR12MB9403.namprd12.prod.outlook.com (2603:10b6:408:217::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 21:31:36 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 21:31:36 +0000
Date: Mon, 16 Feb 2026 16:31:34 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Koen Koning <koen.koning@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 intel-xe@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2] gpu: Fix uninitialized buddy for built-in drivers
Message-ID: <20260216213134.GA1435833@joelbox2>
References: <20260213152047.179628-1-koen.koning@linux.intel.com>
 <20260216111902.110286-1-koen.koning@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216111902.110286-1-koen.koning@linux.intel.com>
X-ClientProxiedBy: MN2PR14CA0014.namprd14.prod.outlook.com
 (2603:10b6:208:23e::19) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|LV3PR12MB9403:EE_
X-MS-Office365-Filtering-Correlation-Id: 7435ba19-17ba-4adc-e8e4-08de6da2c32d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qXEPq/ftwlAfjeLOdv8D8Dl7psjtrUI6uKJLevaetKvPbB1gRLous3kuqgLI?=
 =?us-ascii?Q?mDD9CqLr283KrImosRd3GSzStvnG+mfAypnjrObSEiCh6mx3slCaaNJgXwVD?=
 =?us-ascii?Q?Yv4gF9MFmSitvwvcIuVgce7hJ0HRgLsbGT3+wSf9CJt55kLY78qQT6bnwvrb?=
 =?us-ascii?Q?Vy9oI1t5Ep25eygn+rz5W1zwh/aiLaQoM3DXBp60teRnxSxqcrojjo7XVe5A?=
 =?us-ascii?Q?uHEA8m/zzE6YDhUcMXLeU7xh6wYGEHoV93ynCtj/XHKP2njwngKXJoomSORO?=
 =?us-ascii?Q?FlHmKV4t8EWzCYsnQUc4MC2itDXihLyMb3yudQaozB7pVM9KQEyIE0wxk5Hi?=
 =?us-ascii?Q?+kalH0GIoxZ1ctNtxXM9i84TlQXmJb+xOtJf2hQAsACOLYL1bG0jly8XLM76?=
 =?us-ascii?Q?LBcYgiapnE6toar37094wZEFBK1PvjP5RKt8mxIvqL3HaMl/buKEzfL2AHDD?=
 =?us-ascii?Q?kYNvtqBQgrraa6Xae2hiqbKcM8pNCnj+WeyBHttISnDAJYbiSgtqPOiOi5cx?=
 =?us-ascii?Q?f5iZyJ2Riqs32AeLquStLAN20a9SP1EjYuSgq7ust1Ir2DeEIxsS/Q+H4JOv?=
 =?us-ascii?Q?N0Sr7Y54dflB/+XU9XkisViYKeRdQMa1RCFAEYFCeJY9CcYMJsBV0s2jkVgZ?=
 =?us-ascii?Q?INWwQGXSywcLCw0iaPk5Ia7iXdxFajJzLSl5tFH0yQedGV6g6/7VhBDpXUOn?=
 =?us-ascii?Q?ZoSP6JDS04L//cgh6gLrXu7GbSefIrXLLQEf0bMmme66bJ8vG6Vu6qMIdcIv?=
 =?us-ascii?Q?9Ku5++uCcE4xurzD/vyIptNwMnEitI1f1XNVG5KaAA4/8DQ6ZQ44JIQCDiLv?=
 =?us-ascii?Q?jt8liwnM/dphnGBx6+XWtMsNRMMIF2ICGM1xTnwNMaW3EVZcqV98Nk8gD7FA?=
 =?us-ascii?Q?DNaRUYLdKpkhBxZfndk+klRvMUi0xJeXq94DCg8V4riFNz9KOLVmE36BZUGM?=
 =?us-ascii?Q?2UYmz1COwouM6jNo73e+X/unWL76zKdaQZURbVaEfLWk8B2Cf34z94H3G9Qk?=
 =?us-ascii?Q?4fT4abUxwWLzx3mgpex3qksZkkz9WC9SQwD5WwiFoJKTbodRdMOo2txcWTp8?=
 =?us-ascii?Q?6RO+mw9O42gjRNOl/qY3efeG4MkPdAD/KX+zWjhdXkjt2YHV+eqZ99vACbjg?=
 =?us-ascii?Q?c2ZVBYF3QHm5k7cVODGyZlgxbyt+2wqBNp8tfNpwfrtNlACpv2bU9wwthv/5?=
 =?us-ascii?Q?YgCB4bCZntAyZ6sCL7CgxawyINf55aHMyVTffyXSfwDokstP3t39bCdiKM1s?=
 =?us-ascii?Q?Ty+iyXdPnXYOivNCPdoQnAr9BnNbJLLvNxMpZHB2Nl6mpzDwE+u6z5TJnjmi?=
 =?us-ascii?Q?Ch0H7e0ld1qsG+/XfsxBYEJN1hz3r+JssMP6mgfPocajR5uEnYwCab48X+v+?=
 =?us-ascii?Q?COfOkNtEqEtuYnkUkcNZQcPPWIo+9rb2JRV2ozVMs5S+6zzBV0tdJurjsMtb?=
 =?us-ascii?Q?PtcTwGxnKZ7BT+yNJS2KoeKx+M8xDIhPALrCT1j+UW4u0UYVReL9E5s1kQ40?=
 =?us-ascii?Q?3R4a4H9uC+Y/ve5KRDLjVLfopZMRhFGcBoYk51eclSc+XRYn2mSseXiZ7La2?=
 =?us-ascii?Q?s+l3pUvVvwVWnD1vCtw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J8QE8+B+durRxY0o6MGuaP3v4uPOF4iMNOoKSH0ZM8/EkMdm6WvxMYrT0jGQ?=
 =?us-ascii?Q?wIIoFP6d1KQZUyu25yZnkf0mJ8N0utha43oi9/KyzqHf0S4HDvJKp7k9ToD8?=
 =?us-ascii?Q?HM00JM21z7+u764+m3BOz1jNL6MRxX8XZGu8aE7O4S3g4lnuVhjnXG5/c7Jc?=
 =?us-ascii?Q?VwsBPqV6gA4KI3FEoOHCq/LcDPb2jBAzUrif/oPZp+kG74ZVeoqGbswqJmWU?=
 =?us-ascii?Q?xj+va78xQRJC/48ltTnjL5mWQXhy2YJp1D863y5hZM9LLCGsX0D9QWzVHAic?=
 =?us-ascii?Q?bUdTSCnaQ/yxQO38YcIJ1Vn4PCBN0nmYSKJegXUfY+SZ2i54Cf1OwL9yFSe7?=
 =?us-ascii?Q?f5+5Vv0Rr76eg1Th37AGPrxeFBhzaTknvJhudGMM1CU+64wxg0bS/8aY9y8e?=
 =?us-ascii?Q?hpE8FTdRXTyfERLfH5MuW5XZiEybjE1klxqGBXKtNd//dkvWQ4QR0L7iN/Dx?=
 =?us-ascii?Q?1KUgw8ZDw1Ajef3CXo9JrpK7HuiZFMWM09Bp3H7QvpdQ+mDntesuwWHgQX7h?=
 =?us-ascii?Q?OCgzni4M2eIoNNKFyk5JaNspUiPc10RIjL2u+zwikphL/hHpUUv4mwK6BzgO?=
 =?us-ascii?Q?hbNyqDPabnS2UcxG8JumEtAJbHbBmJP7u9YYiStagCrbFsK2MUnj4kwDSfMd?=
 =?us-ascii?Q?ta7A9nci8lkHuiExh0VDDSag1aHSv7TAf2agK4GCqoIDMSnBD79i3A7n4ynj?=
 =?us-ascii?Q?fJEhatS5qDWkcR1tmCKkKNcqjlb+qC35k+h5XG9eyTFXtXc/irFqaYQEoanN?=
 =?us-ascii?Q?j1ePWRF1zPJyysMPGh0JsIAtmGWJE7CJf8NRd5AOJlKRpdGTX9SkHH/htEcg?=
 =?us-ascii?Q?U0PJk6YqJ2KFm8zU5VW8OvRap/9JsdQOMhw4kPBE3G3j8Y5X+LNkYlaVCstu?=
 =?us-ascii?Q?c5zfwcgIE4CpudPt8iDMjjcR5ofi0ki5flnDGrBpY3zNFN4DBYJ5UksTq31y?=
 =?us-ascii?Q?RYFjqjsBwnlURtC3s3Aosh6kWn8KRm+HVT9ZgI6r94luXgg4+zhe1zO02FCX?=
 =?us-ascii?Q?NNYWJ0oX7SMJVQaaHBiorSJXx4BKF5O3DmFTX36R+YV3Fqv1LWb7r1b6rot9?=
 =?us-ascii?Q?XItEaz4yByvHmlh5RHVZOv14+HTSatdkNzR9CcSUiEEcp8hUQppOK0PY0uDD?=
 =?us-ascii?Q?9NNdy9BvV2qbKswmmwz/1s6dEx6f1kWaBhHMs4rOuneRoIaPPY0pyyeqbSqZ?=
 =?us-ascii?Q?bb28Zc7NwEJ1i36VtYh/z41PfCjsouSQmErolDmAxTKZoe5afdbGG/L9EEmE?=
 =?us-ascii?Q?uIdgtYXx0zDqho9e9pcq/hVNzSiJ0JcBbny6dfKefLO1D72La1oaADiUM1WQ?=
 =?us-ascii?Q?JOPIXv3At7ZKxHCu/65VkedYeGEaxudwqZPvgRklofPxqlT4FPmVk8qm9adH?=
 =?us-ascii?Q?IdUBfqDiYFetDuCmp2uw8VCZq3s+LTCE5M3Y/Y1O4oBetHbpFgDwp9QqkUGS?=
 =?us-ascii?Q?X1aXTiudRjbO2N+th7Xu9uuK1QHlC2MEFrynFPud93E7ivX/PbBsJZpuSVpF?=
 =?us-ascii?Q?NF/i9lg7/yseVjF8bmujCIBsnk5tVJMpsk0LLMp0SThAoWpL1c5SD+xE5wPB?=
 =?us-ascii?Q?wHyZdpHXDmZMO4IV20cVg4QWiaW6alnl/vpZkYEqECYF8RMWrPAg3OF3SyUV?=
 =?us-ascii?Q?6oPUUV+EFosfOWCFWcTlgetD8wHk4gEWnW9isdtRfb/t62GXc4Y94CoTzSe/?=
 =?us-ascii?Q?E/EwWO1RVGHu1GxVtGK8eYcVQT0f0KaqxLqv49F+eMK10i6On0/20hXHyTIe?=
 =?us-ascii?Q?x579+a4y2g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7435ba19-17ba-4adc-e8e4-08de6da2c32d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 21:31:36.0843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NaSstV/cLuFUxT4TxWUKErgtC/fnvfPxZJHSdYW8t3W8mqrOy00+B0bVkQa9R7VJbh5jUJnNADQpSMfJS1y6DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9403
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 1884D147BA1
X-Rspamd-Action: no action

On Mon, 16 Feb 2026 12:19:01 +0100, Koen Koning wrote:
> Use subsys_initcall instead of module_init for the GPU buddy allocator,
> so its initialization code runs before any gpu drivers.
> Otherwise, a built-in driver that tries to use the buddy allocator will
> run into a kernel NULL pointer dereference because slab_blocks is
> uninitialized.
> 
> Specifically, this fixes drm/xe (as built-in) running into a kernel
> panic during boot, because it uses buddy during device probe.
> 
> Fixes: ba110db8e1bc ("gpu: Move DRM buddy allocator one level up (part two)")
> Cc: Joel Fernandes <joelagnelf@nvidia.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: intel-xe@lists.freedesktop.org
> Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Koen Koning <koen.koning@linux.intel.com>
>

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

-- 
Joel Fernandes
