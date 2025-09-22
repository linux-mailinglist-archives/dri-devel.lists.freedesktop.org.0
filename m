Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6201EB9120F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 14:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B5610E46C;
	Mon, 22 Sep 2025 12:29:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="g/WH078R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011058.outbound.protection.outlook.com [52.101.52.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E464C10E465;
 Mon, 22 Sep 2025 12:29:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/uNe6mxbIHirgZ3gE1wpWybxETUwMo2ycj6qaPhz5wQEaCY7s80BFTivko7pfEjpPOfSRZ5BfblQU+7wUTZeXU0ZFxi81ZmbG44BJ+Nhe37RztlgWgrMz6hSVazWk53Z4e/mUdAGxMw/NJcjUxXCFEJrTCcPT702BUu4kOsBGNHj6yGxt3C1W7pgQh7zcTXwv2/DaxCJwr1KKgXJaHVEQucl9sxPe25E4dZFActm94bMDNzuFCrmyWo1lO0EpmmElZuqir03jTlLJxDifrCYRhT18hSmzMGXubUvp3cNxeq0Lm5j16d69UvY2h+0pTmQAPDE1lfl3InloC8ZJCZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8mISv707p8YICCFkJ2ogj5CLUto2umy3NirBer7ink=;
 b=Lk6fPxU2ztXcN+thJiIjMbckVD2g/Xx63Qpzu0GeEkCRsoDaZ0/wq0YfvXCnlG7Pu8QPaDwwd/oDRX79CP7cI4MDbU8K5Yb1FvxOmtVc3wRgsmdx3/muAzz9HFQJOUrNouIJ0pKoxkU7pixf6dPzJaSZlc0mtTTvfLwNnj5ZAmvqR4sR+6HzKDbbql6yBaGuOqumcE75bg8Vnm2DlsWJZ5zeRgPE9ZEMo/e/uOleIqNKI4DWb7tX6Gk4KK4UASSapPpEAL/jeW6lf4YhZU/qvxar9imbgET2Bw/EFIglayM+rw6aGHDuL1Y9xgyGx8UA8SSTUIFeOQoSE11bsJlHDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8mISv707p8YICCFkJ2ogj5CLUto2umy3NirBer7ink=;
 b=g/WH078RI87ZA9DMMSIjXeJT9+NE2HBA6QnEtRSfAMHKtHQ3MXNTJ1vrAO1cFwZE6uAy9jnvSx2YENRinCyHpNEToLOqxMb2qDGh7nQaVJkhBrFAfrm4LTqL/SgENKp9EmnCsRgIHbDE4KGYBj8toMrM/kax8jdHmZ5H98qJDgqMrBKc4HPirhNkFVPzUUY1cWfpSeHAikBmVy65HCZvBGIHPkoAVQ8LrYbUua7oljKJxmcsob+Rc+fqDkXmfJ3225JuZ2wsYPOPSmdytFlkj29XEi9pE0gaqzYJRydjPeeM1sdO3qlyHuGOsp3dbbbBzzyqp0HEBeTFe0FG4TJjgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by DS0PR12MB6438.namprd12.prod.outlook.com (2603:10b6:8:ca::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Mon, 22 Sep
 2025 12:29:02 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 12:29:02 +0000
Date: Mon, 22 Sep 2025 09:29:00 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
Message-ID: <20250922122900.GV1391379@nvidia.com>
References: <20250915072428.1712837-2-vivek.kasireddy@intel.com>
 <20250916175709.GA1324871@nvidia.com>
 <IA0PR11MB7185186F6AB160AA7F8F0FF3F816A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250918120431.GL1391379@nvidia.com>
 <IA0PR11MB7185C96268ADB5530B343ABBF811A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250919122931.GR1391379@nvidia.com>
 <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
 <20250922122018.GU1391379@nvidia.com>
 <4e3919c3-3d1b-4f34-a1e4-5e9e7a5e6e14@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e3919c3-3d1b-4f34-a1e4-5e9e7a5e6e14@amd.com>
X-ClientProxiedBy: SN7PR04CA0119.namprd04.prod.outlook.com
 (2603:10b6:806:122::34) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|DS0PR12MB6438:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f8d3acc-54c4-4878-a38b-08ddf9d39ca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0I0TkRCYzJMdWxWeWhzcXNZRExXR3hnb211T3hwbFUvaW53aUtiTVlCQ2RH?=
 =?utf-8?B?WGhsNFNScTFuNHh1OFlyUEtGRndnaE1CVnpNWXg0QkQwaHZVcXRZUHJOZnRs?=
 =?utf-8?B?UTc0SklEaGZ2MFJyN1VQbzZZM3NKbHVQMlR1cGtLRzREN2kxUTBOSGRnY3p3?=
 =?utf-8?B?MUwzbEZQQ0tjMkJGTisxcjVWREF0d21oVFdtMzRhVWc1RkUvWHhXVlFFeHQz?=
 =?utf-8?B?MXpPUXdVcVFkbnBJS2NybWQ0VzE5UUxoSDdnOFlFWDk1QTVNOWErUlA4QlRO?=
 =?utf-8?B?UTBzSkk3SjBPVTBlQ3JidDV1a3d2OGh0ODY1SnNGeHo3aVJMZTFGS2ZUdHd0?=
 =?utf-8?B?cG9yemxpSGxCa0VYSkdUREtIQVB0U1pWL0xKNWJkVGRpU3M3UTgxQjhYcTEx?=
 =?utf-8?B?eFRub1FlSkVXelR4MHorbHdnelFTaTUycSs1UGhuRHhhR3F0aEZDMm9tZ1Rh?=
 =?utf-8?B?N25qVlgyREVicE5NQnBaeEgxZVNJSjJzRFFreXJONi9pcm13R1pGay95RjRH?=
 =?utf-8?B?QWpGZ0lwaDJhMzVPblBneWU0SFVsUkllVnl1UU84SWlYeGZFZ3hCY3MvNUw2?=
 =?utf-8?B?U3MrV3lDdlBpVU5rNk1HWGgyZkhmUytUMXJMSGxTZ2VGRDhnZE5qRTJMeWZt?=
 =?utf-8?B?UVBvQXV3TjRwVHh2NUxDRS9PK3ZFU3dxSWNTQ01OMWxqU3F4WFpLQk1MTXFN?=
 =?utf-8?B?MlpKVnhyRnVJbGp0WEoxYXFacFFWZGU3MlNWdGFTaDdkN3JwY0RERW5qMWZM?=
 =?utf-8?B?a0JIYTJPZ1dBZC9MQnRNZk9rb3lobUJuNm9DTldkanp0RUwyOXd6czgvR3dU?=
 =?utf-8?B?ektkeVcvMWlDRUtNeHIwbjZ6K1VFOGRpU1p4eTkvNGlUMEJZc1I0Zm5CdC9Y?=
 =?utf-8?B?dmhMYWNNelNYQThacy83ZkNFTmRLK05abVJGd3BnRUhMTXpYanhGRzRCR3Rq?=
 =?utf-8?B?cDRqb21qMmxFcE5uTUh5Njk2bStNVFFqS3plNVdDSmtwdXNGRWRxOTR4WC9n?=
 =?utf-8?B?dFBCREdKV05weWZDSEZLNE1sb3kwc2VzM2dNdVdIQmNUcks1OXJUN3pDTi9P?=
 =?utf-8?B?UC8yNGxIVENUOEk0ZzEwUEp4dmNVMnYySStvZGVkbGgxSTl3WjEzU0tiNEI1?=
 =?utf-8?B?TW9VT3pZd3kzMUkxZW1HeHEwbk1wR2sreDl1YjgrTGtYS2FOMVhPNWdMaWZj?=
 =?utf-8?B?allSUzdrK1J6bFRmSERveGdLVGxqQ0VucWRza0tPR0FzTmxkZkY2QktxMnhw?=
 =?utf-8?B?UDJ6M0xKOHdSVU9EUHo5V3pIMFl3ZExJakJqVzVMTkhPcmFqMUJIcEpWMTZM?=
 =?utf-8?B?Vzg2c2F4bWdDejBUS0QzZk1Gb2wxSC9GOCtHVjY0bEl6a1ZGaDZSN1JobzJq?=
 =?utf-8?B?dHRqTVpBbmlZa1JQYmErVTd4Q3lDSGdmanlhclF2Q0ZxSmF4MjB6cXJra25B?=
 =?utf-8?B?V2VmVkdlYytRVUVBMjNiQ2JhWGk2UzJTZEhESlRMS2JDMjdGMWVQSVdsdHBU?=
 =?utf-8?B?K2hnMk80VjBOZzdwZDFFa3RQVk4wSHJSMTM0VVFoalFvMHdyT0xBTjhtKy93?=
 =?utf-8?B?TmI1dFBlSWY0elBIVTc4d3h1T2tEV2JaN1pCZUdZbkZrTlpXNHZrUlFKek5C?=
 =?utf-8?B?UUF1YWNqTXhJNWlEWmpCNDIrS3FqUWpiaVhLUWZxT2hVZlFwUnI5MkJGZjNZ?=
 =?utf-8?B?VlduUDNiUVJaWExyRTdqY0JFZlpsMUlUc1R6NmxqaUh1MDhSNFlGYldVZXN6?=
 =?utf-8?B?VktrVnZOWDk3YldrSmJyRGE5ams1aDVQa0pCOWNwY29DalRpVFZOQThjZnRO?=
 =?utf-8?B?U0dRV1JXemJaSFZTcDBSUHFBbmhETmxJRTAvSnMxTGV0ZEtDU2ptUGFnSEJy?=
 =?utf-8?B?RHc1My9FRjFyQU5OQjRTK2VnaGlkVmxLMFowNUVOQnBMR2UrTWVYbFBuYWNk?=
 =?utf-8?Q?nIcRWMA1ifc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5757.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlIrVXlQaVZtMzcwMXpYSW1FdjJXV0hXVHNQL2RKazlaZDhsOFowbWVmYXph?=
 =?utf-8?B?Z0FBLy9UbnZOeGF6WEx3M0xLcXBseU1zNHVQd1RsY2hQdHREbllOQTlPZ3VQ?=
 =?utf-8?B?ckxadXVtZ0VvTU5JcU1oa2NMWTBZYms4c1JuakdlcVhKS0p2NEFPT25LMnpw?=
 =?utf-8?B?TTEzUk1oMnM1aXdxc3EwYURMbGQrTW9tZXZQQkNDWHdONEV4T1NDeTh4a3Ny?=
 =?utf-8?B?VjU5SW5SUTlrUHFRYnRGVkplY0dYOFJncUMrYzNXVUVFVC9mQkNickVoQnUz?=
 =?utf-8?B?NWF1ZVY4U0tkbUJqWWxxNVV2VkhpZFJLbVhudTNvU0pWSnFTWXpYMTFYcCti?=
 =?utf-8?B?ODNyb3phcVVOcFZuRGcxbitPU1R0UE4rVVRNR1UyTk5oTGlOTStYeGNrcElH?=
 =?utf-8?B?dDJRVlBXY3YrVmJ1MmNPcTlRcDZaRDU2WldYaDRLZ0I1U21CNFdWR1FCNDJV?=
 =?utf-8?B?YzJXajkwVEJMN0gvNlpiWEk3Y1E2aEtlb0pPdy9uQkdKZ2dUeHNkMkx0dGxN?=
 =?utf-8?B?SUg3OXJDVGk0TEswdGxVNlBPd092SXhtUVRDY3lUNnNacDBYRDNxSEpjMXlR?=
 =?utf-8?B?VU5TMXZjTWlMZlR0clh5Qy9sanpuRXFST0lCNE9abHBpdFZhTXBKamZkNU14?=
 =?utf-8?B?dnI5THJycTByYTY4aytqOFJUMjladFRuOTFSdnFScVg1RmpYeEVVcFQvbGQz?=
 =?utf-8?B?U1h2ZGYvVHVxS3J2aXlXV0tHTUZwOVJ3MlR3MnF6T1ZnZDFKQ3NiZmVzUGw5?=
 =?utf-8?B?d3FXUmllWkJKVDV2d29hVjJBNDl6MW9ucjI5MXp2M3Q1d3cyM3N2Nk9odmh6?=
 =?utf-8?B?UEhQTDJ3VzBUSVFvMzZOLzJwSkNqMkVDSG1FeDlXUWVyMG4xV1k3bFgwQng5?=
 =?utf-8?B?L05UUDdCeWEyOStSYzB3M1lKOGFocTRZMDUxdDIyT2pzZ05ESzdTMjlHUktF?=
 =?utf-8?B?aHpjNVczTXo4QUVtNEFZeWdvYjJZU3RHNDFMZk9JL280a2hvcDAwZm1Ta0Y4?=
 =?utf-8?B?a21jSENnR0o4U0ZFTk5KMXNvbEliWlJpRit4V1BaWllzNWV1T1BBV0RxbWt3?=
 =?utf-8?B?ZEdmMmtFRWhTTEdRSm8xL2VVVXowalRxV3Z5NXBydnFXNW44aVFBVHF5ZjdZ?=
 =?utf-8?B?ZEE1bkxHdTBYRmkydjJpYklMclFrUVBENVp4Vk90bUhoaURDQ3FWb3psKzkz?=
 =?utf-8?B?S0Q5R05rSEtkYUVBcFhxVVZ0MnNDb3NYRHJHc21MTlg3b0J5UTFob2hhZ3Z6?=
 =?utf-8?B?Nzd3S0xlRVBpazlieWFhZitsOTZsdU5lUW5aZU9Ga204NjRUcXhFalY2NHFh?=
 =?utf-8?B?bDFneVdUS2dpbDRyOW9uNUR2WWZEMk0wZUh6eldQQTBoaHZPQkJDN3RZQWZ0?=
 =?utf-8?B?alRrbWhBamtaMk9ycEJ0YmFTMkg5TWFJRnRjQ0FMUlVSSWxtMWgxN3ZXV3RS?=
 =?utf-8?B?dER0MjVKRkw5Ukg4S3h1ZVJFOVFJRWE4NEhOcnNYME5nb2xJREFuSDVYZkpi?=
 =?utf-8?B?VzR5SnBmRERWT1pxUWlFdU1keVVKSEk1c2FTQmRVOGlIYmw5ckFIcWpyODBC?=
 =?utf-8?B?azQ4WE12dStYVzI3SG1jY2FGL1JRVjMrYThBeVBRRXZCRWcxcnRkSWlrOW51?=
 =?utf-8?B?cEpkUndNNzNVVkZocG1sZUR3TnJ6QUNtUUFqWDFxRFowN2l1RWUzOXdnb0lV?=
 =?utf-8?B?d0NJV0FYZE9HMGZNZzNhWFdSR1FYc0NzZEpRSVBBTWdpSmlFRnhrRnVzOHF3?=
 =?utf-8?B?cTZQMG1hSm92SVBKOXBHVC9mZDB2MUEvUnMzUGdjbDB0THg0Y3pkZ3dBRGhj?=
 =?utf-8?B?Q2tLZXBOMUxTOGJkS1NUZUZFTng4dm03VjBweVFYWFZ2UDJyY0F0MU9aeGpH?=
 =?utf-8?B?MUMwZWt0TUw3dExZeEFuaE1vRk1wNUNRaEZ6dzVlaVZZSEwydUxYcS9oVWVQ?=
 =?utf-8?B?YTJLM004Q3NKb0lCRzUyWXQ3SitOZHNzZUtsZjRXNXhNOVBnbU1XQ2pwbS9v?=
 =?utf-8?B?S2NSa25jQVVFRk1nUDRPRXM1OWFBV2Z2blZYS3I0VUxub1hvdFVFamlScGZC?=
 =?utf-8?B?VWVRejhLTllnc2c3S3AyeHVIUi9iNjhmd0hVYVJZckRONXM3NEtET1BVazlE?=
 =?utf-8?Q?Qp6E=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8d3acc-54c4-4878-a38b-08ddf9d39ca1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 12:29:01.9651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QesAcNvkZoRxEKPDqA0xCDWp95LLnQRG18VgGjfoeuS4eiB0AYKsAAYjJdKDRHS8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6438
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

On Mon, Sep 22, 2025 at 02:25:15PM +0200, Christian König wrote:
> On 22.09.25 14:20, Jason Gunthorpe wrote:
> > On Mon, Sep 22, 2025 at 01:22:49PM +0200, Christian König wrote:
> > 
> >> Well what exactly is happening here? You have a PF assigned to the
> >> host and a VF passed through to a guest, correct?
> >>
> >> And now the PF (from the host side) wants to access a BAR of the VF?
> > 
> > Not quite.
> > 
> > It is a GPU so it has a pool of VRAM. The PF can access all VRAM and
> > the VF can access some VRAM.
> > 
> > They want to get a DMABUF handle for a bit of the VF's reachable VRAM
> > that the PF can import and use through it's own funciton.
> 
> Yeah, where's the problem? We do that all the time.

Well this is the problem:

> > The use of the VF's BAR in this series is an ugly hack. The PF never
> > actually uses the VF BAR, it just hackily converts the dma_addr_t back
> > to CPU physical and figures out where it is in the VRAM pool and then
> > uses a PF centric address for it.
> 
> Oh my, please absolutely don't do that!

Great.

> If you have a device internal connection then you need special
> handling between your PF and VF driver.

Generic VFIO can't do something like that, so they would need to make
a special variant VFIO driver.

> But I still don't have the full picture of who is using what here,
> e.g. who is providing the DMA-buf handle and who is using it?

Generic VFIO is the exporer, the xe driver is the importer.

Jason
