Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2768A6D955
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 12:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80E410E073;
	Mon, 24 Mar 2025 11:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Niw+u77h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9907610E073
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 11:50:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m4rA/iYZMhAjYi5LlhYQKRp+0awSe+u2HvuFRkroYdqT6Mvg8s6usrj0a6frujKiggzzkdSOVmKr2TDcW0N/40Q5UfNYpwIoZn2lvyGmcNjnHSh1HjM09eYRSSNkgo2chnKbfu83DvAKKp2I781FU6m3xnXFIUpylKTyezeWZiyF8JoEG9nq6qdW/vGp2/aCzFbKJHC1YzF1loFjmOtXn+y06zRmNNMIChfLcYqdaif4BSeuPURhqbDUyRXZ/ghxElRV4Uy8ndjHKXZMu+yrNKoNp8TuxEPaXvyI+znAm5E6sTlwy24Cl+WV812Nzo/pciQiavv9fqKox2lp3PiJ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utpfG4gArrz8kZbztvQTpdvDnoUNGQPvb9ulrh2oOHk=;
 b=Y5uo7vFMF2dfesUKeeNXwvHY3w15l2IfZQWp/m6SUHEyIezgMIdQ40PvNJlHM9nhUAz21bmYNKXCr7FmZmubdljpoulg3pCtpoe//iVr+RQj3XmQpoXScig+Emojo/b53lABWFoinTZsa9oxjA0Io+oIomkYhMz1OqAmmEPxIRzoK5BDpdKmPso96jIka7ttcxYOALfE8BRZG6VbcE5fEju+pwuxffQX/NFmfqrQBgh62+cHVedldNzQCR+XDv/YBpjgywlQ1MhYz5uHdi8WSMWMdch7PVBm8Pabi2aVJHFXCpyuHgQjoe4FQxCdDre3TM6vinSBjyWc/DBs8tJbaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utpfG4gArrz8kZbztvQTpdvDnoUNGQPvb9ulrh2oOHk=;
 b=Niw+u77ht4poNotg8B5IRKA9LvYLECDMa1nNwwI1eE92VxpttU3rY8je+n8skHu3z2yMprlT4t0qGLAD8fBBYJ78rSIXqEM3t536xLmBdYe/60LvlW1SxRk6sbk7YGS8LGM4QA4di4qJtu9M03nM4qAOrey/3jNCe2cVYaR3TTA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB6779.namprd12.prod.outlook.com (2603:10b6:303:20f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 11:50:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Mon, 24 Mar 2025
 11:50:41 +0000
Message-ID: <555feb70-5d80-4a36-818f-f00fbc3dff23@amd.com>
Date: Mon, 24 Mar 2025 12:50:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] udmabuf: fix a buf size overflow issue during udmabuf
 creation
