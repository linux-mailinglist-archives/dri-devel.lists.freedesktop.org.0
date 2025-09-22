Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F05F3B911AC
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 14:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A78610E458;
	Mon, 22 Sep 2025 12:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="17HWzpV9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012008.outbound.protection.outlook.com [52.101.53.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A8AA10E1B3;
 Mon, 22 Sep 2025 12:25:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDtHFwgAGe5HF5yof3SldPekIYn3eD/UoBf+KZK4nKCkD3GqkXs9C1RvfD6ButHTdH4b0pD3uf05uwKUBbesujWpUPl48wye56OAX9JWZFk1LwZ27qU+71k9J6Dfp53IuBQ4eg7Ccs3C2cYrrIE1veeNpwG6ghx4KNQTF829vuVsg8IFpaRGzIrJRDL6erThiFbJDcPURAqFDyCA0Ev7xWCT4mw63yRT5JQBjUkSlNXJRapI88UTW9YPThckWTUBgR9Vux67lQRF4W6Mpc29OHMcqY/lmXeTR5RRN4LutrOaiufOfskOF4mqchToc0IuB4+juMzZUGhx42A4Jf5gmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFaEUDxFP9bajxIYMyfRP9pOOb+7t7gDEGbvHfXKKD0=;
 b=pcE2yqp4azjztYWHcBnB7CDtJXHFheHX0z6G8eJoFNsjsEPOrGoT2+g8oYQMqyg85C2Kt/zECm8o/ocPTuFdLs8qKmW2e7eQgbzYSCoRWr2PoE/Sqz8au+Ip4CYcvldr9qWJ4UmjZDKwYsgakJ3Z4vB9bw+VzcEAZfpCr7av3O4dh61SdQRF7kkWXRm4NcZb32uppxackui5wJB7L9qR8jB0vvYgm1KJtoLjPFnOqPgebthnMDHfWVNDMsm1vOvwKduKZTsFIELs/Kcc1Pa/If9aEAIernqbleYbgScytd1nHjB3aRt+QgnNxZ2ZSRoDEHRESzFgfNr7NvtM/njGOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFaEUDxFP9bajxIYMyfRP9pOOb+7t7gDEGbvHfXKKD0=;
 b=17HWzpV9osx98qS1fY3Hcg56eb0mR9zOQ5tuuu6Z33h9nIq3tOVLyxVfIqRrKhzk7hB/2WH6gbHr6nGfMMdOYwy9QBJ5eQXR+KrkHNmebEwgkrsCa7Kv/wCgYViFTYvDQYF6pdZ2ISHVR9SJtH0b2CH8y/YM/qtqmVApzfpDXJ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5949.namprd12.prod.outlook.com (2603:10b6:510:1d8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 12:25:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 12:25:20 +0000
Message-ID: <4e3919c3-3d1b-4f34-a1e4-5e9e7a5e6e14@amd.com>
Date: Mon, 22 Sep 2025 14:25:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
References: <20250915072428.1712837-1-vivek.kasireddy@intel.com>
 <20250915072428.1712837-2-vivek.kasireddy@intel.com>
 <20250916175709.GA1324871@nvidia.com>
 <IA0PR11MB7185186F6AB160AA7F8F0FF3F816A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250918120431.GL1391379@nvidia.com>
 <IA0PR11MB7185C96268ADB5530B343ABBF811A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250919122931.GR1391379@nvidia.com>
 <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
 <20250922122018.GU1391379@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250922122018.GU1391379@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::23) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f50787f-fd2d-4f93-dec8-08ddf9d31858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUdtRXJRSTRXNkZISC8rZDQ1dS81TVVING1lV3RpMjFXOUd6M1pzMkpyZXdy?=
 =?utf-8?B?ZWpNVEt5SkJtcHlRSTRMRVB3Q2lxTWhXQXFBZjJobW1OYU5JYUtGbDZRRXUx?=
 =?utf-8?B?dnZqOW1ZUi9UaTlVdlE3RjhkR05UbjkyLy9rSTFpQlRGbmplWEZ2YktEU2Yy?=
 =?utf-8?B?Nm5QT0k1ZDh6QUtLSWMrRHBsOENMVFptUkMwdTcrZnh6QmIwZnRzYzY5Y0l3?=
 =?utf-8?B?UldBSko1RHBLYXBMYUNTSUsyZnY4dzVDdXV6eGxXZUE3a3NMcmpYRUhBSmd3?=
 =?utf-8?B?SldaN2xZMXRpQzdvUHliaTVuaHlqUm83SXg5MmpsL3hMT0xXS2IrWVhEQWk4?=
 =?utf-8?B?UjJUdzN1MVRhaGw3c1R0eEphRUVzWmh1TlNKSEF5WnYxdjVvS3hWYXRIeHg1?=
 =?utf-8?B?V3c2TGdRaisySW05b0oxN0VQaVV5V3J0WFp3SHFxK3NQSTQ1K09MUmt5QTlo?=
 =?utf-8?B?ZW5zWFppUGl5QXBDUVdXcHNpd2FzL0VoOVQrU0lFN1hONU5YdU5Id1c4K2lV?=
 =?utf-8?B?KzF5UHhTcTBWckRqU1BjM053WjJBcEpaZFduQTR5UE5wU2w5TFlsOVIyVUgz?=
 =?utf-8?B?bmdMWUk5RWtOejFob2phTUZucHhGcVBJamRraHFVMWFVRi91MEFRZEx1OVNZ?=
 =?utf-8?B?NnI4UVM1WmoxSUdNKzhiQXFSbjF3MFRuNm9hcUZYcDNKc1JYUy9wenZVa3pu?=
 =?utf-8?B?R1lrRXUrZ3Z5VmpsNEFMNmxrUmFjUWdnaFNDZ1Eza3NzMmkrN3JNMm8yc0w0?=
 =?utf-8?B?WUdHeXd3Q2k0SldXaE8rUHd4UTlUdkd0cUNoVzNXRHp1ZFl1NGhLUFp6VG92?=
 =?utf-8?B?akEyd1lzTUpLd2cxTlZVQ050S0V1UkE1SGE4VGJLV2RVTk10ZVdkNTYrTWhi?=
 =?utf-8?B?WWl6b05UUXFXNzBuWmpYWEIrQWNteTNLRTN3QlV3MlNpelgvaUt2MXBmem4w?=
 =?utf-8?B?VGdZUWFYcnFrQUpuSWN1bkpDcGdQZms2MHFMUGdGYnBhNWRzTzF6eW9oeEZz?=
 =?utf-8?B?QXlZMEFMZDNzQStzeFVqTHU5cVFvVkFsWUM3enNiNGhqWnFneDJISEgwVU80?=
 =?utf-8?B?REtjYlAyMy8wOG53eWZ0T0d3MkdnU1lJM3RvdWtSV093NS82S2JkVGlUVkNz?=
 =?utf-8?B?YTAwTG0vZFNWODUySnQxQjBsNThFaTZVRlBwWVVBK3RIRFI4d0xUY1R1anRC?=
 =?utf-8?B?Y0ZPSlNqSCswVTNIU3QzZVFSQkJvRzREWEVIYW9tU0Juc2JmNStyR2pkN21U?=
 =?utf-8?B?OEpNYVFBMTRlVytVdVZ1MjBhbHc0VFpyeVpqK0Y1ZjR3R0U3UmU3NXBTOGxI?=
 =?utf-8?B?TXB3M0Zid3lGSVR4VlFvTXh3Tml2emRVc3UxS0l2SkJqZUE4RzdHaDFlMisz?=
 =?utf-8?B?dGhQbzYyQzB3Rjl2Z25nVzJJREdLZllnSyttVG5pTTZxUGFMN1BKT2V3dHpP?=
 =?utf-8?B?N0Z3WmV4eG1FcFBxK2pUeVQvVGRYaURzSVpYLzVSWkxpdE9kczNiOVVPK2VR?=
 =?utf-8?B?SSsvd3lVL3ZnVmtQUGVTNVVqNmlwdmtoNlhTTDZ6MlU2cklCWGl1YzFCSkwy?=
 =?utf-8?B?cEdkd3dUVmtyb21nTmdCRFNjM3pRNGQyWjdiVDludVNEN2lrSVBqenAxY0RC?=
 =?utf-8?B?ZlVQUmlVN2tqZy82QWxMY05WWTQyYjBURWpzZUNaNnBnSnJaUFBpSnB2Y0l2?=
 =?utf-8?B?d0orVGpleXI3aGZBWlZ4L21qaXh0NStZV1AySWNOQnFFK3VGdWZhQ3FueWt1?=
 =?utf-8?B?cHdYWkdoOUR2b1ZIaUlSYTg1ajJNWXlQOG5kdmtjL2Y5a0FWSDZmMHNUQjNK?=
 =?utf-8?B?V1pYUnBndGlSU3dtanl1WlVsRVp2WXJvckVDNXUyL1lIQm10ZERlV2JOK1Bo?=
 =?utf-8?B?OUFJMlhIL2xXT3JaUHZNQWFZRWdjQm5QdVFIREpBWEFLYWdPc095RTltS3p1?=
 =?utf-8?Q?vYX6JvlG+LU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVNlazlJTDBCZ1pxZmhnV1VMVklsWS95T3lhTEN5OVNmUXJuNjJMcnFVYW1l?=
 =?utf-8?B?dE5aY1NhSnhONzcxMlQ5NlVnN3kxMlVPNGFrVFNzQ2ZWQ3daVXhNejNLOERY?=
 =?utf-8?B?dVhzYTljUzBrb3VQL05wK0M0NFFwdkVlU0RjMjBaS0FWUDJwSTYyV1p0TXZs?=
 =?utf-8?B?Q0xyUVNMMnBqRDNRY1ZZV29xU0tMbjE0Qm16UjhRVXZJQXBtWWlsOWM0QmVs?=
 =?utf-8?B?cWFlcmpmcGF6M3IrSmpEUGxwcnZQSTV6c2ROczJwSVBXclpoSnY2UGlRblk0?=
 =?utf-8?B?cDczODc4b25XaVdJTGQxNTBhaVgvUjdRYWVBSmU1UytUdFNJaWdlVzB0S1hz?=
 =?utf-8?B?c3VJWUhUR2NIeWx6UFJ6dVdZZnA2ak4wSldWVTBpUStCcE5xMVBRN3liWW90?=
 =?utf-8?B?RENEVVArNDVBOEwrZmJ3N0N4ZDBTYTdyam1yRDJBK2pvOTBmUFM1cGNYMm9q?=
 =?utf-8?B?Vy8wcHZuaVJ0NUVOdnBtbVZVMjFEbUhmUU0xT3lST3Z1OUJ5V0JoVkhkQ3dT?=
 =?utf-8?B?Z2NLeElLcVgzTVorbXhkcFFpK1k2SHpOLzhValZGUFFscGZNNVVJYzluU0Z6?=
 =?utf-8?B?cmNielVNT2tRTkc0YzlnZWdXaGdrbUpBWlRaaTZyQzFWZzlwU3FBdUp4cVJn?=
 =?utf-8?B?YnVNQk9jT0VTTFBsNzN1RlRqYU16dXNsR0FKWXc1ZFJxVkRkVmh0NjZJZ3lP?=
 =?utf-8?B?ZEtEdEZmanhRS0tnbEFuZWlOWlAxOVU0elVzeFgzeXA3dFltVkNZdm9tY1VI?=
 =?utf-8?B?bUY0bTBHZXFMR2hEMlRRMUlBREpMY1VQZkFQakJoN0d6OFZCa3cvbERueTYy?=
 =?utf-8?B?YTI4L3d3bGhpQU50YlpFeTB6UStsVkRVZTN4SFlOYVhuSWFrdStXdHBiaHlW?=
 =?utf-8?B?cFYrM1IrMU44QUhLQmdQL3Bqc3h3TU9QK00zRXB3VnR3MEpxMUNwVmpvdEVo?=
 =?utf-8?B?U1FITmRJUmRJYmc4cGFicnBVR2hJeW4zUUZuNHN0WGNOL3EzcnBYemhHclBi?=
 =?utf-8?B?eEthNTY2OXFVamdsVDhEWCtCZDkvdmNGN3BmUkVpWGs5OWJWcGo3M0N3YzdT?=
 =?utf-8?B?ck5wUHNqbHJtZkllWmhzTzJaSkR3cmxKT2d5a3lyaU5LWDRXSzJPbElpWHZZ?=
 =?utf-8?B?VDFXd1FGckhFVkphaTQ1TWVHUys4WEhTdDZoZUhWT2JuV3VOdGc1OFhtN3ly?=
 =?utf-8?B?RUc4OUlJemh4RkluMzg0UGhpaGJtSEMvaDNaUUdYSnFlQm1zREhadGFNbTNH?=
 =?utf-8?B?dkJyTzBQa3puVzkyNEFUS21rUE1wMENCUU9yd1FnZE9OUFFEY3M0V1p3QjFC?=
 =?utf-8?B?SUpOd2tmaW0zZGkrTmYxaTcza1pGTE9zYlNSNlhWNU5qeG9sSHdIUTJjajh6?=
 =?utf-8?B?d2I0N0IrM0duM1NjaTJzTTlQb1lYSmNrdzFNcFpwc2JqWThyaXdPU3l2ZS8r?=
 =?utf-8?B?aDNLSnlMNzRpV2NUayt2NjlXZUJrakJTbC84Ync2MlcyYkVFKzR0MFpFZW0v?=
 =?utf-8?B?aDVOL0xXbzE0RXFRbWUxZWFGTGxESGx2a3pxTDlLN2lYUGd1YmFsdjVsbVN4?=
 =?utf-8?B?aC9YNStrZGJHa3FDU1A1RGYzbUM3SjNkQ0NVdzNBTmpoRDRDY1NLNXA4cVBS?=
 =?utf-8?B?Z3JlQmloWXlWSlVKWU5qSDdjWUQremlwdkhzYkJwT2s0cks1MEQvUUZkdDJB?=
 =?utf-8?B?bkIzSVd5elUya1ozNEliRi9JMnBOdVNPZTR2V05XNVVTZ05TZXY0RWNVd3JC?=
 =?utf-8?B?SHZUVmFWSEpBNWRjUVdQVS9WY0ZTY3hIaS9nNUs5eWNGNEhVaDhadExMRWE3?=
 =?utf-8?B?R2JpUnc0WHNTMEcxNEVBMkR2MTFjZFEzVmc2aXRZOEFTNjM3SGU3cVQvQi93?=
 =?utf-8?B?d3VEVXN1b0VySjNkYjRmQVh6NmR0R1JCNFV2NXBLc2xLY2dHRVJMZEhVeDZE?=
 =?utf-8?B?OXBNT2p1b1NPSVl4VTRJNDFENkxFRzl3ODNlaW5nemlGVmFIS1E3cjRDSTNq?=
 =?utf-8?B?MWNwOGxZSVVKRklRdnZpeVRuZnJZTEE2N1pneTNiYi9WUWxFSFVoNG1aSExv?=
 =?utf-8?B?NkNBTlpKbjl3UFpuOEYyQyt3ZElvbFNYU2hNWjlFdXpKeFdLM0E1SkpBTFRl?=
 =?utf-8?Q?izSevj38H9M6kM+4SLMPDJkzX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f50787f-fd2d-4f93-dec8-08ddf9d31858
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 12:25:20.0764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lAWxb36GPoOnMQNYPMLCzSfdTxPZu2QXyHh0P6oBysqa03Mhc9T7zZHPRCfFDxbx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5949
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

On 22.09.25 14:20, Jason Gunthorpe wrote:
> On Mon, Sep 22, 2025 at 01:22:49PM +0200, Christian König wrote:
> 
>> Well what exactly is happening here? You have a PF assigned to the
>> host and a VF passed through to a guest, correct?
>>
>> And now the PF (from the host side) wants to access a BAR of the VF?
> 
> Not quite.
> 
> It is a GPU so it has a pool of VRAM. The PF can access all VRAM and
> the VF can access some VRAM.
> 
> They want to get a DMABUF handle for a bit of the VF's reachable VRAM
> that the PF can import and use through it's own funciton.

Yeah, where's the problem? We do that all the time.

> The use of the VF's BAR in this series is an ugly hack. The PF never
> actually uses the VF BAR, it just hackily converts the dma_addr_t back
> to CPU physical and figures out where it is in the VRAM pool and then
> uses a PF centric address for it.

Oh my, please absolutely don't do that!

If you have a device internal connection then you need special handling between your PF and VF driver.

But I still don't have the full picture of who is using what here, e.g. who is providing the DMA-buf handle and who is using it?

Regards,
Christian.

> 
> All they want is either the actual VRAM address or the CPU physical.
> 
> Jason

