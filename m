Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689B8C15033
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 14:59:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E1910E406;
	Tue, 28 Oct 2025 13:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WWyxexrW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012008.outbound.protection.outlook.com [40.107.209.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1381310E3FB;
 Tue, 28 Oct 2025 13:59:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LslehMp9OOWi2FQ2P22I1Xk9H5TO0pzvMcH6vm5lOwx1tbyF1ZA5j9+oXJ8G0a3dQaOGZoUi/6J/IkEYrNPc6g5sGfu6cERTYl0dpPgM8F1b/IrjHy2UYo+qO9+EnXJ5U82PQikk4jiSvAIMH/vwMZTO7eSJXRyCS5Tyf05g8RTrNlJd8EiMD+NWd7yhw8Zte+kUjHbM8pfHokRPilj5octCUsp2mqv7sGUXlsW5v02lrMnUgy+CMzgnjJC81Cbyw7qGaDu1nOW79TGZTR0zkl43OTTbLR3C09GY/Z/OySIksLl86tuUSBzE5bg1rHtUqebp/KyJyySyBn1voL4OWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Rd2Gno2NwHM3qO6D0XF0R4JwBU6Ha+Lh+hA87Eg3GA=;
 b=iON3Ch7ZvcIiKU7+6FvjPux31SlibUMFH0r/qVRBpnB2RhofvbruKSKwLUGjOuxirr1lR37r5L3YGv+Iiwng+KDfxaFUiyv+ggjlQpxVQ9TbeE+q7XdRwWGE9IbTT6iAGQ80e793KRFkLHusDWN99VkoYP40xK6hGANZjYqgOLHW6fyBD5W0VHYIiGijDKxSCPPRU68e41A6yDlx0iqW03a8dm/CMMUTob2cxRw6uR4+kEfQihHCyYSJDrSUpCJtBmF9lSge/zI+orIRtLz0nnH/yW9sotXJxUsnDhBV23fMtv3DqXi5wT/9GEEO9MPvPEGr4YALl5ONHU4rOCabBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Rd2Gno2NwHM3qO6D0XF0R4JwBU6Ha+Lh+hA87Eg3GA=;
 b=WWyxexrW0NONmw259XQC1QDN7JyjEJk/PCI8Qc9x7NIrLyndJ6LTz9E1sUfjJ+l83zxfqizEjLyeH+8I8mA9GcrdJTNnO0R5QqntAXJNEPKBIk7bOOoTz4VKE1KJxZg9dOfjQx2ivhAMVbbA7cy+UALVxREPkhFR8MmTyWpu9qo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BN5PR12MB9511.namprd12.prod.outlook.com (2603:10b6:408:2a9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 13:59:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 13:59:04 +0000
Message-ID: <61c5edcb-2b22-4583-9138-c117bea7a9b3@amd.com>
Date: Tue, 28 Oct 2025 14:58:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/8] dma-buf: Add support for map/unmap APIs for
 interconnects
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: Jason Gunthorpe <jgg@nvidia.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20251014071243.811884-1-vivek.kasireddy@intel.com>
 <20251014071243.811884-2-vivek.kasireddy@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251014071243.811884-2-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0640.namprd03.prod.outlook.com
 (2603:10b6:408:13b::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BN5PR12MB9511:EE_
X-MS-Office365-Filtering-Correlation-Id: 1352b08f-4efe-4d92-1ac9-08de162a2776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2xSTWlrN3JxZWQyM0RtblE4QnNreU9BVmY3Y1hzdHQ3bW5xY0Zwd1hBc1Jr?=
 =?utf-8?B?aXhsM0RWcjNRZ2JGTDkrbkxnRlI4d2R1MytVZzVUTFp5dS9lTmZucHVyVWFh?=
 =?utf-8?B?ZmFDTDM3MFFoRVJQbVJjazRYYkhZVmhoRjBaakVhT1Y0d3djUkRHblZEWHJB?=
 =?utf-8?B?S1VoN21RTWJhZldjaGJVYzF5TXRYcWt4OG9JSkh2bDZDOHpXR2g2dlk4T1Fj?=
 =?utf-8?B?KzBna1FTa1V0Y3NQajNobGtGcy9pM0NBS0d4dFVrMVQ5c0RLZzRJd0UxSGVO?=
 =?utf-8?B?TkVZSEF1eGZ4cVlKN2txdDB2NHNTNWVCd3JPdGhLbTVZYlNDQjM4b3N1QlR6?=
 =?utf-8?B?V1VDbTVGZHJYV3gvMzdmRDFpUldva3F5R0xsUmphd2kzaXpnVmM5aDhjV3JY?=
 =?utf-8?B?Wk0xNldsemRmTHU1RkM4WEJ1V3A2SmdNVjlYcW1mU3JMYk1qUVBHM3JpQzRR?=
 =?utf-8?B?WDZqbFFQUUFRdmlVNHk5Qm9MR3UvakwwMEZzYmtxYzFxTHVEZGwwcEpzc3FT?=
 =?utf-8?B?cGIyTzRMVmRYS25MeExtcWtOcHBrNStveks5NGtRZkpGeU42bEFMQmJINm1L?=
 =?utf-8?B?VTFJRkdmQ25Sek5pa0hiYmNjcmU4QjdIUHBwY3pVZUVUdkV4YzMvOVJuSzlN?=
 =?utf-8?B?UG5zWmFZS0txUi9NcGlNZnZFTjUyS1pjYUJJcFcvVFVtZVlDd0lPUmdab292?=
 =?utf-8?B?ckRlZFFyWkovT0NnQ2Nud1RDUGNqdnR2MTk4dHpNMFlaUDJVK2dBcXA5eVI0?=
 =?utf-8?B?ckJQVlYvS2syQkNJbEN4dXF2T2RaSkUxWGFWQXhucS9NR1kyQW5lUVhsR3pV?=
 =?utf-8?B?czZUZk5FRWlIOXFEU2dmSENMSlQ1MTUvNzljQ3NhWWhidEdZdnNiZE1KTzd4?=
 =?utf-8?B?b25idGxZM0Ntb2lweXNWZWxldDVNVCt2NC92SFgzK2tGYmU1YTltOStWYW13?=
 =?utf-8?B?YWQwRm5kbHdRdHEwTEQ5T3FQSWJ4MTBpdTVZTDIxZGs1ZmhkQjl6MTNpMVU3?=
 =?utf-8?B?N2tCYWtoVEwyYnhZUkx3emNSVjBSMXdOaGxNc2tGK3RxOFZ3TDJmQk9weEpK?=
 =?utf-8?B?WHlHaUtVanZwblNqREI5ZVlpa2dlalVFMWhRclBpTVdUTmN0cDdUTHhjbldG?=
 =?utf-8?B?OXFaWjR6U3VHTzEyWDZuUHc1WTJqMHNpV0hsTzRXMUtSVm1KQTFzb215Z1Nn?=
 =?utf-8?B?Nzhmb3pRVDU1ZkJEdmFZZTBydWZXbGlFNS91OFFqWUFVRkJXekxEM3NqL1Fu?=
 =?utf-8?B?KzBLcWgySktOdEFtY2llN3BDWTIrNUViV1VMTUk5aVNwWUE3OFdsYVNjTTdD?=
 =?utf-8?B?RUlPK0pRMkFMdFZaQ0ZuRCtFb2EzdU9kT0YzTmVYczhxVHJLbEw5cWxGak54?=
 =?utf-8?B?K1NEcnZ0cW1oTXJobVJVdzI0aHdUSFhIVEhRcTZrMENXUWRKQkRFbVl6RXla?=
 =?utf-8?B?MzF4dW51V1JmZVQvZVQxZGtPMmxnSjh3TG9Wb0Y0dHBseVBVVjAzbXh0WjY0?=
 =?utf-8?B?UHBubldLUkUxZEpaTDlDTHVHVGdBaFhPVnV3VjVacUZLTkxzRTMveS9oYnpP?=
 =?utf-8?B?SXoxMTBGbE9Vak51QzllSFFxLzdwNWN6Y0pGNHBGOUFqWXcvTzR5VEhJdlBN?=
 =?utf-8?B?SS81OTk4d1BBZmQxK2k4MkRHWUEvZFNZTk83UDMwaHkxblFIbGExOHgza3Vu?=
 =?utf-8?B?MmE2MGg3ZExDU0N1NUN3T0dOSUQ0TWIrd3o5a1lCOFlnZ3VtRDZGbmNjOVI4?=
 =?utf-8?B?SFpQMjZlZlVpcXBtaHNhSmhyd2Zzb0FLMzhpdFFJZ3V2TEFPQnZvUnlscTZV?=
 =?utf-8?B?L1V0T3FRZytlTlV2Y2FudEduKy82bjJBRU4vbkdXVlNCY3YwRTdGYmhESzJj?=
 =?utf-8?B?Z01BdnFCeFphS0xMWFNpWk0xb2pxSS8zQ2pYekxiN1I4Y0RScjFzWGVTNDBl?=
 =?utf-8?Q?wnaKZStPjKa4eaOa3ERODGQShVD9uQo5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnNOMzFaYVdjSk1rdmpQT1dqbUxCV3lXWGFubVRUcWF0TnFOWkFGTVIyM2tE?=
 =?utf-8?B?ajc3Y2NIaDlzOWw4bFdyVkxsTzM2a2xWZ1ltT0x2ci8reTV3L2NoUkFmZ1py?=
 =?utf-8?B?bHV0czRuMUNIdFZDRExuMWtabExkZHg4QzYyVUtZZnkxdlY4UXhjRHcyNWVU?=
 =?utf-8?B?SmJlcUxlKzl5QXhYUUpMWDBhd25UVytNdC9iY2lIWDU1MXZ5dHk5Q3dOM0ty?=
 =?utf-8?B?ZUF5OGRSUnNuVSsvK21nNVlTeEhDTnprRDh4bUl3ZnFvQkI3Wkh1dCtENU5M?=
 =?utf-8?B?UFNzeGZoTEt0dEs5QlN2cUpkWi8rY0k5TndsNzBKc294OTZVUjlNRFgrc2NH?=
 =?utf-8?B?KzEyY0hocnhDdlpSWU80WlY2MmZxR1BaTlZnVHRTV1VIemFhZ3JxaEpnZjkx?=
 =?utf-8?B?VjcrQWJveEtDbEZtUGw5bWVoRzhnN09jTU1QUHRQNjV0MjJKOXpLK0JZeGRC?=
 =?utf-8?B?L1pIbnJ6R05QazgzeXorVjVYQmF2VzR2em96UlpscGZuSldsaGRwcEpzOWRm?=
 =?utf-8?B?dnA1QytNaW9Ea0x6TEZpRGRRa0M2djBkemNnTlYyQjNrYmtXdFhlT1d2Z1Qy?=
 =?utf-8?B?VEVKQlJlcGsxSk5kMEQxaUpUMzZVMXJ3WDF6Nm5vek1aL0lXdUtORlVCTFdN?=
 =?utf-8?B?VHVIRzM2R3F5RkhLdGdCTEp5eWFOelozTk5LV3NLcUlIMWV0TUhQTENqRitM?=
 =?utf-8?B?Vk01S0R4VmtONUtyYlpsdnFpSW5TQndtQ0FBeDNXRFFVMk82UXNhRVR0TGhS?=
 =?utf-8?B?V0txSUtmdXVmTnhNY01ma2dYTHVWRlQ4a3NJenFRaENVQjFGN0tpTUY4Zk1l?=
 =?utf-8?B?b0d3YjlZRWk5M3VLVVR2Y1JpUy9McmhpUEY3akJqdk9GaWZ5L3RsNEZjdEtn?=
 =?utf-8?B?RmVZOEhaV1hGd3hEeHBYR3FUY1NQbWYwQ09KNHRwYitSemNVMVQrZlhublVE?=
 =?utf-8?B?QloyQjEzcDI0dmpzdHhtMUlUVGxjTjNkZEluRGdGWlZueTBEeVNXQjJvVllo?=
 =?utf-8?B?bDE5emRJRE9RZ3FHNlJFM1l5N0hTWTN4ZnN1TkVFMm1naFdidEpCUDh4c3Ir?=
 =?utf-8?B?dWQybEFIcGh1RzZtL2FBQ3kzTnp0S3k1TisxY0ZUMjVsRXIwVUs0S0ViNGo3?=
 =?utf-8?B?c3d1YlZFZnhKb25MOW15TFFmd3BnNmFnVFU1VTJWNDBhOTlZZjZqVmZtUlhE?=
 =?utf-8?B?dmdyN0JsRmZINVpXYXZGeDBGeXUrQzl2cUhxTFJnMmozaVJVRWZwVkQzMmxD?=
 =?utf-8?B?ZXRVVW9TcDd4Yy9GTThvd0ZxYVZXZVpxdFhQVHNMc1QzR3lzbVBEV3JPQTNm?=
 =?utf-8?B?WmdSTlM2RzYyUC9CQnNUTjFUMjNQVWg0bndjVXNHRldyV0xGS0JnRVpIZFdz?=
 =?utf-8?B?U1N5V0ttc2RXTFE3ZUJiTXFubXE0cWVMWG5aQkd1NC92Tm5yTVltVXdTNE5O?=
 =?utf-8?B?b0JjdzNFQ0tBdDQwWGRiRy9iNUJyelZqUGgxbU5WQXJLYnEvbW03SEt1TGVV?=
 =?utf-8?B?RnZJVEtWKzJCaytGdGV5by9VS2tsWFNqOWgxZVVaYlIxdWpjNC9iMVJ5ZDJE?=
 =?utf-8?B?WnNZaExnRWgzM0crTDFBV0tTQ3RzcEloL2ZGVWdaRG5tWHFJS2dXeWRKekR0?=
 =?utf-8?B?Q3VQMksyL3NueHZGRXZhcUdFMUY4eWFyeXV4TmhUOUlLcjQ5ODBycEphb2tD?=
 =?utf-8?B?bTFUd0JiNDlyY1RmVmgzV09XS3prdUx6MWI3L3QvR20xSnl1U3FOWHkzcFcv?=
 =?utf-8?B?QjBTeElYU1FFRDJHb0lRNkhHNjZWaGVuWEc0R0c0M0w4WmxrVHE2enZybHIr?=
 =?utf-8?B?Ym42blJ5d1BiR2IzWm4xeWllYVVYMGsvdHQwWUtjdk9hYmtTRGFRa2RsZEh4?=
 =?utf-8?B?dUY4VUhXZ1ZFMmFQWUxnMUZFd0FnRzdOd1l0ZnVaMkx1cjNmQ2JwWGE0MGY2?=
 =?utf-8?B?K0RhMDJxWHhNSVMwZEpGSGl2RUJWRldubnRwZHM2a0c5Qk0rd0NIeFpUZmtn?=
 =?utf-8?B?bTU5L0tlVlEvZ09RcW9HdTI5UnNMVTcwRktLUjk0VzVjSmhxZWttWE5na3VZ?=
 =?utf-8?B?RDR6NmxkODVFQmp3SC8rVFJxUXVweWVXRWdnNGhpWjEyajJIQVdDN1RIVjRt?=
 =?utf-8?Q?igwg2Hl8+4d16ABAuAIyn/pBW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1352b08f-4efe-4d92-1ac9-08de162a2776
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 13:59:04.1795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kg3DVKegoVcey6UDSeiZfFPHXf4HjzALbx27nvjvuR6ZPfuZd2lTh3U5xVeEitEe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9511
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

On 10/14/25 09:08, Vivek Kasireddy wrote:
> For the map operation, the dma-buf core will create an xarray but
> the exporter is expected to populate it with the interconnect
> specific addresses. And, similarly for unmap, the exporter is
> expected to cleanup the individual entries of the xarray.
> 
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/dma-buf/dma-buf.c            | 68 ++++++++++++++++++++++++++++
>  include/linux/dma-buf-interconnect.h | 29 ++++++++++++
>  include/linux/dma-buf.h              | 11 +++++
>  3 files changed, 108 insertions(+)
>  create mode 100644 include/linux/dma-buf-interconnect.h
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 2bcf9ceca997..162642bd53e8 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1612,6 +1612,74 @@ void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
>  }
>  EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, "DMA_BUF");
>  
> +struct dma_buf_ranges *
> +dma_buf_map_interconnect(struct dma_buf_attachment *attach)
> +{
> +	const struct dma_buf_interconnect_ops *ic_ops;
> +	struct dma_buf *dmabuf = attach->dmabuf;
> +	struct dma_buf_ranges *ranges;
> +	int ret;
> +
> +	might_sleep();
> +
> +	if (WARN_ON(!attach || !attach->dmabuf))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (!dma_buf_attachment_is_dynamic(attach))
> +		return ERR_PTR(-EINVAL);
> +
> +	if (!attach->allow_ic)
> +		return ERR_PTR(-EOPNOTSUPP);
> +
> +	dma_resv_assert_held(attach->dmabuf->resv);
> +
> +	ic_ops = dmabuf->ops->interconnect_ops;
> +	if (!ic_ops || !ic_ops->map_interconnect)
> +		return ERR_PTR(-EINVAL);
> +
> +	ranges = kzalloc(sizeof(*ranges), GFP_KERNEL);
> +	if (!ranges)
> +		return ERR_PTR(-ENOMEM);
> +
> +	xa_init(&ranges->ranges);
> +	ret = ic_ops->map_interconnect(attach, ranges);
> +	if (ret)
> +		goto err_free_ranges;
> +
> +	return ranges;
> +
> +err_free_ranges:
> +	xa_destroy(&ranges->ranges);
> +	kfree(ranges);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_NS_GPL(dma_buf_map_interconnect, "DMA_BUF");
> +
> +void dma_buf_unmap_interconnect(struct dma_buf_attachment *attach,
> +				struct dma_buf_ranges *ranges)
> +{
> +	const struct dma_buf_interconnect_ops *ic_ops;
> +	struct dma_buf *dmabuf = attach->dmabuf;
> +
> +	if (WARN_ON(!attach || !attach->dmabuf || !ranges))
> +		return;
> +
> +	if (!attach->allow_ic)
> +		return;
> +
> +	ic_ops = dmabuf->ops->interconnect_ops;
> +	if (!ic_ops || !ic_ops->unmap_interconnect)
> +		return;
> +
> +	dma_resv_assert_held(attach->dmabuf->resv);
> +
> +	ic_ops->unmap_interconnect(attach, ranges);
> +
> +	xa_destroy(&ranges->ranges);
> +	kfree(ranges);
> +}
> +EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_interconnect, "DMA_BUF");
> +
>  #ifdef CONFIG_DEBUG_FS
>  static int dma_buf_debug_show(struct seq_file *s, void *unused)
>  {
> diff --git a/include/linux/dma-buf-interconnect.h b/include/linux/dma-buf-interconnect.h
> new file mode 100644
> index 000000000000..17504dea9691
> --- /dev/null
> +++ b/include/linux/dma-buf-interconnect.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef __DMA_BUF_INTERCONNECT_H__
> +#define __DMA_BUF_INTERCONNECT_H__
> +
> +#include <linux/xarray.h>
> +
> +struct dma_buf_attachment;
> +
> +struct dma_buf_ranges {
> +	struct xarray ranges;
> +	unsigned int nranges;
> +};

Hui? How is that supposed to work? Should the exporter fill in the xarray with values?

That clearly needs more description.

And IIRC xarray can only contain pointers because the lower bits are used for internal handling.

Some kind of iterator like interface would be preferred where you have first and next callbacks.

> +
> +enum dma_buf_interconnect_type {
> +	DMA_BUF_INTERCONNECT_NONE = 0,

Let's start with a DMA_BUF_DMA_ADDR type.

> +};
> +
> +struct dma_buf_interconnect {
> +	enum dma_buf_interconnect_type type;
> +};
> +
> +struct dma_buf_interconnect_ops {
> +	int (*map_interconnect)(struct dma_buf_attachment *attach,
> +				struct dma_buf_ranges *ranges);
> +	void (*unmap_interconnect)(struct dma_buf_attachment *attach,
> +				   struct dma_buf_ranges *ranges);
> +};

Please put those directly into the dma_buf_ops structure, I don't really see a value in separating them.

Additional to that I'm not sure if the "interconnect" is a good naming, essentially we want to use the new mapping functions to replace the sg_table as well.

Regards,
Christian.

> +#endif
> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index d58e329ac0e7..db91c67c00d6 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -23,6 +23,8 @@
>  #include <linux/dma-fence.h>
>  #include <linux/wait.h>
>  
> +#include <linux/dma-buf-interconnect.h>
> +
>  struct device;
>  struct dma_buf;
>  struct dma_buf_attachment;
> @@ -276,6 +278,8 @@ struct dma_buf_ops {
>  
>  	int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
>  	void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
> +
> +	const struct dma_buf_interconnect_ops *interconnect_ops;
>  };
>  
>  /**
> @@ -502,7 +506,9 @@ struct dma_buf_attachment {
>  	struct device *dev;
>  	struct list_head node;
>  	bool peer2peer;
> +	bool allow_ic;
>  	const struct dma_buf_attach_ops *importer_ops;
> +	struct dma_buf_interconnect interconnect;
>  	void *importer_priv;
>  	void *priv;
>  };
> @@ -589,6 +595,11 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *,
>  					enum dma_data_direction);
>  void dma_buf_unmap_attachment(struct dma_buf_attachment *, struct sg_table *,
>  				enum dma_data_direction);
> +
> +struct dma_buf_ranges *dma_buf_map_interconnect(struct dma_buf_attachment *);
> +void dma_buf_unmap_interconnect(struct dma_buf_attachment *,
> +				struct dma_buf_ranges *);
> +
>  void dma_buf_move_notify(struct dma_buf *dma_buf);
>  int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
>  			     enum dma_data_direction dir);

