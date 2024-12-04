Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 883DD9E3F92
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 17:26:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D391710E02C;
	Wed,  4 Dec 2024 16:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tMSR4lR9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317C310E02C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 16:26:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZUt+MbY6SW4BOe0XLsnjPfvbvt+o6abfwBmob44JulcvWAas2/MTKL2MASDLko/jn4X4/9niRUBgxXza6eE31Fw7CMcjIDe+JjtkmsltZy0IJaAkmk7F3rVoLE4g/KWQfdVk8AGx1d8xoR3oY86EOUE8BYfD5oQP7VVre6ECqkW/OF4aXM+LH5qojWCSQudG9uRFpkFIeACLzgjUl32feJZaBUPdIJ3T6qysqMdvVyepe/KjFW7BVS51CFuJNK04G2tPIcsTlG8d3Ao5MvXctdTsB6XTrhaQNMmQciQlaW9L3X8EHiqZXhSKsGXi+MRWHXDIzpeVplPW7x2vYAQsug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZJCrYD9YkUx97upj7WQQlzz30+YC9RhDOBHCf5CRo4=;
 b=gUEFDXma5PW6DiwcJpAbMd7UfnifTgtFU7aRwadPyt70+g7ckNrwOb+TrRtTcjV0GwM6MqYjjd8bidzSM7lwb/SCQeIKdGoS00QgwAzSI+BSzp5Nbm0J544rxbWRRVWc2fQ9PR7fsGU4f8jhsEFDhsRbRwVje5SmYPCxo0AqtCNTDkbjNKT/c6v/7dVGMbsNAdRPCImKN9nGW6dQV5xcH6FsCu/OjDihIpBQ0Bx2ZOUE6/NRN5hXOM6Glm7UVoQ77nMM9YPqMjA0q9x7c/Uj2LgpSNKe3wTsMnniJIU7MX/hzqGqDzPIhvW1R6mhUYKiq5ZacFTVYyQP4HyFUiuIXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZJCrYD9YkUx97upj7WQQlzz30+YC9RhDOBHCf5CRo4=;
 b=tMSR4lR94SVh8OkK0L702/o4YvbwRLVa0lrSKPbzj670xgbl1ETRYk81JWkuIHSx4d3z3M3ik74WdMYb21a7rkVW+LPvz7yaC5EitYF2aMKGbJdJwD0VLg9o9iXl31x9gZbhE3edkHsT06U37hVXhqSIHfwZy1iDbkC2grzq2Js=
Received: from BL1PR12MB5969.namprd12.prod.outlook.com (2603:10b6:208:398::7)
 by DS0PR12MB9445.namprd12.prod.outlook.com (2603:10b6:8:1a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Wed, 4 Dec
 2024 16:26:41 +0000
Received: from BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::fe76:56e0:4c10:9a3c]) by BL1PR12MB5969.namprd12.prod.outlook.com
 ([fe80::fe76:56e0:4c10:9a3c%3]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 16:26:41 +0000
From: "Sagar, Vishal" <vishal.sagar@amd.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, "Klymenko, Anatoliy"
 <Anatoliy.Klymenko@amd.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, "Simek, Michal" <michal.simek@amd.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 01/10] drm/fourcc: Add warning for bad bpp
Thread-Topic: [PATCH 01/10] drm/fourcc: Add warning for bad bpp
Thread-Index: AQHbRi9UWUUHhEgKcUWmCkWx6YjrqrLWRD9w
Date: Wed, 4 Dec 2024 16:26:41 +0000
Message-ID: <BL1PR12MB596954886CC5E28EC8E735BA9C372@BL1PR12MB5969.namprd12.prod.outlook.com>
References: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
 <20241204-xilinx-formats-v1-1-0bf2c5147db1@ideasonboard.com>
