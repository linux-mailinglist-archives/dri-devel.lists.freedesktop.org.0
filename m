Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF575B8EF7F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 07:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C0110E3A3;
	Mon, 22 Sep 2025 05:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PcD03iZC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012049.outbound.protection.outlook.com
 [40.107.200.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6395E10E3A3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 05:00:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d7dsfSu9iSGuUbjUyorx0ab4bCff1BDUkbWU5ZPGL36SYFE6Ut2DxEC3ejiIvmdmGR1tsxsdILrnAySlmVgU5Qwz8HJdfeowTs+QzCFX1R721pIsROqIvNDr9t/wt7edslNNjSxdCkLPn0wGTrx58LX+4oN2dhpPRQ3sYBkZ2XVr6iQI620H2N3Fy4EqPojjV5v7wFoRzWQ0jGOM6prXqA2u4o5csiRctA608+9z0uMeeSs3yJDCD6BJyvMISQGUzpY0V9SJa6z/GsCIbAqGYRhqSky9hNbZQJ29qBnFBDQBZ/iWtsj97Te7huPoqDxpIPXrAks7evbaxgLwBSltxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbsleFoZ+xUR7tcvCPtcqKqvwAMMr27xQvyLc8ynr7w=;
 b=bOTAEoz9wfCZQv9bnOSXmUK/+8jyNHBjtMit/+3BPHCewPAuL5OlaZGoQD10lRUQGTetOJ38iOy3D5B7GVyhJdgWIGkcNwlXNzfS/UiawwxXCZyC8BGxhjLE0iCwh30TN9mp06/KrTBZWkcOhV85AjooIoNySxXsCVyt5zkl6mmu7BHnaD7q6BcT6vqeOiMpwJS5NwW/Vr0HjcU2mbbL2LmyCymhId2B9Er59Sy87ozv8xV9n8bbBhSBF9ZwXzFvqdaIgpuDs3tVOBQx1odG8wVaK9raksK7Jd3VNSP+4XNWhTzx9yZO67pZPyba5fN5C8XT2UszfMQopgWFCiM7Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbsleFoZ+xUR7tcvCPtcqKqvwAMMr27xQvyLc8ynr7w=;
 b=PcD03iZCCK5NhfotcQuPIaS2fSOFwzV7TiFWmFdnLaICIfZg+BYEvDNHnZ2s+bRZq0i+RKk2sFWs76q6mIODa8NuR1iqdRUBKqV09lYmzgkgLTBAs4aJ9diI7OrtJrSL9odgP562P3NLtYrB+p7gY5rjj5USUKFJafI4Pz0C+qc0/gCgCqYw1wnpNycRaXD/JMuOB0gTcAPHbQLpIabwTSQoWZOVa60VzDCkhTgwYZC7c/x7lgMvj5c0/CjRHqA3GBEwpdMZEiR6bdpaZ5TnERVj5G8g7wGcqFib4fYI4TdiOYpJ0dvWQs9fQ1OYNY24FPW3oXpG0LvU+FJSEObtsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 SJ2PR12MB8832.namprd12.prod.outlook.com (2603:10b6:a03:4d0::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Mon, 22 Sep 2025 05:00:45 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 05:00:44 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Jonas =?UTF-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 19/23] staging: media: tegra-video: tegra20: expand
 format support with RAW8/10 and YUV422 1X16
Date: Mon, 22 Sep 2025 14:00:39 +0900
Message-ID: <3835298.oiGErgHkdL@senjougahara>
In-Reply-To: <20250906135345.241229-20-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-20-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0157.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::12) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|SJ2PR12MB8832:EE_
X-MS-Office365-Filtering-Correlation-Id: 29b1080c-2918-4e62-7fdc-08ddf994fc80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ay9pYmJoWjRLVUxyZ2NCVWVOcmI5SGxLekk3c0hFbGlTOE1zZUhEa1ZweFQ5?=
 =?utf-8?B?VERieStOZmFLaGxNZEZtcnZCZklwWkJUSHY3cFR6dHE0bStBSEJwbTRhZzk2?=
 =?utf-8?B?eVdEQ3ZnT0JYc3JHclpaU1JiTnQ1ZDNqTXRSQXQ5WjZ4N0JCbzVzRXB4dGhR?=
 =?utf-8?B?ODh5N015NDVXLytSZi93akhQZ3BlekYzRVJScWZyZTJLeDFRcWt1R3hOMmxq?=
 =?utf-8?B?TEU2YUU0S0FRTHpZLzNnN3BiNnhnTHFuOU42eGJYODFWbVhGZHBwaTZaN3Ft?=
 =?utf-8?B?bU90UUMvU24yYmNyNklqVUE3TVNGV0kzaTgxQnEzcnF4RlZBRFpITXZDZlRH?=
 =?utf-8?B?VkNsWGczekpSb3BBalJxb0g2VERES0lmZEtmQVhkdlk3MTdYM3FHZGNCYkU1?=
 =?utf-8?B?ZS91Y3ZHL1dXNUFPVFlOdytKeEJiMTFyMlUyVVM2dlB6ZEE3cjRZalhod01y?=
 =?utf-8?B?aUtubXlmWnJPc1R3dnI2NFZLdGljaGpZVlBFVWFSaTBJdy95M0p3aFpPd0FY?=
 =?utf-8?B?alNUeGRtS2VOWlJJaGtoREFkeHVMZkVDcWYyMkYzVmo5LytpK2lWOXhwT2Fr?=
 =?utf-8?B?VDdYcXRvdDEraCtSRzN2ZkJTbVVEb3RGb3hTQ2xLdzJyL093T24vOVB0clN1?=
 =?utf-8?B?KzNEdjlzNVRyRC9QdXZGWndkYWc0TWVYZWtBVG5HelZ0SkJua0lRMitXdFNh?=
 =?utf-8?B?RDJPZG12OXRZVDVxd2R3enJlZmZ0K2dDYVRFUnBjUUdDcUtEbEVTaXVHenY2?=
 =?utf-8?B?VzJXaHZqSnR4eGRXUDh1RXhmNjllL20wajJab21BN0M0RE1xSSsrc0cvTS9l?=
 =?utf-8?B?cmNsb2dxUG56Tm5IS0htWm1DeXhEMjkzZVhqWUlsbG5vS1pCVThSZmxLMWxs?=
 =?utf-8?B?RkNOWU05aUJyLzVDeHBtYWRKZzBFZW5VN1ZtbTFCd3h1ZEwvOVE5TElJdHhV?=
 =?utf-8?B?NldlbWp0SUNYM1dUcUVCK2hQZkZMdnhLd1pNMkZFeFpXOHZZN28wWEJsVE4r?=
 =?utf-8?B?RWhidDkxYldnY2JCVFBFT3lLeXF5Zy9YR1BOTHE2K0FwdFpmTjRzWUlrSEhi?=
 =?utf-8?B?UzJqeUx6SFhwdisvUXAxMmxLemRXbG5KU3RxdVNnaTU4dFlGTWxrVk4yWjNG?=
 =?utf-8?B?NXUwdHNqNnFOcHdscXM1OWkwUEJtY1ZuTGVTQ0lyWXNwa2kzRDg4YXVYcXZF?=
 =?utf-8?B?aDNpc0lJNStDS1JDZytJbXZoMGpmRnUyY1JoMHFtdUlVbUJSVnpMNDRhQVo1?=
 =?utf-8?B?Z2VtQm1ZUXdYT2hVN2FkYTlZZ3ZsZjBCRm9CZmNyMm83K2xHZHFtRU1KT3pR?=
 =?utf-8?B?K25HU09nbUg4Wityc0hab29sV3dSaXZPVElVUGRvck1RWXdYTGdEYWpWdnpz?=
 =?utf-8?B?WGR5V1BRSWtiSDQ1bUFYRW5mNEpLM1kzTHZISGpEQlRJdUFaWGhwZ3A4UlFz?=
 =?utf-8?B?N1ZsVHpWY0FZZ3FJVm5QcEhSK2Z4cVltMi9aSGI2Q21WR3dpdU5Vb3g0SVEw?=
 =?utf-8?B?SVRSTlR4M0hpN3VpdHRTejFuNEpJdTlBZ3dicmRIcjdHdjM5T2MxNmd5ays2?=
 =?utf-8?B?OVg4amwxWmtPK0tkWGE0Q1h0dWVBS1VLU0d3SklKUkwzRVlsbFZjMXplRnJk?=
 =?utf-8?B?aW1NaWJ2TDh0cnNQN3c5RVVXRkQ5K3MyUTNveU4vTTJtSEpHUzJjeHhKWHlH?=
 =?utf-8?B?QldNc3Q1R0RJN0lqMUYvL1dLUG1tMVRrbnBJaGdoR3BTZzc5L0lIMk9KWEhq?=
 =?utf-8?B?QlhSdDJUVS9JNE5CRU1tRFNZeGRtcUJEOFloc0ExSmFDbWFLamsrdW1ZblZS?=
 =?utf-8?B?bEZaV0hxNW9Zc21hQjFLcHJ3ZWtycUhyZHEySUZrSlJVN2dhNENFMHJWa3VX?=
 =?utf-8?B?SVBNS0ZBWlorcVhaWFJMcThBeGpidjZITXQyeEF0T3dvTVAwQ2ErdDlhNHZC?=
 =?utf-8?B?RnJGczRIV3VnTndwNU52TStGZDNlM0oybTNZdXJ0c2dPL3B6RkFGUldJMGor?=
 =?utf-8?B?dERsV2tBOFJBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q05kOWNrYzdvUGpuRUVjTlpib1E5L1ZXbHZGdmkzSjFPbWFCMGM5cXU2T0hl?=
 =?utf-8?B?RWQyemtFTnpSVENSajVHeDN6NlNzZkNoMEs1ZXZDbGd4SlNucUhCRjNpNXRE?=
 =?utf-8?B?N1o3N045N1FwbURrZ2NiM2xOOWppb1dhMDdCdjNZcWg5ZWQ3R2VCckI1d3hJ?=
 =?utf-8?B?ckU1ZURQamlCb1FERHMxVDBISHBZcGl6ZWYwVDByTUZsUXJnaTJHNjhCNDlG?=
 =?utf-8?B?S3VEZWE5ZVl4cmZneWNFVk9XblRFU2MvaTl4b045VjVjNEUyLzFKT2VLNGZw?=
 =?utf-8?B?WUNodDRJWXp6aVBFSTNraThPeEU1YjJyL2tvU2ZFbVFvZk9FT2JzQkVvdWpa?=
 =?utf-8?B?WXh5blhPRDJiU3NjMHdDR2U1T1BvRnNPdUJHVit4YldGY2ZIY3JER3JYUTNv?=
 =?utf-8?B?YVg2eUFNa0FIV3Z1dWVzZHBLMXBaTG9MZWFVUHVKcFBPcG56WTJNejlLTFFt?=
 =?utf-8?B?RHZyNXNlZ1VGSWZoLzh5ZVVIdFEzSGRkNEFCN2NGZUVCZDdkcDU5akhmR1By?=
 =?utf-8?B?TVcrMFlTZ3JJVms2WXNyemxoK0RmUlFPVC92cm9NSmUzdTNKenlhOFd5VTU0?=
 =?utf-8?B?UTVtSUVGSDMxdThpcUY4cHJ0SVRLb1pyRFZ3eWNnM1lpeTZ2UlpZU004MmJV?=
 =?utf-8?B?UmVyL1BtWDhBd0xPNXRVenVCbWU3bmZJY3N5aHVWeHJZdnNaWC9CK2pkTUs2?=
 =?utf-8?B?T0wyM1c4ZUI5bkY2Q1dKTEE4U2VVa1NKMnB1M2FmbDdpUmVRaHR2dWxsenNN?=
 =?utf-8?B?YldtQUFDd3lwRTV3WGlKMU11TTBYRW9hSGgxOG5ZUEtRRitFYWZVSG9Sc2Np?=
 =?utf-8?B?d2pISE9nRGZmQlNOeVNOQjRPcndaOVVsdHZ4N0xkWjljS2poV1RaYzQ2R2xK?=
 =?utf-8?B?MlJzbjVRWlRmK1ZZQzA1azFHL3dsaHlnSm5sV2N0eGJiM3huVUpSY09vNUd4?=
 =?utf-8?B?ZWlIUnhYc1V3M0ErdEIvWU41VmF2aVBNVVIwQ0YvdDgwKytENGhXellEZ0hN?=
 =?utf-8?B?UzEzYmwxd0V0WUQzbmUwUDVCdnBqSUIrTjEzelE0eGsxTlAvRDVPQW10N2dH?=
 =?utf-8?B?VHFDQTR3dktYZndVZU1oSGJzNUpZTnI4VXEzdS9kZkJnbmh6dGhkNGRVOHVY?=
 =?utf-8?B?d01rNzZtczJWaEgrKzlEN09JMWo3WUpvZTQzdFZBMGswT0xiNVBoa21uYzNW?=
 =?utf-8?B?eWRZSG50NXlrdnFGN2g3KzdSNlY1V29sTCtNbVhzYzY2ZmlKZTRXSXl3TGlG?=
 =?utf-8?B?eWpxdjBiQ2Vva1pML1dmTEEzcHRnSDhwTXM2Q3dPbWlINkw3eTg4Q2Nmalpv?=
 =?utf-8?B?SUxZYWVCeDhHNmErRFhoclpZRmZ3ekZ6Q2RNM2RtQXZLZE1SWU1oWVFKeUF6?=
 =?utf-8?B?Yk5ENFdpbkw0T1dFeVpvSEdxQzNOelhqMEJZVG5yMENwK3ZkMGRhcjVXd05V?=
 =?utf-8?B?SWZlL0ZXaWZrNDVWdmx3U3lwZXhiMkJvdW5PcVI5K3JkQUJuVTNxMGpRQWlx?=
 =?utf-8?B?aG1Bc0Vja1dndUNxWSsrN2RnejQrMWpESlZ4SHQ0VzhCV1V1UDlUMnFhcEo0?=
 =?utf-8?B?ZFVIdnJUdmZGcG5qZmxUaU5WU3cyejl0VXVSRzhIR2lYZ0J3VFJMcS9uL2NV?=
 =?utf-8?B?YXp2aEt2d0U3UWZVOVp3QTd0Qi9ncXBxdzZHTnlkdnFCSW9lSWYrMXdhSEFN?=
 =?utf-8?B?aHhlbkNPWFpEdGR1YUhmbXc3UGlRUUUzcDVQODhtRDR6S3dQNWZQKzM0dTJ6?=
 =?utf-8?B?S3lDZTNOQlVnekcvMFlkWWh6R2ZhVEtVOWI3NnRKR0RzWCthUkthNlBPR0Iz?=
 =?utf-8?B?RU8rdlFETlpuQWJBVFl0RnhtRFNDdHd3Z1MvRDYrZzdQRzZvQURCdS9zQTVu?=
 =?utf-8?B?R21VYjhmaWZ4N2MzK2NxNXZEOEpvemg0emNPZkdRWll4bTgvSnJCMS8zLytJ?=
 =?utf-8?B?akhxOG4vMkVwRm1rYjFZQmFxUGxIbzJHWERxK0V6UXNqQytLSmpWUFczUnVC?=
 =?utf-8?B?Z1lueXR1TmhzQ1ZRNEV1UkFGWDVRd2tEUnlYQVJJNlMrRmlZRG1kS3Z6WjRs?=
 =?utf-8?B?TEJxY3RYS1FXVG9ZNDFFZEgyaTYvWmkyWWZlcjRQWlZYUzB4QkVIVmtYRmIx?=
 =?utf-8?B?L2crcERtWkdVZ1I1NW8rZ1hoMUdpQzcyUUZNYmNSajFnd2pjTXRBTjNwM1hV?=
 =?utf-8?B?Mm01Qi9qRWo4SGIxS0gwckt6NUl5VTFqbDJTUXFQcjhhYUN1K0tpVVVLVlpQ?=
 =?utf-8?B?RGUwOGxWVDViWEU4b1BhRkNxd2NRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b1080c-2918-4e62-7fdc-08ddf994fc80
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 05:00:44.7853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFSAzQYRa9QfTF/mI9I1dMRfkWQ+5LWh54SLNni163yC8ZtUbeqJeCTLX/LJGr4qLzOYNLK7ABOIOysY3iB6TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8832
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

