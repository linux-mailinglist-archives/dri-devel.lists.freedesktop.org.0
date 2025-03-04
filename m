Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B70A4E0FF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 15:33:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3929D10E5F3;
	Tue,  4 Mar 2025 14:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BDaEO87K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA44510E5F3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 14:33:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mi5BUBRXKXmzkxHp2CgLxkqO4vLimycDHEpKmJmi+KOf2gqjnI+sg0Q2z4TIJPvbTqIbSUNzWZ+lLiWUFd0j052UCyMxDJi+D4LGyOWoBTCLWRQ8I6ubUlMJ1G7j1dl7A6wQ3gxwgcFdQ0Cs7A2iPKoBy9GzstaLmPi0hb12hs4SAiZD2Xg1FsmNfhfyRkIh8I+WEbkWLMCW/YhagB1f3vVAaBh1F07F32uVJLSLrNqcB/FQGgN1HyDLkWeqk9GQFHahgBSi7QBwYmmCqAkT1QLjFGZYVw1qQppSOHp0PFoSpZxhyv/rWAhly13ikavlu4MLCQ0qGLfYyUkRcGCZCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToUpnVs6G6hCg56zsofiLUAcEsDA/5fBb5JYeBOdHWU=;
 b=X6p6bmA2kT2cOlLrKRMNCV7RUq5pnt4KyhacAeOz79oi7gUDTIdD4TTvxtCA/t4rt5rYtNOgOKBp6sP4nDtXCpwAJtRCsn7Ry6btxRcCK4TQOnmiPWF2UNdnh/3TiBvZF6M1iGS3ahf9SzPJNYcJaF6fryG3ZPMJPbBqrl+Aw2zh0FxdHY9le1Bp5VYWoFaoYvieUxYfJLqiXZx5Je7goAAQU7HUyySKAa6vLy8lil1uvWdV2APKezFZ6biDWFzGrD6P+taeQd8sHfK+44OsG3PeiuPs1INVdaZIWFal7yoODc/C1dIowwQiKmBNJ9WvnVW1AUcrRWTSiHkAlXxTHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToUpnVs6G6hCg56zsofiLUAcEsDA/5fBb5JYeBOdHWU=;
 b=BDaEO87K5S//0+erqIfRk6KQJAWmr9xLwxupmHuAIoYZvZArQ5+0/todZkJIfU8Pjfmjtd3JOpYZznRu/+9ZjB3zDkpLGWOZ6k2oi5etz8czrpVH1H0HjpiIIo4eL755nVh+d4vKU+Kt1sBM8FZ5ekF9fmty2M5C61jpiV27iGpVF/w3PCfCS8MMiPlCuY4e5j22nDJeJM4/XVReaSmLI1rYIrXGCyI00rlnQ7Dfjfqk9wM/NOd7Ta4VfO7Hq2eBHsbWM87FhK+6iq/nvhyo/JNuSWedlm2gTOmIMb0r5TjZ/Ak11zDHjZxIEBh8b19ijk/RmqO1Q7EKb5daKkAuaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS0PR12MB7582.namprd12.prod.outlook.com (2603:10b6:8:13c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Tue, 4 Mar
 2025 14:33:40 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 14:33:40 +0000
Date: Tue, 4 Mar 2025 10:33:39 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Wei Lin Guay <wguay@meta.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 Dag Moxnes <dagmoxnes@meta.com>, "kbusch@kernel.org" <kbusch@kernel.org>,
 Nicolaas Viljoen <nviljoen@meta.com>, Oded Gabbay <ogabbay@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Leon Romanovsky <leon@kernel.org>, Maor Gottlieb <maorg@nvidia.com>
Subject: Re: [PATCH 0/4] cover-letter: Allow MMIO regions to be exported
 through dmabuf
Message-ID: <20250304143339.GM133783@nvidia.com>
References: <20241216095920.237117-1-wguay@fb.com>
 <IA0PR11MB7185FDD56CFDD0A2B8D21468F83B2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <924671F4-E8B5-4007-BE5D-29ED58B95F46@meta.com>
 <IA0PR11MB71858B2E59D3A9F58CEE83DCF8052@IA0PR11MB7185.namprd11.prod.outlook.com>
 <61DF4F0E-D947-436B-9160-A40079DB9085@meta.com>
 <IA0PR11MB7185E7DBB9E959A2F40D4170F8C22@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250226133822.GA28425@nvidia.com>
 <0d471fca-b64c-4392-88ee-d26dbfe3cf2d@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d471fca-b64c-4392-88ee-d26dbfe3cf2d@amd.com>