To: "Xiaogang.Chen" <xiaogang.chen@amd.com>, kraxel@redhat.com,
 vivek.kasireddy@intel.com, sumit.semwal@linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250321164126.329638-1-xiaogang.chen@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250321164126.329638-1-xiaogang.chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de90b06-7733-4b1f-e48d-08dd6aca1a1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUIzL1pFYWZRVFgveVpxYVN3Z245WXlWWW9iT0RSYnRUa2ZJOXpZMVJyOHBD?=
 =?utf-8?B?Q1RNSDJaTzA0dUROZkRITEM3SlNMQkJrRjNXK2JFaUtCak9WWnZGZzFZZUwy?=
 =?utf-8?B?V2FTQWVXU21UTW9Tb2wzYU9YZXBuZDFnc3FZRFZrVnhSL0h0MDdJcDdkRjBD?=
 =?utf-8?B?YzQyL0JTRTNyV2hCeVpkTWp1c3VSRkx0UERYWUVibEx6ZldXa2F6dmsyTmh5?=
 =?utf-8?B?Mlg5U01qbkRwVDJFMlArL3hTZDF1eWpvelZUbzI1NmNFKzEySHJnZkl6TEps?=
 =?utf-8?B?WEUwNUxNRTcrVUlnYkhlelJyMVlob2x2ZlllR1ZNb2F1TVpsQVJhOTFQbDRS?=
 =?utf-8?B?VjA4WERIdExMRU43b1U0bTFhR2ZTaTBNMGFGZU1XTnU1MnZ3RWJKbCtSUE5i?=
 =?utf-8?B?MkFCdzAzbG1IWWMzYnd1MnYraXVza05oR3h4TWgrSExBVWhqMm1ZN1ZHblhE?=
 =?utf-8?B?WWtkR1JXM3ltVmd5bEdRaERGT3VhS0RYeklxYWJGNUJLTXBwS3gyYWNaLzZW?=
 =?utf-8?B?UWlhaHNlUEN1d1plUDVSaDFaM0xyajVKNDRnZjhNVlRNbXJLTkN5eU5pMlZK?=
 =?utf-8?B?OUR3cXk5dklDWW54d1M2UzNHdlJTTTRKRzY1V3NPdkFHcm5OUEJNVnhSTU5E?=
 =?utf-8?B?UHhNdC8yWmNucExpMFVKdVp6TU9lNnJOcmd2QW5RVm40V1g0bityNndGUC9m?=
 =?utf-8?B?eW1xdXJxNll2SjNlZWI1QjdpeVU1c3ZZV1NUMFgvUW9XNGZZTzVQRWFnVVV5?=
 =?utf-8?B?Y3FkQWVQSzV3Rk1SRE9RVi92TzNmZGRwUlFTajBNYlcrTHdvYW9qZjlYQlJP?=
 =?utf-8?B?RkQzTjR2bkFLMks5R3M0NmtmOUtZVXZpS1hOV0NEcG8wbUJ0a0lTb2xmb1Fy?=
 =?utf-8?B?YUxSTEJXWkFkK0ZocHFsK2xnTWtkakFybitFeEtrUWw5TnZFLzN1VzVqSW1i?=
 =?utf-8?B?anppbDJxNlZEcm1OVCtNaUFPNWc5VjkvMkNySkx1VDRuQ29Cam1EUkhsZE0r?=
 =?utf-8?B?Zm0wbnFSU0NsMVVTUlFtZUZDL2pBcHNLNVJKTGlyOUo5WkNlMi9xcGtUeHhy?=
 =?utf-8?B?WllFL0t0a2t4cllCTXZHMno3YU9nSC9EQkplOGxzVGRSK2owaklDT2Y3OHh5?=
 =?utf-8?B?L3phNzB3bUgwdXF2Ui9mSjdHOFlEL1JpdWFNekRlSzFDMkd4WXRKN2NRdXY1?=
 =?utf-8?B?cmZCT3hHZXZCeVRmSmdWOTMzZUorUytVWVJFVmhPeUlueEZzc0ZOZlh0NVVu?=
 =?utf-8?B?QUNXbytEV0xPSG9JQUt6MUNncmVwNWJFVTBFYm5EZWZ3b21wVnJ4ZXFWQTNK?=
 =?utf-8?B?MzA2aDhZVWp1QjlQZzBuZmlPVHdJeHd6MG1rTlA0bTV5S0wweStlQWdESlVy?=
 =?utf-8?B?STl6ak1KL1NqKzdDK2Z5MTc3Rzk2eUsybWsxZzhIdVVrTC9SOFZVK3F4TnMx?=
 =?utf-8?B?YmFsdGIvUmhoSGZWdGE4Skhrd2NBenRVOVdPTGsvbE54QTViTjFLZUYyRnhk?=
 =?utf-8?B?dU4wdEJPS1M4Kzh6Z2pacWkyc3d4Nm5pbG5TSURmWXVTQ3Z2Z1BaMTF1QkNE?=
 =?utf-8?B?STNGS1RLUGpKYi9TaFMvaGg5TlJFTWdWSWs3Z3FCTURCMjVhVWUxclN4UmI3?=
 =?utf-8?B?TEdkUnNNZGJjVlJMaTBjWFJ4Qm1Wck9SWTVSNFMxWG9lSCs5MDBNRzMzemxh?=
 =?utf-8?B?UGk5WEZ3T1B1VlhIcDhLeGMrQUllUHNqOWlxTzJyeW1EZzRjRVpQVTFXMWMr?=
 =?utf-8?B?YnNzQjJhd2MrQUpZRlhGQnBJcGlCQnJOOG42L1ZudjNORGNTcWk5WThLSjJD?=
 =?utf-8?B?OUFNdGh1bHlOK2p2aXBIUmwxKzZNT0JWbUNnK2lrZVNvZEdWVFpnM0haN3Fk?=
 =?utf-8?Q?glg9vQlmPW7y6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YklXV0JDdytCQlVqTi9mMGw3RUxydWZ4QXJXU1FnOHJmNWxYOG9BeXl5Nmht?=
 =?utf-8?B?Uk1Hb2U5SUtiRXl4NUFTNjkyN0gxQklUeWlJcTI1VWNLakxhdTdGOHdYVkMr?=
 =?utf-8?B?ZzAvejdKeFR1NGxjQWVMbHhZdm43MFptK0MvUDJhSk01YkU0dCtFM0hZS2lz?=
 =?utf-8?B?K3A5ZTk1TEhYWEtrakJXdUxlYUtlYUtVbXpWeDNNZlZjeU40N1N3Rm55ZWxW?=
 =?utf-8?B?dmhRNm9UeWNPeU00T1hwalVTcXZaTlIxblB1NEJUTVJqWnZ0czQ1RkpMTHZR?=
 =?utf-8?B?WjBNazlvZE5pb3JncUs1TGprZ0Z0V0Z3WnZYOWM1V1lxN1A4bDkrU2UwSXdG?=
 =?utf-8?B?WjRDckZ6Z29nYmtqdEFnSGJVVU9LTXJyWGNveFZkMDNqM1RKOTFaT1FOU3pN?=
 =?utf-8?B?Y0xnWnJWZUlGVEVxT1czOWYxL3BRUm1ZZ0RQSkFLeEVTVTFJQXpHTElsK0l0?=
 =?utf-8?B?Q2pySXFnQlhoT2l1QjBmN2dNZzgrYTdSZGZTY1krbTlrWjJHUmo1RGJudS8r?=
 =?utf-8?B?bGNZSVVWU0x5emc2Q0N2enhsc01UM3JhaS9zT2Q3UUVmWDVEVVVGRWpkejY0?=
 =?utf-8?B?T1QzMUh5dkpnOCtBVFBkanVVZE9jeTRwYkt1N3ZDbjlDMzJwd0s1bFJhUk1z?=
 =?utf-8?B?RFgrV1pqbjhjUWJKZllITnk0MWQ5MU5aSGFoQ2ZWb1pOV0tBYkZoMUJoWUlh?=
 =?utf-8?B?VjVZNDNzZE5OZjNqZ0tvYk5CbE9NNmpnTk9nWk1FYUVJejhEVVlsRjl2aFBK?=
 =?utf-8?B?Q0FKU2xZQkQ2UmVKWDA3Z29Ea1V5NVlqcDlpenFVOWFJVXZLdkw4QzNjeWE2?=
 =?utf-8?B?U2w4aXBLZDRIYXlOckxtUTg4RWZVMlM3dERiVElsSzB2dm9wQTNEcVA3eSt1?=
 =?utf-8?B?WGJZZjFLNUJiZ1R6Yjd3UkFaVHlLMWJDWm5sVCtOQUhKSUE0VVNpQ0lqNWs2?=
 =?utf-8?B?WWhiOGJ5bE1OMWhJZ2hXMlJyN2oyVHdZalUyWGlnMjM4a0N3ampMQWRtcnRr?=
 =?utf-8?B?ZTh1YXhUUXpCcnpBU0w2L2IzWVZDWnhMbTIyMlV6cFVPYTRib2tSQld2Q1Vq?=
 =?utf-8?B?aTY3OWkxa1M3OUU5WFgvUFYrdEFvclZGTEMwTVVzWGNxZ05kbUttWGNrS0x4?=
 =?utf-8?B?WVFpZ3VPMVV2dDZDeXgxM0dySDdhSnlGcE0xdGZSZGl5OE1TTjY2NkNoVGtU?=
 =?utf-8?B?T0VYZDl1OUhyeEd2T3VqTFl1VGVlNnluYXVIMk03ZzN1WEVwR1NOSCtZeHhP?=
 =?utf-8?B?cE0wVlYyMk85L3ZZSTYrSWphbUs4b2wwOGRja1ZUakxkUUpmUU1IQU4vaWRa?=
 =?utf-8?B?aVJqeGFtZEVoYTFLVThSeVR4bEp5MWU5MnVJbFBORkJicHlBS0lIZTYwaDds?=
 =?utf-8?B?b0FubDhhc0RobUNHVWJoeFJ3VVJhWS9lSlJMb3d2L0dRRFVFckZMNmViUUI5?=
 =?utf-8?B?M1p0MFBXS0NSOFUwVkVuS1pIMFBGbTVzMEo4L0lwWXZqK0lrVkdqSGM4Z2c5?=
 =?utf-8?B?emlCVzVjTzF4R09CR3VYMXNiYW0yWTNoaWlGUTV6bFRIbGdYdkZkbmNjNkts?=
 =?utf-8?B?bUlWNlYyOGkzekpQaE5MOU5lS0gvWjFDZTBmSjFIMnhQSU9kNlJEZmtWNjEw?=
 =?utf-8?B?eUpIOHhjZ1JVYUsrd2g5ZytWbGd5bk5lS3A3YTEvNk5HVmRIa0paUU9tSndn?=
 =?utf-8?B?S1ZFUlFsWit1azc0M0R2eFJrYjdDWE1XM2xMTmQvZ2pqN3pQTHpmTFYxQk5q?=
 =?utf-8?B?bEFFeHhibW5CMFcxN2tmQmlqSmhuNzFwQUJ6VmxjV3BIOWhnV1JKTFdnR3VR?=
 =?utf-8?B?c0dmMnl2N0NwZkNrbmdNa0ptS1RndXB0VUEzSHUvN294blUxT3BXU1M5cmpW?=
 =?utf-8?B?akRsa1FhRWR4MHBXcUhpcmFBQzRhMjU1dkRmcFlsaHROTEptWTBMVGs0Z2Nv?=
 =?utf-8?B?dlhDNlp1Y1ZmcTBBWlJvWTRLb3o4VEZsL0RMQ1ZmR0xSOW9mMHhnL2VNQXFV?=
 =?utf-8?B?V3Q3VE9CbHNCcS9TUHhQM1FTeFdxTUk1NlBZRXQ0ODVZckNTMjZTSm5pSXJX?=
 =?utf-8?B?M2VQTS9YUS9RMjZ4cklLT254UEJURm1PODBmSi81NS9uS3NTUC9vL2pDbzQv?=
 =?utf-8?Q?56R8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de90b06-7733-4b1f-e48d-08dd6aca1a1a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 11:50:41.4403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMAbGoQ9ZvdN9yGEhRWROa///8PNuzeh50vBQbJxSV5fN5ZEm8OYgQHKRA14Zg3M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6779
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

Am 21.03.25 um 17:41 schrieb Xiaogang.Chen:
> From: Xiaogang Chen <xiaogang.chen@amd.com>
>
> by casting size_limit_mb to u64  when calculate pglimit.
>
> Signed-off-by: Xiaogang Chen<Xiaogang.Chen@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

If nobody objects I'm going to push that to drm-misc-fixes.

Regards,
Christian.

> ---
>  drivers/dma-buf/udmabuf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 8ce1f074c2d3..e99e3a65a470 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -398,7 +398,7 @@ static long udmabuf_create(struct miscdevice *device,
>  	if (!ubuf)
>  		return -ENOMEM;
>  
> -	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
> +	pglimit = ((u64)size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
>  	for (i = 0; i < head->count; i++) {
>  		pgoff_t subpgcnt;
>  

