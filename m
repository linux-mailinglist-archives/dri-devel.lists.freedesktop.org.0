Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B690B93313
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 22:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFEE310E50C;
	Mon, 22 Sep 2025 20:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Jt3AB43/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012055.outbound.protection.outlook.com [40.107.209.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FEE10E50C
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 20:13:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDBkeobDDS4YTo28gon47vmmvfKWClF/tt65QwcEzhn8QXsumciDG93e6hgNtD0BoHUkY6aG6zHJC1uQSiSSLTqGtOmhu9D4IWJktOXcYFFB1EwkGvrHSib+Chw+IiioVYeeK+Tn9uk1TGC3FHB1UMjNR5wgrksH7BCEWrUWX7YM/fZYRdViMxzPyKe5DV6WdoqAlLRNf1Opa7KlbdbwSO0VFzGcUSuEAvbHzZTLoPfqczRWJWUH8wvp6VUrRI6jRhZXR3dg7YNvPItoinU3e5i7+s4+Xq2JAqVpTYYIEDQ+04JNzR81h4V9S7x55nY/UdJmDT171JSGwurfs8ZjUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qil7eAMHq91jMhq+dsuahGcHPT2WhjrqXtU33f9pM+w=;
 b=NZ+sxWOttmWk8p36ClaOIB0OaQ9JIGJYnw6RBxZxltk8toZLE+1UEqBlQt023sIOzgC4KvFfLv72IXrmltQ+SFA41k+XKFzsl8BiFDC67GG/dym1vgEyHSF29v510HFMQ4FEf1TP+riwH5jBmoyUsPA1AriTtH+HsRwMpCtnENfMMlLcK1Kc5KjeJsPBVkwC4OyWRMTe7/qw8+r17ENDYj8Gx7BWAhaOE8MC9LpAAZ96dQ/pNpsHXb2/MyLORe00v1jF9vYsh4Vt5EddhS/K/H7FOWt0tvksjDEAoBA5k0Z4fG79P/NeC9/pJSKol/nQm9/rLiT1QWn9+v29MPodjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qil7eAMHq91jMhq+dsuahGcHPT2WhjrqXtU33f9pM+w=;
 b=Jt3AB43//pWfti7dy9qVS21ynzOlGpuWALbNx3dMYqXiLu5xOcenj5n4sY3TN0nqHzYFAunRB3+c3GxpGZeVHhKlJ+wkyHDghWFG7d80UAjzze8NkxqpP7yFhIAExsOKAhU+0q90ogASeZuCkAHuJG7nUmjIAqVQWqs6+1iVNI4+ky/EjjivqOK9+dUVJeeqqXCPBxM1L+v8lfRk9UXCO1ZO0wbMo/jyIjGN2sATTZpvnqQoQbJ9Vf06wf6jirCv0safCpPzUQSKDBcy/3T8KJ4HgGPK6PPTQXFE651cZLZ1XgE9H5+hUlCUIRtMqeLk58UiBPy9g8cR3OoirUDsvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CY8PR12MB7657.namprd12.prod.outlook.com (2603:10b6:930:9d::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Mon, 22 Sep 2025 20:13:53 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 20:13:53 +0000
From: Zi Yan <ziy@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, damon@lists.linux.dev,
 dri-devel@lists.freedesktop.org, SeongJae Park <sj@kernel.org>,
 David Hildenbrand <david@redhat.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?utf-8?q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [v6 03/15] mm/rmap: extend rmap and migration support
 device-private entries
Date: Mon, 22 Sep 2025 16:13:47 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <D4440A30-118E-40DF-99BD-6F58B708E597@nvidia.com>
In-Reply-To: <20250916122128.2098535-4-balbirs@nvidia.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-4-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN9PR03CA0612.namprd03.prod.outlook.com
 (2603:10b6:408:106::17) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CY8PR12MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: 50796d16-ca4d-4bbc-080a-08ddfa148d44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NG9ROFlSSEZMeUNmUXUwellrd0RYSEVkZ20zd3lmSTkvR0R1VGRoRTM1VjR0?=
 =?utf-8?B?V1lwcElVeDUvdEZ2Nm1EWU9leHJIZDYrUitXTzJueWpyTS9jVVhNSzEvaUxW?=
 =?utf-8?B?ZmNGNVFPOHp1VzZLR3N2a2M3eUMvSVJTc25FaEw3WTlkSTgyYStabTdmNHdG?=
 =?utf-8?B?eksvcVBRSFNLUE85SkpjaUxEZHRXZzV4MHlLSVBlemNyRHZEQWpzOUxLMklm?=
 =?utf-8?B?bXVnb28wLzBFNG9EamxyMmJLSll3UHU5b3JQbTdJR25xc1U0SlQ0VDVFcG5Q?=
 =?utf-8?B?bDM1T1orVmx0SjVkTXJJMVpxSzBwY0lGK3ExOUcwbjJ0RUovemtBcGhVZXhk?=
 =?utf-8?B?ejIyc1lqZi9UU3hoMlM0d2lHTGVBQ1RSSHZhUDAvWHRxOVBlUTVBR0dvQXlR?=
 =?utf-8?B?QmlTNG1JcXh3UVExUGd2cDkwY3V5Rzg5ZjNGcGRENzRKRXNRT1FZRW1xYUMz?=
 =?utf-8?B?YkNKdjJpUFFLVFZRaW1oSUd4cGcrQXNDeU9GYkFGUTVDWGw5V1dPTUxUVmVX?=
 =?utf-8?B?d0dIcVNCNmtONUpoeE9Bb0JkSEprZ3BualQ5eVpiUlRVMjVBMnNiZ21yVTNr?=
 =?utf-8?B?dHI3QlJMTk5uU0w4dVk2YWRsaWxKR0F5S210bEt2Z25mQXBxTXgxMXZFTjEz?=
 =?utf-8?B?b2JiZ2xFVHpady92NnFXQ2p1Q3ZET0dlM241aUxnN0wvanluS0NRNVF4aHA2?=
 =?utf-8?B?ZE9tblVQbjhEZEV2NlBMeXJuT0hZTVdGajlIZ2h6eFlna3VtVlZKZjB6WVpz?=
 =?utf-8?B?Q01JSHhVRmlxREtqaTM2NHRCRitCVnJzNlZBL1lOQTdybFJ0K0hnMkpMcjQy?=
 =?utf-8?B?c2VZeW1nc3o3YVErWGU5OHRkZzNLTVpwUXFkNGgxek0zUHFWdVhVM2JMUWx6?=
 =?utf-8?B?djltUWdWdFVyS3pzYmp6SjE0aXUzTmFGYWdNZUV1QmpwcUphazY2SGNyY3A5?=
 =?utf-8?B?a2Y3c29PTkhWT0psZkphVFZaUmFTQ0srbmVqSjV0bk1BcWpCTFR3N1lZREth?=
 =?utf-8?B?OWlQNkxhTWxnYWVCcWcxYUl5VDhQeXJwNGRRaWF3TjV6STVmYkpzNTk0OStS?=
 =?utf-8?B?N2pQWS9tQzJZdFdhSERiYnI2VkVVa2pneWtjZWF0ZkEzWXVnNm5jUkFyaUpi?=
 =?utf-8?B?QnhVMWxhVi8zaGZuTnBRdy80cm95UDM5dXJOU0dJdWppTmZreVlOQTBURkFM?=
 =?utf-8?B?MXg0emRVMFMzc1FmejZuQm1FZE93OEhodjVrYkl0OXpybkNDa3V6ejZsa0h0?=
 =?utf-8?B?M3ZIamJJVEtOSDZOOXdhSERUM0RJdm11VDFEVzgvTEQvU1prYkw5WUNVZ1BF?=
 =?utf-8?B?NHZlNXptVUdqNkRKcmd1WTQ0d1NQMCtuVjVmUHR3TDB0cmJJR1FuRGxXV21J?=
 =?utf-8?B?RDhtaVJ4ckI1cnNDV293VG8weC9kZTlLSDd0QjRlaEgxa3FXc1RDMTBzaGt5?=
 =?utf-8?B?ZWthVjFLTWxzcEdCcm9zRVdtRVIyZ3lvUEQyWFBnZUFDZkFQd3BiSzJrRzlO?=
 =?utf-8?B?bXZDTXZCZG5kQ1VwYTFlaGQ5cGtVangvZmtiRU12SElaajNWTlMxR1RuaFBK?=
 =?utf-8?B?aEFVeDd5RlFsRWNyTzd4Z050NUppTm9aSlVNMGtnNGUreGkyVzJFNk5PZEpR?=
 =?utf-8?B?SjFNaFNTcWIyZWdDaEdQNmw5bTlJWEM4OVY4Z05rR0o2STFMWGN4OEFKSUtM?=
 =?utf-8?B?ak4vRk9HSkE0ZkRkSnlCRkV2czZ0TVl5Y2JiQVdGL2tsWEVXNElIOEdBVkFX?=
 =?utf-8?B?R0N3ZHVNREp6OTdUUHJwWHliYWI1OVFFdnpNVysreHQ1bU9TQzJMOVRhb0Fy?=
 =?utf-8?B?K1ZjWkNXYVBwR1dVaXB1TkJ2dGJsQ1ZXNFBnd1d5V3ZNYlkvTGhQMlVNUldk?=
 =?utf-8?B?bVhpMVM1SjhqVTUxV01uMUhWQzZXT0xLc2F2VndyRE05TU5zRW5DWVYvRSt1?=
 =?utf-8?Q?OtQ5Nmv5r9E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjUvbC9FTWpPRE1rWGE5SE1XUHFFZzI1a2VhYkNlWWVNN2ZBSUU0UUQxTEl4?=
 =?utf-8?B?MkNjdGUxMXNpMUk0S3Rqak52TkhxTi94UUZPUThxcWZEeStvK3h2ems5cS8r?=
 =?utf-8?B?UlFtajJBTFBjTHdjaGlMRE5HaUNJMnFjcU00K3EvbVFnQWxJSERuTTdQcUha?=
 =?utf-8?B?b2x0Y1JBU3FHRnRpLy9CS3daMFlaSlpmYk5vN2hPb2FOYkxPMlFiRThPeW5G?=
 =?utf-8?B?eDJXL2NJeGI3SFJGR3d2dzM4enlYYWttdjY5NzgzUkdCMVM1Rkh3bDBLY0lG?=
 =?utf-8?B?U0U3cE9BRTJjVFNLcmtzdElaZmdheUQ0T2xRQ1pIa2hHaGV4TCtGZG1nK251?=
 =?utf-8?B?NDF5QVpVazFGYWxSS25ZNDloa2hWZk9ydWwwMWt2aDF2YVd6ditDdlJmaVl4?=
 =?utf-8?B?QVhxYmwxME5adXF5M0ZZdnB6dm4xclRkazBBTkVkb0RpL0YxMUJETWlnWElz?=
 =?utf-8?B?UWtGWXl1QVR2QmdkVVY1VEtKVWpodVlVY3VneWJGL1BCT01WbGpZcWYwNjQr?=
 =?utf-8?B?aWFIZ1h6eldUYlFMbHZKd2lqMWVLaHp2R3YycmFublZ5ZGVLWmxaRkNjOTVD?=
 =?utf-8?B?eTluNkZtdldESUM0VUptYzZ1NSttdjVIK1dETmdCYlZZcGZPU3Y1clkxVitw?=
 =?utf-8?B?UDMrUFFjeGhvY09xSllzVTU5QllyYVRJVnBUTTN3Y2VVREpidGl3N25ydFdE?=
 =?utf-8?B?RzFsZnBxa2RQNkxLcFppMnF2Sks3YzZpWEFsUnBJUFZDdER1YTF0VTYxbElJ?=
 =?utf-8?B?dUZWK1ljRzRjVUpFbEtPbWl4OUZlVWZDZnNGQ0VyMFdPTjBXTWtUZTJXdVk1?=
 =?utf-8?B?Ym9BMEw1OW52OWdQeFJKL0poZDNTSXhhMlpNQTA4SklRaFRaanR5U29GaDRR?=
 =?utf-8?B?aGwwUi9YY3lRWWtQekFEZjRWR2RNYS83cjRXY2dwWU43c2xpNGxLSDBScmtZ?=
 =?utf-8?B?Wkh3QXlSUXBuTk1yN1ZlSGFvOVVueWhtTlVZUjNJOGtZQ3VqeGc4alpOb2Jq?=
 =?utf-8?B?T1FoTVhlR3B0VWszYnZJWUNiblBMbUJPaFRVQ285bFJVRnlzdGl4MElTSHh0?=
 =?utf-8?B?OUwyMEtNVGYwVDVudk51dlAwcEgxS2phbUMwa1k4aDdVNVQ1b080SXhkb2VV?=
 =?utf-8?B?bjhuTUdua0oyaTJHSnd2NUZVQ0xNTm41bFJBT01TcGRtakZRRi9RTW11a25Z?=
 =?utf-8?B?dWx5TGpLdG90ckUrNWNZckdUZnpFbmhkcmd1MXozTTFJVFovWnY4MTZYN2Rm?=
 =?utf-8?B?MnJrVCt1TWk2anlnaVNyc0ZISDlIZEZZbEx1NVFuUmhaUUJ2SnI0MGN6RFF2?=
 =?utf-8?B?WGpnWlpOL3lDdTQwelRkRmlvWDRESmYzQVR3bkRHNDY3c1I5c21UdTVuQTNF?=
 =?utf-8?B?N2ZlWm1laXRLOFJ2eDB3MUc5VldEZm55NisyYzhPQ3hveGhaM3pENVpCTDZG?=
 =?utf-8?B?ak8xN0txNHM1dHhIcWQwaVBKdlVlR1k1Ykh4Um92dURGL0FDNUJKeW9ZUEt0?=
 =?utf-8?B?Z2pEWTYzT2VHTjJLYk9xVStyUTRiUlY5M09lT25CdUZpZDMyZFYraks4VlJm?=
 =?utf-8?B?NUw3UUZpb1RDMkpUcXhFTlROenhZRDNSNHQ0aFJyVVdZai9YN2t6a0FiRHhM?=
 =?utf-8?B?clAzdDhBSHpBNjlQRXNRZ3BBQi9WTml6cUQ0UFovcjVhWDFpSmgxRk50VXBV?=
 =?utf-8?B?T3RNU2R0UDRkbGFDU2xoTnh5RlNOT0xlNVI0bjB0TWx5cWRwNmlZc1RxeTBp?=
 =?utf-8?B?YlZYcUc4ZnE0L1JPeXpGd2JqcWh0cmIvZFg5SE0zYkYzbUt3SzVTRmUrMDFm?=
 =?utf-8?B?aUtTcnNnTk9seXJJSTRGK2g4YzFTMnF2KzFQMzNtTjBack5wb0d1VE1QcE9v?=
 =?utf-8?B?VFhpYzRKMG9HeTZ1a3U5R1ZMNExSbDdLVjV5eUk4RkZTS21veHQ5ekxvWnpj?=
 =?utf-8?B?VGd5TVdxck9PNFJHQS9ybFFRNkpoOGo2eTY4T014LzdVYTB4L2Z2R09kdm5v?=
 =?utf-8?B?d1YyZEc3T3IwbGJiZ25FaXZ2NERUZnNDSmkycHgvbVB2NGVMUmkxSkZUcTNn?=
 =?utf-8?B?a1VZMEE3VXBPWmczWFdTOHV4eFZHTEtMTGp2aXlCd1ZFYVpndWFRV0dZUHBp?=
 =?utf-8?Q?bfhOuI1rw4ThGPMMARSivrZc4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50796d16-ca4d-4bbc-080a-08ddfa148d44
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 20:13:53.4439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /39lH557pGqSZ/T1//eKwiEGgNToSGV1/aSSEiXor77EPyLEkiZjGAvkxKEtNee6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7657
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

On 16 Sep 2025, at 8:21, Balbir Singh wrote:

> Add device-private THP support to reverse mapping infrastructure, enablin=
g
> proper handling during migration and walk operations.
>
> The key changes are:
> - add_migration_pmd()/remove_migration_pmd(): Handle device-private
>   entries during folio migration and splitting
> - page_vma_mapped_walk(): Recognize device-private THP entries during
>   VMA traversal operations
>
> This change supports folio splitting and migration operations on
> device-private entries.
>
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> Reviewed-by: SeongJae Park <sj@kernel.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> Cc: Rakie Kim <rakie.kim@sk.com>
> Cc: Byungchul Park <byungchul@sk.com>
> Cc: Gregory Price <gourry@gourry.net>
> Cc: Ying Huang <ying.huang@linux.alibaba.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Nico Pache <npache@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Mika Penttil=C3=A4 <mpenttil@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  mm/damon/ops-common.c | 20 +++++++++++++++++---
>  mm/huge_memory.c      | 16 +++++++++++++++-
>  mm/page_idle.c        |  7 +++++--
>  mm/page_vma_mapped.c  |  7 +++++++
>  mm/rmap.c             | 21 +++++++++++++++++----
>  5 files changed, 61 insertions(+), 10 deletions(-)
>
> diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
> index 998c5180a603..eda4de553611 100644
> --- a/mm/damon/ops-common.c
> +++ b/mm/damon/ops-common.c
> @@ -75,12 +75,24 @@ void damon_ptep_mkold(pte_t *pte, struct vm_area_stru=
ct *vma, unsigned long addr
>  void damon_pmdp_mkold(pmd_t *pmd, struct vm_area_struct *vma, unsigned l=
ong addr)
>  {
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -	struct folio *folio =3D damon_get_folio(pmd_pfn(pmdp_get(pmd)));
> +	pmd_t pmdval =3D pmdp_get(pmd);
> +	struct folio *folio;
> +	bool young =3D false;
> +	unsigned long pfn;
> +
> +	if (likely(pmd_present(pmdval)))
> +		pfn =3D pmd_pfn(pmdval);
> +	else
> +		pfn =3D swp_offset_pfn(pmd_to_swp_entry(pmdval));
>
> +	folio =3D damon_get_folio(pfn);
>  	if (!folio)
>  		return;
>
> -	if (pmdp_clear_young_notify(vma, addr, pmd))
> +	if (likely(pmd_present(pmdval)))
> +		young |=3D pmdp_clear_young_notify(vma, addr, pmd);
> +	young |=3D mmu_notifier_clear_young(vma->vm_mm, addr, addr + PAGE_SIZE)=
;

This should be HPAGE_PMD_SIZE (it is guarded in CONFIG_TRANSPARENT_HUGEPAGE=
,
so HPAGE_PMD_SIZE will not trigger a build bug like the one below).

> +	if (young)
>  		folio_set_young(folio);
>
>  	folio_set_idle(folio);
> @@ -203,7 +215,9 @@ static bool damon_folio_young_one(struct folio *folio=
,
>  				mmu_notifier_test_young(vma->vm_mm, addr);
>  		} else {
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -			*accessed =3D pmd_young(pmdp_get(pvmw.pmd)) ||
> +			pmd_t pmd =3D pmdp_get(pvmw.pmd);
> +
> +			*accessed =3D (pmd_present(pmd) && pmd_young(pmd)) ||
>  				!folio_test_idle(folio) ||
>  				mmu_notifier_test_young(vma->vm_mm, addr);
>  #else
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index a5e4c2aef191..78166db72f4d 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -4637,7 +4637,10 @@ int set_pmd_migration_entry(struct page_vma_mapped=
_walk *pvmw,
>  		return 0;
>
>  	flush_cache_range(vma, address, address + HPAGE_PMD_SIZE);
> -	pmdval =3D pmdp_invalidate(vma, address, pvmw->pmd);
> +	if (unlikely(!pmd_present(*pvmw->pmd)))
> +		pmdval =3D pmdp_huge_get_and_clear(vma->vm_mm, address, pvmw->pmd);
> +	else
> +		pmdval =3D pmdp_invalidate(vma, address, pvmw->pmd);
>
>  	/* See folio_try_share_anon_rmap_pmd(): invalidate PMD first. */
>  	anon_exclusive =3D folio_test_anon(folio) && PageAnonExclusive(page);
> @@ -4687,6 +4690,17 @@ void remove_migration_pmd(struct page_vma_mapped_w=
alk *pvmw, struct page *new)
>  	entry =3D pmd_to_swp_entry(*pvmw->pmd);
>  	folio_get(folio);
>  	pmde =3D folio_mk_pmd(folio, READ_ONCE(vma->vm_page_prot));
> +
> +	if (folio_is_device_private(folio)) {
> +		if (pmd_write(pmde))
> +			entry =3D make_writable_device_private_entry(
> +							page_to_pfn(new));
> +		else
> +			entry =3D make_readable_device_private_entry(
> +							page_to_pfn(new));
> +		pmde =3D swp_entry_to_pmd(entry);
> +	}
> +
>  	if (pmd_swp_soft_dirty(*pvmw->pmd))
>  		pmde =3D pmd_mksoft_dirty(pmde);
>  	if (is_writable_migration_entry(entry))
> diff --git a/mm/page_idle.c b/mm/page_idle.c
> index a82b340dc204..3bf0fbe05cc2 100644
> --- a/mm/page_idle.c
> +++ b/mm/page_idle.c
> @@ -71,8 +71,11 @@ static bool page_idle_clear_pte_refs_one(struct folio =
*folio,
>  				referenced |=3D ptep_test_and_clear_young(vma, addr, pvmw.pte);
>  			referenced |=3D mmu_notifier_clear_young(vma->vm_mm, addr, addr + PAG=
E_SIZE);
>  		} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
> -			if (pmdp_clear_young_notify(vma, addr, pvmw.pmd))
> -				referenced =3D true;
> +			pmd_t pmdval =3D pmdp_get(pvmw.pmd);
> +
> +			if (likely(pmd_present(pmdval)))
> +				referenced |=3D pmdp_clear_young_notify(vma, addr, pvmw.pmd);
> +			referenced |=3D mmu_notifier_clear_young(vma->vm_mm, addr, addr + PAG=
E_SIZE);

This should be HPAGE_PMD_SIZE (or PMD_SIZE, since the code is not compiled
out when CONFIG_TRANSPARENT_HUGEPAGE is not selected and HPAGE_PMD_SIZE
will cause a build bug when CONFIG_PGTABLE_HAS_HUGE_LEAVES is not selected)=
.

>  		} else {
>  			/* unexpected pmd-mapped page? */
>  			WARN_ON_ONCE(1);
> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> index e981a1a292d2..159953c590cc 100644
> --- a/mm/page_vma_mapped.c
> +++ b/mm/page_vma_mapped.c
> @@ -277,6 +277,13 @@ bool page_vma_mapped_walk(struct page_vma_mapped_wal=
k *pvmw)
>  			 * cannot return prematurely, while zap_huge_pmd() has
>  			 * cleared *pmd but not decremented compound_mapcount().
>  			 */
> +			swp_entry_t entry =3D pmd_to_swp_entry(pmde);
> +
> +			if (is_device_private_entry(entry)) {
> +				pvmw->ptl =3D pmd_lock(mm, pvmw->pmd);
> +				return true;
> +			}
> +
>  			if ((pvmw->flags & PVMW_SYNC) &&
>  			    thp_vma_suitable_order(vma, pvmw->address,
>  						   PMD_ORDER) &&
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 9a2aabfaea6f..080fc4048431 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1063,9 +1063,11 @@ static int page_vma_mkclean_one(struct page_vma_ma=
pped_walk *pvmw)
>  		} else {
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  			pmd_t *pmd =3D pvmw->pmd;
> -			pmd_t entry;
> +			pmd_t entry =3D pmdp_get(pmd);
>
> -			if (!pmd_dirty(*pmd) && !pmd_write(*pmd))

It is better to add a similar comment as the one above !pte_present().
Something like:
PFN swap PMDs, such as ...


> +			if (!pmd_present(entry))
> +				continue;
> +			if (!pmd_dirty(entry) && !pmd_write(entry))
>  				continue;
>
>  			flush_cache_range(vma, address,
> @@ -2330,6 +2332,11 @@ static bool try_to_migrate_one(struct folio *folio=
, struct vm_area_struct *vma,
>  	while (page_vma_mapped_walk(&pvmw)) {
>  		/* PMD-mapped THP migration entry */
>  		if (!pvmw.pte) {
> +#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> +			unsigned long pfn;
> +			pmd_t pmdval;
> +#endif
> +

This looks ugly. IIRC, we now can put variable definition in the middle.
Maybe for this case, these two can be moved to the below ifdef region.

>  			if (flags & TTU_SPLIT_HUGE_PMD) {
>  				split_huge_pmd_locked(vma, pvmw.address,
>  						      pvmw.pmd, true);
> @@ -2338,8 +2345,14 @@ static bool try_to_migrate_one(struct folio *folio=
, struct vm_area_struct *vma,
>  				break;
>  			}
>  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> -			subpage =3D folio_page(folio,
> -				pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
> +			pmdval =3D pmdp_get(pvmw.pmd);
> +			if (likely(pmd_present(pmdval)))
> +				pfn =3D pmd_pfn(pmdval);
> +			else
> +				pfn =3D swp_offset_pfn(pmd_to_swp_entry(pmdval));
> +
> +			subpage =3D folio_page(folio, pfn - folio_pfn(folio));
> +
>  			VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
>  					!folio_test_pmd_mappable(folio), folio);
>
> --=20
> 2.50.1

Otherwise, LGTM. Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