X-ClientProxiedBy: BN9P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::32) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS0PR12MB7582:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d5ff77d-0199-48ab-4ec5-08dd5b298ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2dYUENaMVhQKzRqcmRhRE93Q1VpYkxQVjBYVUowenFwRjlEMnozNVkyUWVL?=
 =?utf-8?B?UXRkQTZMUXVWYjlzR0xwdnB5Vjg5cy8vNkVQSWYzV3lHeEtVU0RNeElHZlRW?=
 =?utf-8?B?SjVRenlqanBMMFdDQWVoTHRhZTV2VGNSNm1mV2JKOFVlUUs5TkM2aTFVUlQz?=
 =?utf-8?B?Um9iR2MxU3dhQm90QU8xUC9OZ2ZNdDFvSHZRcmVhdFFxMGFWbndTQUFLUmQx?=
 =?utf-8?B?c0RsQ2pOQ3dWWEI0dkhyY0xmdEJoVHRBQ1NIaC9QQjM3UmhzSzB1UlZNSEJW?=
 =?utf-8?B?SHJ2eG5HcWxwRmRvQUxoWWJKTWR4VmxKcU1ZTmVBN0FhN2tGd2Q0M2x1enFl?=
 =?utf-8?B?MnRKQzRPVzJtODRNNWh2bFhVeU0yUy9QVng0Rm9hYitkbXNNZW9jd1NrTjd6?=
 =?utf-8?B?M1BqRG04RzREMVhhUlpQdU9uNWo4bUZ6cGgyTEFxWEhuZ2pCVmlDVkVYZWor?=
 =?utf-8?B?SkZyUlZFZnF0eWN1TGd4dGpGZWFrK1hHeXc2K2RQZDNTZ0ZwKzk3bW13VHAx?=
 =?utf-8?B?N2FjdmpBcC90VWVKWUpPVmV5NnZJYjNvcU9FbmhUSTdwN29Dem1ZNE8zNU1G?=
 =?utf-8?B?c3Y1bysxUnJ4T21CaGtsY2dKWElzeWhIU1NVUXNYVHVVRm0xYUpVM0poNlpJ?=
 =?utf-8?B?WWUwbWdiUndxUE9EYzhjejNuR3BiTkNWeTNlUWEyL0lBWTdXNFFFZ2Z1WjF6?=
 =?utf-8?B?anBKMUxhamtjRDdmbTFQS0U2YWtVdGFKQURtYTdSQnJLNkFiWVJjelBLV2NO?=
 =?utf-8?B?b0VWVzE2b1V1U1RhcEM2c3RxYTFaK3hiSmQweUdRZmlJWGF6eC9OaTNWNHBZ?=
 =?utf-8?B?WnBCYVNGaG13dDd6My9mbTl6d2lMdFIwb1g3UyswNzZLSDArM0o2d28waGZy?=
 =?utf-8?B?VW8zVEpmWmxoSzRuNmxYdmQ4ZElLNTdLUno5cWt2UzFqNWR5QnFIZzdUbDJU?=
 =?utf-8?B?NHhTbGl6RWIzYTArcVJLV3pNRE5LOGZrYU1yT1FNVHNSSnlXamFNenB4QU1F?=
 =?utf-8?B?YjZXNFJCYWc4aUVxVld3OTJBMXZMVUZDd3llTWpUU09CSzZTT3ZmUzVUMU9K?=
 =?utf-8?B?ZDZtaTVCeE0xVnZBcmNlU1lMSHlvRHg3bzZ6bTBFeHhGNnNvQzBBR0JINkVV?=
 =?utf-8?B?NUtIVDVmOHlpYnJ0N2pESWZlWkRNdzV6ZE9mbTRxM05jcHpNaU5JN3I2TzBM?=
 =?utf-8?B?SVk5eTNTNm9aRHpXcXEzY1dwOWJWRDZWcGgrQ3hGb1pNSWk3NHFhUzl3eXV6?=
 =?utf-8?B?NHd3bjdpYXh1YmtIbDYzUE96aU9lYnhZZHdPRndKUkVsZUl2VU9ZUHhyVW1r?=
 =?utf-8?B?ODI1YzJLTXpvSENWTHJPdkJYUzI0bkV2cFJSN0txWnpUUEhTeWtNMzJIWkhH?=
 =?utf-8?B?WHJFTWt3SUx1bG9SVys4R09BMFc3MXlPeHhVUFpRNWlJVUdKclhTT1pzMDlR?=
 =?utf-8?B?ZDVOOU1LOGN4MWREQ0JNOEJUdWg2ZElpRVgxK1d2VUJvakJjMktRU3FvSmdY?=
 =?utf-8?B?Wjg3clZaWnY5ZGRUSC9manFtZjlyUldxdUswb1dwY0xMQTBSUW5kTEpHT3Yv?=
 =?utf-8?B?SjA0N2RvMGo3WkYva0lyb01hM3RqUldkUWJ6YVV4UTBwUlpiWTIveGk0Yml2?=
 =?utf-8?B?bXhvZUs0OEt5R1ltMU9iWFBvZVNnS2l3SW5BUDF2YUt0am9VR0tjSW0rR05y?=
 =?utf-8?B?QUFKa2JDR3Zydnp1N015aXBZNi90N0l0U0ROWWdXSHFzTFJtZUlVSi9ZdHQ3?=
 =?utf-8?B?TDROa0hlUWVxT3dDemNvUXZEdzBYWGp2L1VJbzFrMUx5TXhQS1huaWMxcTcr?=
 =?utf-8?B?dmU0b3plbEZWNW01TCtWWThaWFJtUW12N0hsSlc1cWc1ZWpzVFJML2ppbk14?=
 =?utf-8?Q?RfA0gFcHVoURr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW11U0dKczAvZW1IZFRGTXNqU2NYZXlyKzBTbWRlQjZpaE1JQXVoQVZvdTdV?=
 =?utf-8?B?T3RiNXlRNlR1RVlZdnhQL3RQcUMrd042TEoyL2JzWkFaU0JmWkdnTXRhU2x2?=
 =?utf-8?B?WVJjVURzR0UvL3BCMHJnUFovYmlmNlZBOTRONWlHeHp5bzBQUVBhMFdHTnhG?=
 =?utf-8?B?cTNaWUtPMURYaDB6b216VEdSTlgvdGxjOEdybTdaeStQRGxUQ0NzcEVISDV2?=
 =?utf-8?B?VFk5RXltRlBwYndvWXdBYURuWVc3UHByNVVBeWNsb1VndERyajFRM051Szhk?=
 =?utf-8?B?NHh1bE52Y3h3ZW5qQW5pbnc2ejdReVVzd2JyN292VGIrOW1PUzYrMDY5Q29h?=
 =?utf-8?B?ZlpiYlNibzA5SHU0Qk50ZDNyMkFGZkVmYlRkQmsxZnhGWkpZT0d4dUF1SE0z?=
 =?utf-8?B?T0tqbndaMmNlRTUweHZOK2VqSy9odWhtNFBoaE15aThvVTJLNEtuQUpQYUVs?=
 =?utf-8?B?K1A5V1RkQjdVQnorUTNvTTgrUTNIcWJYeXN1OGoyMzRrQmNvUVRHZXZyMUlR?=
 =?utf-8?B?bnUyT2QzQmEvaDZYRzFDUFdwbVg2bGV1Q2FJZndsZ2NhR0wycnJaWGEzdklx?=
 =?utf-8?B?MTZyOWFxZkdMc3ZDRUZqOXAydWdlSWlaNGdsaUVqd05kM091M1ZiUkpiM2Nx?=
 =?utf-8?B?SWxrZlFHZkFwWCt0N3E1azloelZ1QTM2a1dKUFlZTkJ2ajd3UUxnaEpQLzhY?=
 =?utf-8?B?WmNUdkZlRGVrTzB2U2RML3h2YzFGUzBuT0F4THVZV0JicXZTL0JCWXZsOG9I?=
 =?utf-8?B?aHI3MVozeWk1ekVnV1hvNjZHTTNPMVRkSzk2NUFrR2VRWUFZTmpZWThyMGd5?=
 =?utf-8?B?TlpDR040azNuMWtIUGgwY0Q0MVpCcDVvd0FBSDFRSFlmK0xLbURDalZIZnhQ?=
 =?utf-8?B?Qm95REhwOStMR2k2YUlkOTJjZlMzMDRkcW5EdW1kSGlhWGtiakVEKzJOTVpJ?=
 =?utf-8?B?WHN6QkxUZTZjT20wK3FQYytDUmN0dzNOZk9mczQ4UUdDSmsvNTFLYXpDY2h5?=
 =?utf-8?B?T1pmcms5MHByaVJjbm5zZGNqR1l3VHA2OTJoQ0JheURnQ1BhS21qQ2Y1VndF?=
 =?utf-8?B?am5vYURYOWYxK0IzTHNwdWpFN2VjY0orRng2WUJiUEpvRFVPb3J0QlhGTmxW?=
 =?utf-8?B?R0IrR2dRWU00NG1taC96dlJGTE4vYzdlWlFMeGJma1V2RGQyb0ZEbC9RY0hK?=
 =?utf-8?B?am1uVDM3dnBmL1J4aDJtWUlSQml1aXlpUnByZXdKWDI2bE5WVHdKUmIzS3Rm?=
 =?utf-8?B?ZlhQTDVTMnNmblFxVkh1VlBncjVyYlpuM2Z1MEdma0pBZEwrSVpFV2dwVlM4?=
 =?utf-8?B?MDgvbEJ6dWtCMHo5QmJaYXNDTHFBNGhsWXdaUjlPY21NUThNRGszR1hnK2M1?=
 =?utf-8?B?USt2NkEwUHVIVjBBVy9qVWhIUVo0aWJzamZ1R3NaTThtZkRyQ0h1L1BNbHRj?=
 =?utf-8?B?OEdWRVJRRE9xdTlwZXI4c1FLU0NzSURzaCtDbkZ0eDNuRHkzVmx6dURaYzZJ?=
 =?utf-8?B?L2J1ekt2NStkdmRsYWFGa25jZnpHOU9mbE40RDVyMDI3c04rSjRqcTkwVFdH?=
 =?utf-8?B?cFRwbm9aQWNJOUJaZWVDck9FN1BLdnV1WkJWcmNudTYveGJUSUdWMXdQN0NQ?=
 =?utf-8?B?SGJESEZiWDF5RUlhb2ZCL2hPdjBrOVU5czBwamcvWXljcGRnUEFiTG9QYWo4?=
 =?utf-8?B?NTBlWGxISDN3TFRDTlhzbktXSWFiNzhibkxjWDZlcHl4TGk0OGpBVWhZYkM1?=
 =?utf-8?B?aVV2RWIxQlVMcHRzWXBONmFWNEJ4NUJXUXpWd2RlZ2FzYWtkcFZBZzlFRGJl?=
 =?utf-8?B?cmUzRm9uZjJSUzdYY0U4aElZa0pXQzBnenlZdTFUYzc3aVBtUTUyME0xTHAx?=
 =?utf-8?B?V2p1ODdmRWRPNFErMXI3VFRJaUhxUldGVXBDQWI2ZkV0cS9sbnV5QzhGYkpK?=
 =?utf-8?B?T0t3eFBieDhxRWMwa2JQRmRKcXhDL2lqWWpaU1BEN0FBTjh0OGh0NXdJWW9u?=
 =?utf-8?B?bmttY3hoQ2d3M202cXBWei9qRFZ4SVVvRjNCbXlhQmtzaER6RjRYU3hhVHN5?=
 =?utf-8?B?RE0vWDJiVzM4V0tuVlg2bGMvaTdTeUR0WmZYdkkwbXgySXA5bEJxUlVEZkxJ?=
 =?utf-8?Q?klf/Aaz+4VOOMUk/BB6/7sZWb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5ff77d-0199-48ab-4ec5-08dd5b298ea9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 14:33:40.3134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGln8DJl/ssUB1or68p5GyfHv2cUPeCls3Km3anz2EvyVA6DsCoiZpftwn9A0d19
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7582
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

On Tue, Mar 04, 2025 at 03:29:42PM +0100, Christian König wrote:
> Am 26.02.25 um 14:38 schrieb Jason Gunthorpe:
> > On Wed, Feb 26, 2025 at 07:55:07AM +0000, Kasireddy, Vivek wrote:
> >
> >>> Is there any update or ETA for the v3? Are there any ways we can help?
> >> I believe Leon's series is very close to getting merged. Once it
> >> lands, this series can be revived.
> > The recent drama has made what happens next unclear.
> >
> > I would like it if interested parties could contribute reviews to
> > Leon's v7 series to help it along.
> 
> I think demonstrating how any new interface would work with the
> existing importers/exporters would help.

I can see that, but also it is a huge amount of work to make trial
changes to all sorts of subsystems :\

> > We may want to start considering pushing ahead with this patch series
> > and using the usual hack of abusing the scatterlist in the mean time.
> 
> That works for me as well.
> 
> I think when we should get away from scatterlist then that should be
> a separate set of patches or maybe call it a separate project to get
> done for all DMA-buf parties.
> 
> E.g. propose something like an iterator based interface and
> demonstrate that V4L and a DRM driver can live with that and that
> this approach works like expected.

Yeah, maybe so. We are some ways from that yet..

Jason
