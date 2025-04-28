Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA60A9F348
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 16:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92B610E53F;
	Mon, 28 Apr 2025 14:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ShaumjYQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062.outbound.protection.outlook.com [40.107.96.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403A010E517;
 Mon, 28 Apr 2025 14:17:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8MViC8LK2pw1GXIiYn4g9nN/Zz7102rATGotKEGGrfS7cjU7kdLRZ+APu70LW4szz8P6zUNpeOdeodFbPQYLhzrGLPqKaCcCPbxIxDxrRP3T+C1OL8aKo0GEjtObLM0oiS/CcIPZQHkJmHBOj7s6cWEeoiWPo7Y5XmYFo46gO52QaBBFWWILDBMzA2VKDGyjijTh6MRSjWT0mCy9PePExbi4RQrZY24JZnChQ8PmPwVjt4EWR4WimiJ/Elj8cfoOR9Z8arcg2Ol/Z8SH8mVPIHRAvyD8ALdk+IsnXE8f4A1SyKhEXlmZRuQx+tMHDfoYFs4Y0PYuFAMPvdnUP1IBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJLKOlPKXoRjlvBEHLpf3SsmcFAAHCsmVwt3Jn3Zfdc=;
 b=GVGxY1Y376jC0PMGXja+uOzdyD+E44KsvtNN5OHQegjw4eX+22FDzQhqkND/h34AO6FB5TB+tIBMoPiD3Eyo0uH0RlBIUIyxuN0DY6IgQvLIJhGn0dbK947WxhQYaiwMkkXIvAZbRLlD4TfGasRifMvd6UWe2AIfYSwov7ue+RZO9DXsoxfD6gi4UR2iSfXY+DG8zFLV9awkNLKeEB7iqV0Id7gzm5RhqPi6VQsy+fEYE6rjT4ps0TA0M6V3qKxCpaUn9wftm3aN2FfL8IDrPdCJ4k1E0HE3ZTx+bHrPOKeQeRG0fkgFmYg0dxkusyM9Gw8LEysVIqLHk/nmvAVgBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJLKOlPKXoRjlvBEHLpf3SsmcFAAHCsmVwt3Jn3Zfdc=;
 b=ShaumjYQMwIwcbDgQCtfg+4YnflJf56oJuiRehPw5Qp85erv1RaZHvTADIbl1y0QzCps2+UhPtL7f7v+6e+oBYjujqihtkpFkJArEzt3P1Je7wJKlSs7zOC4WTiAGrlbG/N97D1ChnVl/qKanViYP9NByx7nzDculka6N2BFpts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA1PR12MB8262.namprd12.prod.outlook.com (2603:10b6:208:3f6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 14:17:29 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%5]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 14:17:29 +0000
Message-ID: <0b1e1a00-2cb9-4793-a439-06fcec3e71ec@amd.com>
Date: Mon, 28 Apr 2025 10:17:26 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdkfd: enable kfd on RISCV systems
To: liu.song13@zte.com.cn
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 liu.xuemei1@zte.com.cn, jiang.xuexin@zte.com.cn, xue.zhihong@zte.com.cn
References: <202504270413.53R4DUco001600@mse-db.zte.com.cn>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <202504270413.53R4DUco001600@mse-db.zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0219.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::16) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA1PR12MB8262:EE_
X-MS-Office365-Filtering-Correlation-Id: ab5f9228-5cc7-41a2-cf46-08dd865f689a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnN2ZkNnWlRIY0FRSVl3ZDQrQ3puZ21OdlJnbHpTRkcvK2JUWk53SHhGQTlT?=
 =?utf-8?B?SVB0WFRkMUd6OHBJWFphMHNUQTBrNXYxVXdxc1B2OUNmaUoxMWdSaWQ0NHl5?=
 =?utf-8?B?cndLWm9zSHdMSHpxb2Uzc1VHVXZIZTFmNVZSa2RtTUVJWHg2YklYcTJiaVhU?=
 =?utf-8?B?V091MEpOT2twc2o2Q3lMbThRU1l6UkpiUmppRDVKL1Fyc2l5K1VxNm1VNXpu?=
 =?utf-8?B?UGRTelpHQ1Z1eTBzV3NxRjFRNG9GbWNJeWJjTHhlNTJ4clBTakRoSk9QQTAy?=
 =?utf-8?B?SEhIc3cwWkhDbVc2OUF1VVVqOHQ0NzJDVy91ZlRRRWZPQk1zT3Z2aVBIdytO?=
 =?utf-8?B?YW9ud0NxbUdpa29jbE1LS2lSbjJjdjloVGpXYkEyRlg3Nk50K1VpQ3VwZnBm?=
 =?utf-8?B?ZTFkREcrR0hrbnpneWdvR0tsTVBxZGdLN2ErYWVjVjQ2MnRYYnpOQ084VURZ?=
 =?utf-8?B?QnVDWnZEdkVpS1QrZmJDMXBjSkI4cHloc244TDZDUHNrZWRwWU5hdGtXRFNs?=
 =?utf-8?B?cWExQTd4Mkp5c0Z3eDUyalc0SnJVR3EvNTdXMGVXZjlKNmVFcXZLcUtROTls?=
 =?utf-8?B?cUdaaE14QTlvQ0dxWTExejBGTVNXQmZyNWVTREdzaEpHZ1BZWXV3M1pzMTEv?=
 =?utf-8?B?YkRwcmtqSi9oUFpXek1ZODlYZktzeTRsbzBnOE9rYzFPOG9LcXFub29uSHJR?=
 =?utf-8?B?aFJGK1lxSXJUZzFEdDdMeHlrd2pBT0tvZ0szb2pQUHgyZUVjMmJWTEVOTm1l?=
 =?utf-8?B?cGtkMzhDNW5xcisvNVJxRXZkSkQrZGZXU3RPZlBjWkYwcDIzbVFadnR1Tkd0?=
 =?utf-8?B?M2xQYjA1MmNhKy9ETTBRSlRlY2lJS1ZaenZwZlpxa3g0Vm1IUTZMZXd2UWNT?=
 =?utf-8?B?WXZpYlljcmIyWm0vYi9wQXIyL2MxWFlJNTBwSVRQN012M3E4MVNkeE50QmEr?=
 =?utf-8?B?clpTd0ExMG5oUlpjQW1wYXdtMFhxeTBPNFFTSHlKTnJGckJ6NEw5a2tacm5H?=
 =?utf-8?B?OGNDM0JGanlBdS8wOC9JWi9EakVRUW5ydEdGNW1JWTFrc2o1RXZDZWVQN1g3?=
 =?utf-8?B?dW05bUpML0hVbkdUZS9yYk5qK3MwejFGRlA5aCtRRVRXamMvSWU5OVN3aTFL?=
 =?utf-8?B?eHBtRDgxdGdSQ3FiWlFabnRWbXl2RkJNVkViSm9uaTREalIremxSbS9wbFlB?=
 =?utf-8?B?YzVMUmtwTGw5eEYyNXViYkhFeUxzeG1iRDVnNTVyOFNuY0VUZXRaUVhaRHk3?=
 =?utf-8?B?S0QwajZxbkNvbUZkNi9VOWZUbnVIQ29ZZnkxK29UbmV1dC9ZY0NkakZ1Vmky?=
 =?utf-8?B?K1VmS3A2Q3ZkL1lyT0dhS1BqRGJkaWNxVnRiTjhydHhUeVBPbDVWYThOMHJC?=
 =?utf-8?B?VG5EWHpYN2xnaDBFb3QxQTJVZUQySkFKajJBWkcyNHNRVFNxaVZob1EvellN?=
 =?utf-8?B?NUhZY1BtdzhvL3NVT2FIL1IyTC84ME1XOVk1RFRLZFBLczh1L2w0bEErNC9a?=
 =?utf-8?B?NHNPMDQ1S3dITmc1cU8wT1hkbHNIS2ZNWDJQeStvNEJQekRwUnVCSFRCcmE1?=
 =?utf-8?B?Z0prdnllazc5ejkvK1hCWTlUYm5JWkdCckZNeVR3UndORW44QnRxQ0pIZ1hS?=
 =?utf-8?B?dnVFRHovMkNjcFRkbWhGUTZkMjF0aEVFMk5UOC9qMG9IWS9Db2xQUEdITVZQ?=
 =?utf-8?B?M1orMUtWdUNaQ0RIck1la0NJNUpsN1JTcEJFdGFIV0FsL2xKMVVVN2RIcUs4?=
 =?utf-8?B?M3JiTFIwUUtOaXpvY3FhYWtaV1R6TGlocFF4UnA2aEFvNGNLYUx6czBLRDlm?=
 =?utf-8?B?cXhTR3dueXhGejdDOWJwellxVjhtc2dLdmdOd2tHL3h3Y1d0SUo5UDh0L2oz?=
 =?utf-8?B?bEdvcEZYSkZQZ0FLczN4c2FIb1VyQXE3TVVBQ3ViS21YZHRmbVp1WGRCdE00?=
 =?utf-8?Q?8iZdGiYn8Tg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVVqSEdqbk9LSHI4NlgzWk5CLzQrYWJuK21NblJXd2srVkZQMWpKMG5tRjBJ?=
 =?utf-8?B?MXZhNlZxdGRwdThXdnpRU2lHa3EvUUpnV1ZtZjIySUwvUUdzS0E4MzhHKzlu?=
 =?utf-8?B?bHB6Y1BjVDkvdUd3YlhRbXduZVlBd0o3enpheHNEMmwzc2MxQytoa1RxQjlx?=
 =?utf-8?B?eHY0NDdtaVRvcG0yUEZzNG1LR0wweS9BUVdhZUFlcCs5LzRMUW16U0tWcVpK?=
 =?utf-8?B?WmNpeGppVUorcWlCS2ErNm9MZzhiNDFRcU4vaVM4VktZRWxzWjViUUlBd0dG?=
 =?utf-8?B?QW5FY0Z4NUNsZGt2NTVNMzFCaGhXZVVNMHZXQmFLV2c3bG0vZm1sVnJua1B2?=
 =?utf-8?B?WDUva2hISTA1blNZWENmZG1uQlJpZVQrdVVhbnRDSkZJcHd0VXhwekh6eENZ?=
 =?utf-8?B?UDRKYzJ5U1htRllMU0Q3YXhxRS9kQkNCTmQ0VHk2aTZTTyszeVB5dTFxS2dG?=
 =?utf-8?B?Q1E1VGVybTd0SDhpYW9vOWJRSExObldQa2xZMk8wbENMZkxZbnR3MlNMV3E5?=
 =?utf-8?B?ckZzSUY5bHdyMjZOaHBXeGsxdmF3ZVg2MDg4L0N5dWJ4Q1pCOWJoU3RNRFoz?=
 =?utf-8?B?K3FyN1ZzOFJTRTAwUlVEYzNTNVpVWU5PL3ROdFhLTVZhMjkvUHV5NWxVNHVl?=
 =?utf-8?B?TlU3TWUvaVdmY0ZXSmZhMnFPaVhjd00ybjNjTk9MSnJzVnZ0eE1Vd3FpOERG?=
 =?utf-8?B?TWZFTnpNTFVLOVhSV1ZOL3VMR1Bub2xSZ0Z6N2VGSzBxUVA3YnZBeWpLSS81?=
 =?utf-8?B?cWZwUXVTQjVjZ3FBekdpMTV4SHF2aFpxWWN4OXlKbTRFUkdIMlNFS3psSkVO?=
 =?utf-8?B?c0I4MElEYTkvdXBYaWkwaWZhVmdXMFgvbERhTFY2NWtHZnAyRHp0ekljNTJ4?=
 =?utf-8?B?QjJQUFc1cHNRdCtYaGwxM1pWTzJreDZQSERvRDl6RjVWV3Q0anlOOXVFM2RD?=
 =?utf-8?B?YXdMWUQvSXJLMUF2eDR2S2Y2WExudFl1dXA0YlB2emFyTWdKSHRoTVVFRVZq?=
 =?utf-8?B?ZkJIOXAvS0tJK2l5QUUxTVJja1NpbU5jczc4cW5SRlJkcEFsbktnR3lySHdY?=
 =?utf-8?B?NmxXdXBKVEpodWRITVFHVnpua2NLWGkwRERKbXVGQlplbHZmWVc4Ni9pSlhW?=
 =?utf-8?B?TmpXYThhTVkyc3VPSWl3NE91UkI4Y3M4TmJNeC9pa3krWlE0MUxNaUdDTXJs?=
 =?utf-8?B?cTZYRXJUMjcvRmQyM3BDM0NOQWhucVNQeGhwclJsUzE5aXozYkpIRUxTR0pi?=
 =?utf-8?B?ejdUTE1oVHRGZmNBTjNrUjA5Nm1YRTFnZ3N4QS9PeGZoMmRJanFUdjF4WEsr?=
 =?utf-8?B?TXFRZmtjOXJCRjBKN2Y0bGFzTkFGRGxDZk9VSW1pK0dHeTg0K2taS0xvMTV0?=
 =?utf-8?B?U3hNNi9Fc3hHRTl0cXdFNEhLYnV3ZGFnY2oxM2lteG5sdVQ0S2p2TXRQdWZK?=
 =?utf-8?B?ek1US3lMTFNmSE1KTit4anFwemxlR1p1VHh3L2RZSFJhK0Ivenk1QVBIdXB1?=
 =?utf-8?B?WmV0YWkrM2VINkM1MGloQ3M1TUlYQmZNTER5QVBpbXF4eWZ3SThsZWZMdmJr?=
 =?utf-8?B?dmlFOG5GbHdSMHdYRlo3eGkvQ29XYnJ5d09FOFdhRjdsUjFCY0c3V2lzQlFi?=
 =?utf-8?B?OENZclZGWXpzRlVzd2VFTTd1dUZSVEtJYVZuazVTc2ZjNVhST2N4UkxnNHI1?=
 =?utf-8?B?RE9Mb3J2Zks3eHQzMVhNMjczM3o4MWRaR0g0eVQ4TU9uM2RPdlFGUEpyUUpk?=
 =?utf-8?B?VFlVNFh6MlVZUEN1MEE1MGg4VFJVMUJ1ajdoelczM1ZtYmxuWHEzSmpZU2E2?=
 =?utf-8?B?WnpkNDRPY21ZeG5qZ3RmMTJqQ0pvZDlCQlZReFIwVS83UGlyQlZONzcvRS9G?=
 =?utf-8?B?aSswbmdYd2xKcWpzUmV0TW9aWS9FaXlDMGQzNGdZNXNyaHB0RkRvMXFJQ25y?=
 =?utf-8?B?M2JXSTZFOHM0N0pQWC85TG13cnFMZVBnaWl1a01PKzBQYjZKMXZGaUZ6OTJY?=
 =?utf-8?B?K21MSk41UHNtRVgyZWFva2hpWTMyZDU0ZUZVWGlxZ3FrdEd3enBLNDFFNURu?=
 =?utf-8?B?ay9NQ1VnOEpGYzlBbVZqL01XYUJqOHhNS0NmUE9xVys3VjVDQXZuRjRzN3NH?=
 =?utf-8?Q?7PnwlU9K1HlpR1iOFB3o19ZK8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab5f9228-5cc7-41a2-cf46-08dd865f689a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 14:17:29.3422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mABzLOUFv71x0mzxqs/Aj+jWDwZV42B3T7OMmYliaq05T42EgNwiFJXqZrPezKTgrGxUyaJ1OXKdxEcDs0edzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8262
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

On 2025-04-26 21:25, liu.song13@zte.com.cn wrote:
> From: Xuemei Liu <liu.xuemei1@zte.com.cn>
>
> KFD has been confirmed that can run on RISCV systems. It's necessary to
> support CONFIG_HSA_AMD on RISCV.

Is there a public user mode branch with any changes needed to make ROCm 
user mode work with RISCV?

One more question inline.


> Signed-off-by: Xuemei Liu <liu.xuemei1@zte.com.cn>
> ---
>   drivers/gpu/drm/amd/amdkfd/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
> index d3c3d3ab7225..9d4a5f8ef43f 100644
> --- a/drivers/gpu/drm/amd/amdkfd/Kconfig
> +++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
> @@ -5,7 +5,7 @@
>
>   config HSA_AMD
>    bool "HSA kernel driver for AMD GPU devices"
> - depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64)
> + depends on DRM_AMDGPU && (X86_64 || ARM64 || PPC64 || RISCV)

The KFD memory model only works on 64-bit architectures. Is there a way 
to express that in the RISCV dependency?

Regards,
   Felix


>    select HMM_MIRROR
>    select MMU_NOTIFIER
>    select DRM_AMDGPU_USERPTR