In-Reply-To: <20241204-xilinx-formats-v1-1-0bf2c5147db1@ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=cda53afb-37a8-42c9-a136-6f04f3888a31;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-12-04T16:19:35Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5969:EE_|DS0PR12MB9445:EE_
x-ms-office365-filtering-correlation-id: 8d84a941-3b5c-4440-a60e-08dd14806f4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?VlZzNzFhWWtRa2g1dXZiRXhjRjhHVFVDWDVheGRSRndMVnJ4MGw3WjUrRmxh?=
 =?utf-8?B?R25vVE04VkpOUjhsVHdBb2hENXNjWXhEL1NhVUFuTXIwbkJlZUpWMERCMlV3?=
 =?utf-8?B?TjhBRUlLSXhzRkNNWEwyZm9TYlVhbnorU01HYmJKNGxSVkFKMDg0UXRMWUd0?=
 =?utf-8?B?UGlacXNyZ2tzaGpzQU1XbmVEanpCdk5FSWREZGRaZUdKbTdRRFpsUlQraHNs?=
 =?utf-8?B?ZUtNaUwvQkpYOVFZWWdUNXdXbUhibzlHVllqQ1o4TER5NVpmUW9jWGlsejJz?=
 =?utf-8?B?VHFZR0tiNDFOR3VWQnhFa3pDckE5cDRUcFBVc2VYb2dwWDFzRkF4M0djYzBk?=
 =?utf-8?B?aG9kTTZDTTRUb3hvL1lhbVIzRk91d1cyMFQweGhtcWN0Q0VQTWtZV0tjQ1BM?=
 =?utf-8?B?eTgxaERyQzhBdHdLTm9oWUIrYnhBbU9UVTZIMEpNUFlSeTVId1BKaDJtTUVo?=
 =?utf-8?B?dVhJZE9GSlpVc2Q2OEdvRklRT204ejlKNkpCbkZyRjNFODB1eGY4QS9TTHZs?=
 =?utf-8?B?Sy9zZDJvdjRzVFkvbWdaaGs2bGZsRGZXM0FEYVYyYzk2Zm1uVE1ZcFgrRWJT?=
 =?utf-8?B?ZGVvYzZVcHd2UngzRWdRVnoveGV3S1RURGRIOFY3Vmp6QTkrWkx4T1dsTzd1?=
 =?utf-8?B?ZTNzOFE2QkU5T1V6RVRKMzFIRnVjRG04RDBiTlhwQzFYaWFlYlJ6VTllL1VG?=
 =?utf-8?B?MzI3bFdEWFFvL3BNZlhjekkrK25uUEljcE5JdE55YUZEVnFRN3B6bExIVDVt?=
 =?utf-8?B?aFdMcW1ZQ1JESG1rKzBBNmsxR1dVMG5ZUzdGeDdSaG9RM1pvNTdzN3k3L1g0?=
 =?utf-8?B?STFWVVQzV3N6L2FLdVVZM3JqNTVSTHBDTVFNem9USnV6TnBJZUJKbkRyM2lh?=
 =?utf-8?B?ZGtBaW1tdUY2UXNDaEJld05DeDRFOXc0VFVDeURhc3l5aGVNazJIVHRUOHkx?=
 =?utf-8?B?czJJbXJqaW9IUytiZ3laVjIxTjJ5eDVueGw2cUgzU3M3YmhmQ3B4SVc5SjBT?=
 =?utf-8?B?WTJkZzRvYXIwK0toZ1NXUWtGTXhmenk0VHJuZ2xKVStFbjUyOVlNQldnWGxU?=
 =?utf-8?B?SWx1M0twd0dld1VZelRZOSs0cGs0eHFrRXlQMkUvdmlqTml3MmFjTCtoM05F?=
 =?utf-8?B?bEF3QisycVNlWE9zNGd0aGVpU1VVQjVLK2ozRDFSYkhwVW4reVIxdmlFOUtV?=
 =?utf-8?B?V21icnZhL0RjRWhJKzRZdGtIbytzVm5wM1ROL2R4ck93enNKWFJieWdvbmRn?=
 =?utf-8?B?T0Zac3BPbCs0YnJEN1drWndRcElpTGRNc081UWlBUFVYcmtmUFNTRUk2UHhR?=
 =?utf-8?B?eGZqaU9kYlcyc0J3Z3pKZlEra2lXWklOQ09lMnQxVjZ6MlBodkd4dVhyQTRr?=
 =?utf-8?B?aHMrSHJQUzJaMHEyaHgwSXBTR1c4aG9YTEd3UHpQMHJHOVNWRUc4MTdiUWhp?=
 =?utf-8?B?TTlPL2ptRW9JblIxNWJFS1JtaWJwZ3owaFBpelZ1V0liQzdHRkdYQURMY3FU?=
 =?utf-8?B?cHIyenJtSEUzblloVlN2ejZoMlBOaG5CTFJPaFVrbDhhN1ptYll2dHNsUk8v?=
 =?utf-8?B?UTZ0ZFNPQ0tLR0ZZNXhMK3BKRE5TWnFVZXpoNVBxejBGZU9SS21jbE9YSlhH?=
 =?utf-8?B?WWxuZ0YrTmRkREhNWVJUT1hCODZDbDcybHF5MnRQbGJqVXNSR1ZaZTNtMHBS?=
 =?utf-8?B?ZE5wcDJBWDlFNk45cXBmR0ZSNDBmZVdUMXpmVW5Jd00waFNTZnhMZnI2RTE5?=
 =?utf-8?B?VXI4U01VUzQvMnhwQjRMMXA5TFVQNUZ0eXRzNHluTTZDbkVwamVXdUpKbTV3?=
 =?utf-8?B?d1Q2cS9pMVdUR1ZsL3dWOTIxM3BxckNwVy80aGhyVUgvTGFxSGZxRWkrSnlT?=
 =?utf-8?B?aGNPcC84bi85cGxMTjhFQWw2UnpWV2NlRCtLb3R2TnlnYTgyd1VaTFBtS2Zo?=
 =?utf-8?Q?u7UCe2seHkM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5969.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTRadDEyMGl1M3pMdDBKcWpXbTRRSzZHNjVvVnV2WithZmFCN29VNFRFMzdG?=
 =?utf-8?B?Y0x2WW1mVFg1ZXduR2ZJK1RTQnIwd3JhNmdNQ3NGVVVNTVRkSDdXMGJsZXVT?=
 =?utf-8?B?RTR1RU1oWjRKcTFZZ3JpL2ErUXA3cFVpREYwdnQ5b3hCSlBVQjVINGd1Rm15?=
 =?utf-8?B?MGJ2NkJwOS9pY0VnaFZ3QXgwV1dvR01xdHl0dHplTlJwc3lKbExzYURSVjNV?=
 =?utf-8?B?S3R3SW5RZ2daRkZ1RVdDenNsbnpjc2FKZDRHL0FTL09Fd25TUXBJSEo1akRi?=
 =?utf-8?B?WnpCNmRmY1dhSzFWNGNqWkxqQlBxSktwaGZsV2pXTFlPK0VRZlB4bGE3UXhJ?=
 =?utf-8?B?Q3J2VXZESHF5TzdCU1VIWlFrQm5RcE1TY29mRTJDTUlNNkZWTFNKSE94WHJK?=
 =?utf-8?B?VHJvTnFzb1B1MERmWE1FUC80WnBEeVp2VU5YOG5CMlNIUjF4azVFU2tSVXpP?=
 =?utf-8?B?ZnE2UE1EOGRIVEVvSnVnRDNzUXgvRVRETW1tR0wzZ1c1aXZBMnNUbkwyMG44?=
 =?utf-8?B?aW5qRzlId2dJVzJtOWRyRGtjUHhtVFhzSHlOWGdJWXFvM2tZVFJYbEtYWEx4?=
 =?utf-8?B?V2lYd2NsRm13cWd6OWthQ09SR0RBRjFXbTdIZ2ZDbFRLdllQZVlPSk1xZHph?=
 =?utf-8?B?RkF6YkZvYWFGNTNFV01TeEJVUk44Z0ZkTXBWd1Boa0JFeUMvSGJCY3FmM3Na?=
 =?utf-8?B?Q3FKY2t3eDFKOTNkRER3d2tiTytvbUk1VzBhWlZyTWlRMEZUUSt0Zk1rT3Ji?=
 =?utf-8?B?eC9XZTBuMEN6M0kxK3IzSGlmU1R4b0VQZ3NSaW9PdWh0a3VHTWJpN000Nm1Q?=
 =?utf-8?B?K3hBbDFIWnlkOFVFSVhWeHVPUkVnOWNueWd3dUdKS0VST3RTYW1JalVKUVJV?=
 =?utf-8?B?TkpQbXp6NHFlYmFRWHZJVHo1UEhhUFBVOThTNVlmTCtNOXdjWkxDT3o2TWFP?=
 =?utf-8?B?L3JDVERwb3h4MDdpa04xRm5UZDZTWDM3N3F2L3FJRzNqWWxoblFUUU44M2k4?=
 =?utf-8?B?bkxJYU9PVzhEZlZvSldUZ3RVbU41cm1ZcURXQUpSTlorSnhyaTl2emFhaTBO?=
 =?utf-8?B?NXFzeGt5UFZNcXNjTUFsZFVWZUlFUXViVlNtQU5TcldqNE5SdDU4SmlCWXVn?=
 =?utf-8?B?c0poK2w3TUxva0d3UDZ3Z3FZKzJuQlZ4R2pyR3hjV2R3T3pUWFdHMVNJQWdI?=
 =?utf-8?B?SE8yZm13OGUyMUo3QjdTdUFOR2NmNFNpQVYwMU5wM29hLzNGbENZWWhSdVBH?=
 =?utf-8?B?ZDA4WHBHUzJjcVZOL0w3N0wrWllJTjBuS2o4d3ZUZ2hRMWZSUWRaR2dLY0Ru?=
 =?utf-8?B?dENtUHZzSVdSV3RrenFWNGNzYmswOEJVcnBFVXVra2cyS0RySGsxRTAyakdl?=
 =?utf-8?B?R3RSY3Y4ekI2VE5KWTQ4cWNuL0x3L3JiWHI5a0xtbFVmRE85UHRjc3l4UlZo?=
 =?utf-8?B?d0hIUHZvano4SkVrUkpwV0hqR0RVbFlrRjJlWWhoTitCQTczc2V6SUVYcldN?=
 =?utf-8?B?Q2hnVitlWjdrVnpiTk1UZWs1cmtQR2V5QTJTa1p0dVFuUjcrZFpqbFBlVXk2?=
 =?utf-8?B?cGEzUG5hWkJJemE5eDFkNEV3SnJxVkJSVzNHMnF6aVJneWdrcHJtWnJvcFJt?=
 =?utf-8?B?NDgxT3JhMTAxdEU2QllzYnA5VjRDN3ZKdGJTWjJXRmVFZUNrRlpMOGNnSnlW?=
 =?utf-8?B?TnNSaUJ0ejdGYjVQUmV4TUFkTWdOL1JtUEkvaStQbjdxVW1WZjVQVUJhUmFa?=
 =?utf-8?B?b3h6MkRoM0EvTWVkdlgxQ21iRHBNdWpxMTVWdWw3MmFIb1VYVWIwVmdHdU1R?=
 =?utf-8?B?L2p6THRiMkljbVRhc0R3eVdBSitiRlBFdXE3cjc5cEEvb2NSaEp1UUM0LzZp?=
 =?utf-8?B?bFgvS3d3ZkpqYkZMNjZ6L3RFa1RMNS9VSkhPVGNwVFlGb3NxODJXcDBoTncr?=
 =?utf-8?B?NkhrQkN6Z1A0a2RNZW1zTVdUMEluQ2NOOWxHWU4xVDlOaThld0FLY014YldO?=
 =?utf-8?B?UlJoZmpPVlcxV0ttb2EzZlZyZE5wZDVlSU0zU2NLaGhxWkhYRklFbVIxV3V0?=
 =?utf-8?B?b05vNHI0ZWp1QmpOcCtsTmkzTWxKOFY0clphSHVpOEdaamZBN0JndVpBOVR3?=
 =?utf-8?Q?q8Uw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5969.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d84a941-3b5c-4440-a60e-08dd14806f4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2024 16:26:41.1854 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kay2W7ihoNgRILbymfDK8i/ci1kQoUI2V9aTdR5eQWKICfK4ze/qLLOJjo+HnaGQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9445
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGkgVG9taSwNCg0KVGhhbmtzIGZvciB0aGUgcGF0Y2guDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQGlkZWFz
b25ib2FyZC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgRGVjZW1iZXIgNCwgMjAyNCAxMDozMSBB
TQ0KPiBUbzogU2FnYXIsIFZpc2hhbCA8dmlzaGFsLnNhZ2FyQGFtZC5jb20+OyBLbHltZW5rbywg
QW5hdG9saXkNCj4gPEFuYXRvbGl5LktseW1lbmtvQGFtZC5jb20+OyBNYWFydGVuIExhbmtob3Jz
dA0KPiA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPjsgTWF4aW1lIFJpcGFyZCA8
bXJpcGFyZEBrZXJuZWwub3JnPjsNCj4gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+OyBEYXZpZCBBaXJsaWUNCj4gPGFpcmxpZWRAZ21haWwuY29tPjsgU2ltb25hIFZldHRl
ciA8c2ltb25hQGZmd2xsLmNoPjsgTGF1cmVudCBQaW5jaGFydA0KPiA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPjsgU2ltZWssIE1pY2hhbCA8bWljaGFsLnNpbWVrQGFtZC5jb20+
DQo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1hcm0tDQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBU
b21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT4NCj4gU3ViamVj
dDogW1BBVENIIDAxLzEwXSBkcm0vZm91cmNjOiBBZGQgd2FybmluZyBmb3IgYmFkIGJwcA0KPg0K
PiBkcm1fZm9ybWF0X2luZm9fYnBwKCkgY2Fubm90IGJlIHVzZWQgZm9yIGZvcm1hdHMgd2hpY2gg
ZG8gbm90IGhhdmUgYW4NCj4gaW50ZWdlciBiaXRzLXBlci1waXhlbC4gSGFuZGxlIHdyb25nIGNh
bGxzIGJ5IHByaW50aW5nIGEgd2FybmluZyBhbmQNCj4gcmV0dXJuaW5nIDAuDQoNCkl0IHdvdWxk
IGJlIGdvb2QgdG8gYWRkIGFuIGV4YW1wbGUgb2YgcGl4ZWwgZm9ybWF0IHRoYXQgbWF5IGNhdXNl
IHRoaXMgaXNzdWUuDQoNCj4NCj4gU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWku
dmFsa2VpbmVuQGlkZWFzb25ib2FyZC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2Ry
bV9mb3VyY2MuYyB8IDcgKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZm91cmNjLmMNCj4gaW5kZXggMTkzY2Y4ZWQ3OTEyLi5lODRjNGVkNjky
OGMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm91cmNjLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYw0KPiBAQCAtNDI5LDYgKzQyOSwxMyBAQCB1bnNp
Z25lZCBpbnQgZHJtX2Zvcm1hdF9pbmZvX2JwcChjb25zdCBzdHJ1Y3QNCj4gZHJtX2Zvcm1hdF9p
bmZvICppbmZvLCBpbnQgcGxhbmUpDQo+ICAgICAgIGlmICghaW5mbyB8fCBwbGFuZSA8IDAgfHwg
cGxhbmUgPj0gaW5mby0+bnVtX3BsYW5lcykNCj4gICAgICAgICAgICAgICByZXR1cm4gMDsNCj4N
Cj4gKyAgICAgaWYgKGluZm8tPmNoYXJfcGVyX2Jsb2NrW3BsYW5lXSAqIDggJQ0KPiArICAgICAg
ICAgKGRybV9mb3JtYXRfaW5mb19ibG9ja193aWR0aChpbmZvLCBwbGFuZSkgKg0KPiArICAgICAg
ICAgIGRybV9mb3JtYXRfaW5mb19ibG9ja19oZWlnaHQoaW5mbywgcGxhbmUpKSkgew0KPiArICAg
ICAgICAgICAgIHByX3dhcm4oInVuYWJsZSB0byByZXR1cm4gYW4gaW50ZWdlciBicHBcbiIpOw0K
PiArICAgICAgICAgICAgIHJldHVybiAwOw0KPiArICAgICB9DQo+ICsNCj4gICAgICAgcmV0dXJu
IGluZm8tPmNoYXJfcGVyX2Jsb2NrW3BsYW5lXSAqIDggLw0KPiAgICAgICAgICAgICAgKGRybV9m
b3JtYXRfaW5mb19ibG9ja193aWR0aChpbmZvLCBwbGFuZSkgKg0KPiAgICAgICAgICAgICAgIGRy
bV9mb3JtYXRfaW5mb19ibG9ja19oZWlnaHQoaW5mbywgcGxhbmUpKTsNCj4NCj4gLS0NCj4gMi40
My4wDQoNClJlZ2FyZHMNClZpc2hhbCBTYWdhcg0K
