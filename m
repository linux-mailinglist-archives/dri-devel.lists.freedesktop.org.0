Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CA2AD01D8
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 14:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12D1410EA8A;
	Fri,  6 Jun 2025 12:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NnXfVkE4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2072.outbound.protection.outlook.com [40.107.100.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BAD10EA8A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 12:09:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNAX0P0W7fOnry6PlT9ffgOHb1gLQ7EExKOG3qmxCEHJUI9/qJxCSVUhAnLuKOOB5EERINIWKEu50XmZNVyr6buZNqra4QfhfchSbbbQoFdeIjAR+9uBbGa26U9TB6ZN335vsg+nCSt9h47S/3pwSSqCdZ5cIdvO5YPhYP2+c29yRrA3RUI1d/ZMH1zxBX0qo/AwCXX5IT4LTkHdpcqLUVDadv0k7lpyXrjO4g7DObH051zsIn11q/GtzmipC2wD10xUVq2Bb8xOWr5zwiPY7vCgwQqL+NzBQkvBF4vP5daQxEki+q8Im9HJ4kDfsgchjeGG3tPOaSvCYRxM1Etzvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3vajKJzTltQ5QgU3O/kpupizQuA+grCCB+TaVPS2gM=;
 b=EIUdHdrhZPI+er2DOKULb+y1VQWl5CrN1KDNuGUqFedGp95T6y8Ve7gxgzW8OWswgOYBfsv3dwk8fgrUXLkNl+NWsQQ6qv9mfBtrqfadjAcVfCsPrZihZWWGJhHz1MHQQFvk5Ahuner4iy9tSJwsJuMXVQtxXZxEX4uouapJjUfwTSLNlvcDAbU7jGQrCzVuLzK0oHW4zOzZ6mATGhSCCQx90of+61H+ZYAd+Lustqz4PWa+53/4wVQqNVdaTu05gY5WjPXTMJJ6pYQak7WgV26aW+kO26bS1V6r/eg9SBSVsiQNoiiLHvVc2qxPHdwz9Q+qan6e6l6fi34pphDcXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3vajKJzTltQ5QgU3O/kpupizQuA+grCCB+TaVPS2gM=;
 b=NnXfVkE45jiEco5vgLUlgldbxDxZwqzjARarQSbeByMnmCUXbEdkCS4b2vO2epmm8/HA872rx1ZsOAmtFQOroMTI2OWQ3eCsVnAvwKVQo6Rp1T6kqxTdxmP0f4TZeTf14B0A12QV+CQfdBLYTkqw+S+ZnhJyBWs1AJxZ4fPuJhQsUCU16lmqnk9CBIMC8DLNoO39EhZgPiyjlvp/gKTqZR4BsqNBoKJjWZ1hI12HV2IMHQWI6YHN23mbij8rXIGNeEXqj++eGDeB8XHnEe1r0PAluCd9eb5fXGzmbei5MWURJK+W/GCesZTjMLmL1NMRFmuzRhCjGiF/TdNG9D3ENg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DM4PR12MB5939.namprd12.prod.outlook.com (2603:10b6:8:6a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Fri, 6 Jun
 2025 12:09:20 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8792.038; Fri, 6 Jun 2025
 12:09:20 +0000
Date: Fri, 6 Jun 2025 09:09:19 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 dan.j.williams@intel.com, aik@amd.com, linux-coco@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, linux-kernel@vger.kernel.org, lukas@wunner.de,
 yan.y.zhao@intel.com, daniel.vetter@ffwll.ch, leon@kernel.org,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com,
 simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com,
 iommu@lists.linux.dev, kevin.tian@intel.com
Subject: Re: [RFC PATCH 19/30] vfio/pci: Add TSM TDI bind/unbind IOCTLs for
 TEE-IO support
Message-ID: <20250606120919.GH19710@nvidia.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-20-yilun.xu@linux.intel.com>
 <yq5ah60u8kev.fsf@kernel.org> <20250605151029.GC19710@nvidia.com>
 <yq5a7c1q88oy.fsf@kernel.org> <20250605163339.GE19710@nvidia.com>
 <yq5a1prx8bb2.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5a1prx8bb2.fsf@kernel.org>
X-ClientProxiedBy: YT4PR01CA0262.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::26) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DM4PR12MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: 61e6fef9-f8ee-4289-2a00-08dda4f2f7cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmJocU9oVDE3eloyMXg4TFRMTWJnRkM2VmV6N0FtTEZCQkswRThCZEtldGxD?=
 =?utf-8?B?SUk1RjlobmFVMnlneXljNEg1YjJ5eHRFSElBMTJFa2JlTnBLcVEzK1dyVmEz?=
 =?utf-8?B?Ymhab0JPMXNFZ29MdUN0RVVGUGlGWGZpVjVmQkNURXZuWmVqVzhTcXNaelRn?=
 =?utf-8?B?bExCOGFxMXhOR2xmWU03NU9ERmtXSjVxYVpvb2xpUWdoSzE3K3dudlpjaXNT?=
 =?utf-8?B?RGxocmtWRzJzOFBOQjF5V0Z1RzBJQ0ZTQkJkdERtT0FnT2tYcWl0TWRBWnJJ?=
 =?utf-8?B?c1hKbVRETzliLzFnTnErekEzU1hXQ3RaaXA4R1c0SkpZdkR1cHVTdGFqdG5w?=
 =?utf-8?B?d1lCbTVCTkJhOElxR0F5MjM4c2J4RzRHN2wvUk82VzZTaGhIZ1FVcHBhS2M4?=
 =?utf-8?B?VzZRRHNwTXpoTDBYY3BBejhabEduN0JHL3pSTVhZWDFGNDFWZGg5S3ZUOGt0?=
 =?utf-8?B?RysybGROMGh2VHdSMUpxdGJZWERNczlreGN3dTVWK09SbUkwYlZWYWtBNVB0?=
 =?utf-8?B?dmtWRzRPZXhuSlJ1TTljZmFHV2d4Z2ZWMGF1V1ZuYU1GbnhFWG1hL0wzZFFN?=
 =?utf-8?B?M0F5eVpZYTN0NGNMTGt1eGJDMGRaRDhVQUVCaExSOFNhVS81RitEcW5CR09X?=
 =?utf-8?B?TnR6S1RLVVQrMHhLaURiK2RZZGdqZ1BHalRTZUNXNFptRUtLaGRJZ3c2dXBl?=
 =?utf-8?B?VXo3VTNwY293MG5vQ2VocXo2UEUrWjhWb2k0QldINFdUMk90NlVxUUtpemg3?=
 =?utf-8?B?SkJFamdoQVBFNUlTT3h6U2FvWTFiUU5lMmZpc2V6T1ArdzRhWUxPeG50Tmsv?=
 =?utf-8?B?QUVPa05XbmY3cWZiRGI3V29DVjNvcWIrZ3d0LzU3dTJRTUJ4VFFFRjBUSTda?=
 =?utf-8?B?QWVuUStUZTFzQnlNbzRyamJZbkZNQkxiQ2dTTElrOVJPL0l0ejRJb09WeWND?=
 =?utf-8?B?bjJZQVM4TnB5Q0pvQWg5R0ZxTlFDSWlsYW9FNjlLbVJNMFpNVzB3WWlyaVN4?=
 =?utf-8?B?TExPNHkzN0RjdHgrRy9FcnZGTWcydXRSTTduYUhSN3k2anhoNG1oN1d5Ylpj?=
 =?utf-8?B?ZTBkMHZIT0FIN0x4UDZDUFdtLzROajRaTHJ3bE9lS3hBZnZjR1NvWkQ1Szkv?=
 =?utf-8?B?TlFKUWM1WGhwY3MvcERYdG5nZ0srWEt3cUpIZ2gyMG5BUEF2c2JyWC9vMENL?=
 =?utf-8?B?T0ZsRVpEK1FxSkdhV2V2MFNIN0c3d3dGeDl6TTF3WE9WKytueWM0eHRtUkY0?=
 =?utf-8?B?QnVWNmM4eFJkaDkrVi95Q3IvcTVmbDZFS3h2MEw4Sjc2WFY1Yk43bThXcmti?=
 =?utf-8?B?K3Y5dTZVSlQzU2xFMVlvUGttYzJTYUFEbzVRTXV1MWxkRWk2VXRKMXpQb0Q3?=
 =?utf-8?B?dnYycEE0cjFTd0Rvalo1Slhjak1zcVVFQTRWZHRLdzRubkFsWFdDUWdBbkkw?=
 =?utf-8?B?dXJVdmxrR0VhVmkwYTl0cktqa2RSUnVqSGorVUxnRGZxSHYvdnNDODBsYlo0?=
 =?utf-8?B?NEIrNkQxV0V6b0ZqNGRMYlVRVHVsbFpiZTFqRm1lRlJzMzNwWkdpRkhDb1BY?=
 =?utf-8?B?RVd0R09xRW4wQWxpd3Y2WWJnUEFYVXNMbXpDV2xybFhpQm0xR211VXJCaFpa?=
 =?utf-8?B?dWRUTGNXaFRNYU9sSXFnckl4ZmRpS2xDYllzR1pjZHh2Mjh5cFJ0ZjdKelN1?=
 =?utf-8?B?VzIvcmUvSnFVS2VVZzhsK2lST0w4cWNKQzZsNk1Vb0RDNnluOGxncEd5a09v?=
 =?utf-8?B?TXNjeHZUNGVLcUtnQzF0RmhjVHdHNTE0Nk5QVktQRU1hK0lQcFhqME9SalVO?=
 =?utf-8?B?cURYTENBOC9lWjVRQVFteE1xL3luMzZ0ZGJXeGVzSnhnZHZEeks5Y01ZeEtM?=
 =?utf-8?B?cEdBNmkyQzBLNk5RRHBCbnpZZVZqWEVkNEF6T09HVE9WeDkyVFRXSHNvNEVs?=
 =?utf-8?Q?RvbPuwxiQbs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDI3Q1VBM1ViK0Y1RHdoVEpDa3g5ZGtPeTVha25IVmhPSmhBUFlDdjN2WHhm?=
 =?utf-8?B?eW9TTVlRcjZpSERoYjY1YW5EQXppZ1RlajdtYzRtY2c5dlFOSkk2WXpWMkF3?=
 =?utf-8?B?NElhM0RVU0J2cEs2aEh0WCs4S2txL1VsWGZTbTAwZjMzTnJ5SVJpWGMxcVQv?=
 =?utf-8?B?TDBiQTlpdnYwOW1FT25xYVZXcGJMRHpmajYxbEdpU1FzdGladVJVTXhDVlVk?=
 =?utf-8?B?akVjNHRTeDNBdTNNdVFVamdJYjk4QVVwY01aSFcwNk9DOHlmUG9lR3RjcDlV?=
 =?utf-8?B?eldGZ0tFa1lWbDVFTHFaVXJFbTZ2bzZMaThDQTBPM1ZFTXNtQXozYURQOGxI?=
 =?utf-8?B?VTA2L1pqMkNVY3pWMjJBTVNKRVVSMXVmeW0xb3lIYmVEMG54SURpU2tVNkhD?=
 =?utf-8?B?NUowZDZJTUpQaXJzZDIrNUh2bHVTVlVhVHVBanU2QktYdDVOd2JTNTRibG1B?=
 =?utf-8?B?LzE1NFhnU29kY0JhY2ZBcVN1OTR0UU1wNmx2M2g2ZWtPZUpPQ3Byd3h6U1NL?=
 =?utf-8?B?UGZ2RW9vTVp6ZjRCbk12UE42Y0pZZkxOdS9ibGY3My9OMEgyMzdGNHZpUS9i?=
 =?utf-8?B?WCtIaEpvbU5kKzAzSGdHWFJkRzlOVWRjaDF3RGI2RFpGUVA5czlEWkxaeHJl?=
 =?utf-8?B?V2lubnhSWlVvR2c3bjVLYmM3U0JQYUZNTWY5akU1eER2QXFJQU5UQXNBSTV1?=
 =?utf-8?B?US9PYk0xN1JPQXRnVGo2SXZXMWJMMksxLy85d1RmSjc2KzR1b3F3SmxpbSts?=
 =?utf-8?B?Sll3UnZPVzVOSktmSEZzNXdmM3RhNGV5VmhQampHL2V0WTl2Qzd3RkRDR1VW?=
 =?utf-8?B?YnRxOEM0SzBWcHMvN0pWZ2xFdllSQzFqdkJzOFpya3FsQzFSdVlUWHFHbUxQ?=
 =?utf-8?B?dXNmRnNIb0lDVXlJb2R3TWxSdnh0TjIwUFlHWjNwTTlKV0xyVUYxcGtCYVNa?=
 =?utf-8?B?Vlp0cEFBVzkvT0M5MVVHMXk0Slg2dkYrZ3BXMi8wMzUvYVNTMXR6Zy9hNy9n?=
 =?utf-8?B?eVV1bGlWbXV3U1JwY0hmTEFOUDU0LzM1OXEwUVhta3dhVDJLUFUvYlJmbjRI?=
 =?utf-8?B?N0tBVFZhZ05laG1MWUZIR25sbFRQYklwdGhTTFF5YWNyL1gvdVBqOUg1QXRw?=
 =?utf-8?B?OUNrbEsvNUxZY2FtbjNMOWVxS0Q4TG1GdEJQMitPV04vbjF3VURmUFNqbUhK?=
 =?utf-8?B?bGgzTDBpQUludVY1TGZPUnk1amoxNDZ4WFRqc2RnMTRGY3F0NkpVc3VnODNL?=
 =?utf-8?B?VG5LbVRjNEsvc2R0cGgwYmNRNTNlNVM4dSt5cEFkMDhVMnVsK3cyK1lDbTdr?=
 =?utf-8?B?dHNuYjNUdXF5dGpTUjQxUk4wZHpYTy9SanhHL1J3ZWZ2RGZPbzV6RzkwQmhs?=
 =?utf-8?B?R01HOGxrd0FDSUh5T2hwY29yNkVUZmY0YWRZTFdjOG5DZ2xhVEtjM09iRkZy?=
 =?utf-8?B?NUJrMGlwQ081U3F0Z0tvR1FIYVZLNlhuME8zSlZJWUtIZ2J6bVFkbEZwcUVX?=
 =?utf-8?B?S2xnd3JTNTR3ME9HeVN4QUVzb2E5VVRaVTVudlVJTXdOY0hmTXV2ZEJ1N0Fn?=
 =?utf-8?B?eXZEdm44RDRxd0xTSHFKU3lOZHJVUkVBbjdpaStxTVVsbTd6Wkp2blB2enli?=
 =?utf-8?B?Qkd5a2ZucUxMNjJUbXIxTG5oNjZOK0F3R1dqUVZsNktVVjlCV1ZuMG01c0l3?=
 =?utf-8?B?dVhXVk9BTnFDVDlLa0U1WlNKcW0wZVYySnBsRVNDZ29QMzFhT2x0UnAvM2hG?=
 =?utf-8?B?RVViek90UGlSdXFVVXZsSVRuVUxRTTc1TmdKbFN3OWRtcW1PaVI0WnZMMjI3?=
 =?utf-8?B?b2M4RUY5UW16OHp1WUNpakZCTHdMNGVDLzFOaDc0TC93ZlJFV1hYZzkrRG5a?=
 =?utf-8?B?Y3RkbVdmRThRRVJrNGNLZzF6bERnajdBd1JHV29QNnlCVFcwWXBDeWx6VWVC?=
 =?utf-8?B?YjN5UWYrYS9ORFd2VVZCL2NyUG8zNUY1YWlCcktBdXowRi9GZ29RRnNya1p5?=
 =?utf-8?B?UktpTEVvR1FpVFNCTm8rRUltMUlkQWtLQTh4dlVJRFpRTTBHUzg2clhpZWti?=
 =?utf-8?B?TWY4K1ZkWUcrQjU0dURST2VnanR0d2lUcm16RWtyUXBlWFMyQnpibmlJTWEy?=
 =?utf-8?Q?MXVfLK7ldzpLMsANUdIQvzUqF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e6fef9-f8ee-4289-2a00-08dda4f2f7cb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 12:09:20.4491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEywOH8tCuw6hGedYoC6SP5tQZM2Inu6b5WsJrLSP3+gVpVC/TGu9ZJOAg1LK4N6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5939
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

On Fri, Jun 06, 2025 at 03:02:49PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@nvidia.com> writes:
> 
> > On Thu, Jun 05, 2025 at 09:47:01PM +0530, Aneesh Kumar K.V wrote:
> >> Jason Gunthorpe <jgg@nvidia.com> writes:
> >> 
> >> > On Thu, Jun 05, 2025 at 05:33:52PM +0530, Aneesh Kumar K.V wrote:
> >> >
> >> >> > +
> >> >> > +	/* To ensure no host side MMIO access is possible */
> >> >> > +	ret = pci_request_regions_exclusive(pdev, "vfio-pci-tsm");
> >> >> > +	if (ret)
> >> >> > +		goto out_unlock;
> >> >> > +
> >> >> >
> >> >> 
> >> >> I am hitting failures here with similar changes. Can you share the Qemu
> >> >> changes needed to make this pci_request_regions_exclusive successful.
> >> >> Also after the TDI is unbound, we want the region ownership backto
> >> >> "vfio-pci" so that things continue to work as non-secure device. I don't
> >> >> see we doing that. I could add a pci_bar_deactivate/pci_bar_activate in
> >> >> userspace which will result in vfio_unmap()/vfio_map(). But that doesn't
> >> >> release the region ownership.
> >> >
> >> > Again, IMHO, we should not be doing this dynamically. VFIO should do
> >> > pci_request_regions_exclusive() once at the very start and it should
> >> > stay that way.
> >> >
> >> > There is no reason to change it dynamically.
> >> >
> >> > The only decision to make is if all vfio should switch to exclusive
> >> > mode or if we need to make it optional for userspace.
> >> 
> >> We only need the exclusive mode when the device is operating in secure
> >> mode, correct? That suggests we’ll need to dynamically toggle this
> >> setting based on the device’s security state.
> >
> > No, if the decision is that VFIO should allow this to be controlled by
> > userspace then userspace will tell iommufd to run in regions_exclusive
> > mode prior to opening the vfio cdev and VFIO will still do it once at
> > open time and never change it.
> 
> So this will be handled by setting
> vdevice::flags = IOMMUFD_PCI_REGION_EXCLUSIVE in

Not like that.. I would suggest a global vfio sysfs or module parameter, or
maybe a iommufd ictx global option:

 IOMMU_OPTION(IOMMU_OPTION_OP_SET, IOMMU_OPTION_EXCLUSIVE_RANGES)

You want something simple here, not tied to vdevice or very dynamic.

The use cases for non-exclusive ranges are very narrow, IMHO

> and vfio_pci_core_mmap() will do
> 
> 	if (!vdev->barmap[index]) {
> 
> 		if (core_vdev->iommufd_device &&
> 		    iommufd_vdevice_region_exclusive(core_vdev->iommufd_device))
> 			ret = pci_request_selected_regions_exclusive(pdev,
> 							1 << index, "vfio-pci");
> 		else
> 			ret = pci_request_selected_regions(pdev,
> 						1 << index, "vfio-pci");

And IMHO, these should be moved to probe time or at least FD open
time, not at mmap time...

Jason