On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyatoslav Ryhel wrote:
> Add support for Bayer formats (RAW8 and RAW10) and YUV422_8 1X16 versions
> of existing YUV422_8 2X8.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/staging/media/tegra-video/tegra20.c | 72 ++++++++++++++++++++-
>  1 file changed, 69 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stagin=
g/media/tegra-video/tegra20.c
> index 3c5bafebfcd8..f9adb0611638 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -187,6 +187,18 @@ static void tegra20_vi_get_input_formats(struct tegr=
a_vi_channel *chan,
>  	case MEDIA_BUS_FMT_YVYU8_2X8:
>  		(*yuv_input_format) =3D VI_INPUT_YUV_INPUT_FORMAT_YVYU;
>  		break;
> +	/* RAW8 */
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +	/* RAW10 */
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +		(*main_input_format) =3D VI_INPUT_INPUT_FORMAT_BAYER;
> +		break;
>  	}
>  }
> =20
> @@ -221,6 +233,18 @@ static void tegra20_vi_get_output_formats(struct teg=
ra_vi_channel *chan,
>  	case V4L2_PIX_FMT_YVU420:
>  		(*main_output_format) =3D VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR;
>  		break;
> +	/* RAW8 */
> +	case V4L2_PIX_FMT_SBGGR8:
> +	case V4L2_PIX_FMT_SGBRG8:
> +	case V4L2_PIX_FMT_SGRBG8:
> +	case V4L2_PIX_FMT_SRGGB8:
> +	/* RAW10 */
> +	case V4L2_PIX_FMT_SBGGR10:
> +	case V4L2_PIX_FMT_SGBRG10:
> +	case V4L2_PIX_FMT_SGRBG10:
> +	case V4L2_PIX_FMT_SRGGB10:
> +		(*main_output_format) =3D VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT;
> +		break;
>  	}
>  }
> =20
> @@ -301,6 +325,16 @@ static void tegra20_channel_queue_setup(struct tegra=
_vi_channel *chan)
>  	case V4L2_PIX_FMT_VYUY:
>  	case V4L2_PIX_FMT_YUYV:
>  	case V4L2_PIX_FMT_YVYU:
> +	/* RAW8 */
> +	case V4L2_PIX_FMT_SRGGB8:
> +	case V4L2_PIX_FMT_SGRBG8:
> +	case V4L2_PIX_FMT_SGBRG8:
> +	case V4L2_PIX_FMT_SBGGR8:
> +	/* RAW10 */
> +	case V4L2_PIX_FMT_SRGGB10:
> +	case V4L2_PIX_FMT_SGRBG10:
> +	case V4L2_PIX_FMT_SGBRG10:
> +	case V4L2_PIX_FMT_SBGGR10:
>  		if (chan->vflip)
>  			chan->start_offset +=3D stride * (height - 1);
>  		if (chan->hflip)
> @@ -366,6 +400,19 @@ static void tegra20_channel_vi_buffer_setup(struct t=
egra_vi_channel *chan,
>  		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_1),  bas=
e);
>  		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_1), bas=
e + chan->start_offset);
>  		break;
> +	/* RAW8 */
> +	case V4L2_PIX_FMT_SRGGB8:
> +	case V4L2_PIX_FMT_SGRBG8:
> +	case V4L2_PIX_FMT_SGBRG8:
> +	case V4L2_PIX_FMT_SBGGR8:
> +	/* RAW10 */
> +	case V4L2_PIX_FMT_SRGGB10:
> +	case V4L2_PIX_FMT_SGRBG10:
> +	case V4L2_PIX_FMT_SGBRG10:
> +	case V4L2_PIX_FMT_SBGGR10:
> +		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(TEGRA_VI_OUT_2),  bas=
e);
> +		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(TEGRA_VI_OUT_2), bas=
e + chan->start_offset);
> +		break;
>  	}
>  }
> =20
> @@ -447,12 +494,15 @@ static int tegra20_chan_capture_kthread_start(void =
*data)
>  static void tegra20_camera_capture_setup(struct tegra_vi_channel *chan)
>  {
>  	u32 output_fourcc =3D chan->format.pixelformat;
> +	u32 data_type =3D chan->fmtinfo->img_dt;
>  	int width  =3D chan->format.width;
>  	int height =3D chan->format.height;
>  	int stride_l =3D chan->format.bytesperline;
>  	int stride_c =3D (output_fourcc =3D=3D V4L2_PIX_FMT_YUV420 ||
>  			output_fourcc =3D=3D V4L2_PIX_FMT_YVU420) ? 1 : 0;
> -	enum tegra_vi_out output_channel =3D TEGRA_VI_OUT_1;
> +	enum tegra_vi_out output_channel =3D (data_type =3D=3D TEGRA_IMAGE_DT_R=
AW8 ||
> +					    data_type =3D=3D TEGRA_IMAGE_DT_RAW10) ?
> +					    TEGRA_VI_OUT_2 : TEGRA_VI_OUT_1;
>  	int main_output_format;
>  	int yuv_output_format;
> =20
> @@ -581,6 +631,20 @@ static const struct tegra_video_format tegra20_video=
_formats[] =3D {
>  	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
>  	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
>  	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
> +	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 16, UYVY),
> +	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_1X16, 16, VYUY),
> +	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_1X16, 16, YUYV),
> +	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_1X16, 16, YVYU),
> +	/* RAW 8 */
> +	TEGRA20_VIDEO_FMT(RAW8, 8, SRGGB8_1X8, 16, SRGGB8),
> +	TEGRA20_VIDEO_FMT(RAW8, 8, SGRBG8_1X8, 16, SGRBG8),
> +	TEGRA20_VIDEO_FMT(RAW8, 8, SGBRG8_1X8, 16, SGBRG8),
> +	TEGRA20_VIDEO_FMT(RAW8, 8, SBGGR8_1X8, 16, SBGGR8),
> +	/* RAW 10 */
> +	TEGRA20_VIDEO_FMT(RAW10, 10, SRGGB10_1X10, 16, SRGGB10),
> +	TEGRA20_VIDEO_FMT(RAW10, 10, SGRBG10_1X10, 16, SGRBG10),
> +	TEGRA20_VIDEO_FMT(RAW10, 10, SGBRG10_1X10, 16, SGBRG10),
> +	TEGRA20_VIDEO_FMT(RAW10, 10, SBGGR10_1X10, 16, SBGGR10),
>  };
> =20
>  const struct tegra_vi_soc tegra20_vi_soc =3D {
> @@ -607,10 +671,12 @@ const struct tegra_vi_soc tegra20_vi_soc =3D {
>  static int tegra20_vip_start_streaming(struct tegra_vip_channel *vip_cha=
n)
>  {
>  	struct tegra_vi_channel *vi_chan =3D v4l2_get_subdev_hostdata(&vip_chan=
->subdev);
> +	u32 data_type =3D vi_chan->fmtinfo->img_dt;
>  	int width  =3D vi_chan->format.width;
>  	int height =3D vi_chan->format.height;
> -	enum tegra_vi_out output_channel =3D TEGRA_VI_OUT_1;
> -
> +	enum tegra_vi_out output_channel =3D (data_type =3D=3D TEGRA_IMAGE_DT_R=
AW8 ||
> +					    data_type =3D=3D TEGRA_IMAGE_DT_RAW10) ?
> +					    TEGRA_VI_OUT_2 : TEGRA_VI_OUT_1;
>  	unsigned int main_input_format;
>  	unsigned int yuv_input_format;
> =20
>=20

Seems fine by me though I'm not familiar with the v4l2 specifics.

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>




