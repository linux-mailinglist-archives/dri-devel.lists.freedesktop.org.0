Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F12C8506E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 13:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1603A10E27E;
	Tue, 25 Nov 2025 12:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="S9taJveZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010031.outbound.protection.outlook.com [52.101.201.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31F110E27E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 12:53:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRF2vfdV6aZIwEaKqf/vjogFyefhDAZQ3L58y5JlT2udVtzot/LhMgatVG9U0pzy+kM1Po8nSPCLna0EBvXx1rRCv8eJrP/Tvb8SCiINqM8EHrOliO2fqEIVRvAdn1O4uErUkzRU5OYIpHIYmKg1sBD+071M9ak69IYSjm3kagYEhxT5i+6hZe9caWAGMpb9B03FYqvv3lhoTv7G64Bo9GfUpFdJUyM/wCKNdQle2w7iO+YkUysUIdvYHopNjY1FLEYpxRKBWrqJTv4PSGpXiUTN9gxpTR+6sIDwjvnIfudUg+FUmMqc1G+kIh0iudr7dfTQ4i7ykdZHQfwfS7hP/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8UytssQYkO8VWzIr0Z8VnFMxMaDPC142Th3ZfQgiAU=;
 b=s5C3N4I2SmHCFZCnPYR1TUy1ftc3QDBeMXsweVF7qnbQvDZ3NM9iqLEQyWx8iHodb7BV2oYIwwBUfcBHbpioVyWZ9rzI/ifvMhk65quESTSigWlDRYpN8DpQt4UMo7djMZepfGE1ZXwkCNN6q8rXEChdRuWjmxT0xyFdAVYY7Bott2b0GWPxLf4ehVRm72ngZgQYZDWxHBqhvy/sj5KILf/N2pw7d91E4ZiMdPlkyEJTn0fFA2HDL8eEz1pJRitlrrJlU2LAK8da5v66tpA2iEdpSeQZW8BP0ZQ0h/+oF4f3qq/7qekkgzraQFqf45xc2K/AdCOIiKmjZYQ10n5w2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8UytssQYkO8VWzIr0Z8VnFMxMaDPC142Th3ZfQgiAU=;
 b=S9taJveZv4BhHraRMzLTkwR924T2t+sARplIhQpeZmwmZKv2vWfrdvyLU1AumbUEOie88FlizTCZJbxF/K6UoSB6eWwtpFuF5B8buBooyn/H7TFpc3J+74u5UJvVXlrFmc1Ep/KT/+ywlVQvwPPNzSg0iK54hTHSP//coNO9LwI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8062.namprd12.prod.outlook.com (2603:10b6:a03:4c8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 12:53:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 12:53:47 +0000
Message-ID: <28441359-4625-4d3e-8c1a-852a1868bde8@amd.com>
Date: Tue, 25 Nov 2025 13:53:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm: disallow setting 0 as new handle in
 DRM_IOCTL_GEM_CHANGE_HANDLE
To: Jan Sokolowski <jan.sokolowski@intel.com>, dri-devel@lists.freedesktop.org
Cc: David Francis <David.Francis@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Felix Kuehling <felix.kuehling@amd.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20251125102847.904357-1-jan.sokolowski@intel.com>
 <20251125102847.904357-2-jan.sokolowski@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251125102847.904357-2-jan.sokolowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0181.namprd03.prod.outlook.com
 (2603:10b6:408:f9::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: bdd6093c-0e4b-4765-cd57-08de2c21ac21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFZWVDNKaW5MMG1hcjdyQUJjaHVUN29pYXJBQldhMzFIZ09VUDZCS1hNYkhE?=
 =?utf-8?B?TnpPekxrbHlzZytrNW9FYklROG4xU3hYck1Ma05TTWVKWHZJY28vRytoSnVq?=
 =?utf-8?B?bXhLSXBYWURCUytnRktjcHphWVhlS2E0THpBdi9BOVB5cEZyS0RDSmNrY1h4?=
 =?utf-8?B?a1JkWWYwVG1JTzhCMjlkM1VnRDZXRVE0ME9NL1FoK2pNUUZ6K0Rld2k0ekJM?=
 =?utf-8?B?aHY4RUxYTHZ5RkV4YWllaytSNlJHSXc1WVVRdDB4UEhUc2NaYmMrZnAyWTNZ?=
 =?utf-8?B?WENlK1JsbkxQbWNveUl2dmZFUHE3MHVGRzhLRlB2cnY5cUU4c09GdEx4UWgw?=
 =?utf-8?B?ZkpJdUN1ZlI1M1p2RlpxY1JNWWlTbWtiMWM1YzNhVzNTcDZ6aHRvejFOVitT?=
 =?utf-8?B?T0g4QWVXLzEzUS9XMUdnU0VJNURKaDQ3SjVMYWRNV2VKekRiWG11djUrZmJo?=
 =?utf-8?B?cVIrYWNKYlBOSXlzU3pocmpUSkpxdWZUN2prNXRkUjFWNFNadkE3N0xGOEdX?=
 =?utf-8?B?U28xM2M3U25lNHVyL091Y3JNNlQ5YzQyQ2huNncvWG5haEJ0aExoRkEvVDZk?=
 =?utf-8?B?cTdEUEk1QU1SOGhXVzNHbGFtMFVLRkhBUnk4VnRPTWdZaGNjYTlIKzBqbmZX?=
 =?utf-8?B?WFI3NlNkc0pTbjRYRHdOTDFPaGdWa0dHZDNxeVhiRG9POWlFVkV3WmxjaEhl?=
 =?utf-8?B?SzYzNFg3T0EydmJsVWZQa3hoM1gwRHhwM3JhdXo3TlhDVXFNU2RjaGpiUjgr?=
 =?utf-8?B?bjJBcEdxZUxtR2dUMnhBR2FGNkhGVkFBU0hmbTkyeWplTFRkOUVlNjZFeVEw?=
 =?utf-8?B?ZXhRUTZLbFFLSVZSelNONlZibWZ5dkxhV25TeUJPcmtjSTE1MTRkSWEzbTk1?=
 =?utf-8?B?dXBqSXlRT0M4T2M2V0MwRDBzbWt3L1JNNnRrTndkMHdrOUh0RjdaeG5VenJO?=
 =?utf-8?B?ZkxJaXBGUFZJdWIyVlJzM3NGRm8zam85OXlUdDRMaDg3MW8yZU52MXRySUJn?=
 =?utf-8?B?enF5c1BWNlhabTZFV0NBcjJjV1JacFUxTi9wdkFSL2lQWWgvbU1rYktCcVAy?=
 =?utf-8?B?YlVxZWhuZ3BaMytmb20wYVphY2l5UnI0bkNIa21aaEFNaHBuWTZKOGl6Z1M3?=
 =?utf-8?B?aWVueDlIZ0h4YkxGeWN4ZWVKZ2R5NE1zNHJwajY5VW1CcHo3TGR0VGdWajlp?=
 =?utf-8?B?SzBtZWNuY0JxZnZFRGdBTitRamY0cHppUlBPb25sNjl4dkUzdjFPeENHc0Fu?=
 =?utf-8?B?a1U2LytvdFdJa0o2VVhwVDQyNkxGQVlGeTNLK0xyOXE3ZEFmcGFScDZxWHZh?=
 =?utf-8?B?bDBCQU1QTmpCelpVemdvWlg2SDl6U2tFRDNwTzlkcTlzZWhOdnplOE41Zks3?=
 =?utf-8?B?S3l2WHdhUFQrZ0I1eXRZZlhVUVVKU0V3V09zS2JySDljYzdDUlBRaGRjOGpL?=
 =?utf-8?B?bU9Zd1lBMEtESU9MZWhkelUzUzdxTkVmUVJMQ3B4SGJNQ2tVbll0S3dUc2Vv?=
 =?utf-8?B?STRheXc0Q1NYZ0xhSmIyb1ExR0tMQmtKdVJydjdocEtJSWtlUkNxQ29FeThx?=
 =?utf-8?B?cVZCc1VsTEhvcWJFYTVZWnhjTE0vN2UydG1GOVRES3d1V3lLaFg0SGlCZVpY?=
 =?utf-8?B?L1hvb3M1djluRi9MM09iQ0hyeU5TbloxK28wbkswVFBZc0dhdXJKT2NyNzZi?=
 =?utf-8?B?Z04rNlkyd0R0R2t0eTBka2NFbnVNNE1rTU03SjdrVllOVTB2dmVJVFlLajQ5?=
 =?utf-8?B?b3lFdmR3L1A3YUloOHE1dVhKam1FYlZHbS8rRkcyNm1UdkVGc2U2blFIaFBi?=
 =?utf-8?B?bkkzQU0rL1dmdzVRRnFiR1ZobUFRRGN3WDY2bGQ5WEFaRGllSTNHZ3Y3K1Vz?=
 =?utf-8?B?NThEOFJqMzFKcG5LajVZNjRuTkptUHJQQ2NObFVLMEp4K1pWaXRtR2hCUlZF?=
 =?utf-8?Q?EsKfeuOasViiFP5A2Q7nSRwgjyzDkuMC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGhYWVFnMVNvVzlLdTdIWjF5bDUrcHEzckk2RjFWVG5Nak1UakJoQm5hTnJN?=
 =?utf-8?B?VlVtcmNHMFByS2JYV3p6eDFvcEwzbDdIQktEelVOUHZTK0dkV1FSczRqamdJ?=
 =?utf-8?B?YVpPY25qb01OZ2Y2M1RBT3d6dEZMUHRPTGhrT2lkNEMrMWs0NFFSa0E3c2hj?=
 =?utf-8?B?QkpJWTVFd3VyQVc3Y3o4aWx0UGNqSVFHN0w1TDB4SUxJT3IybnArRkFsK0lk?=
 =?utf-8?B?U1RkdjFPa2Y3T3Q0VnJpRm82MTFoWGtHNmdMMEdEbTQwZDJKMFcwbWxzYm1u?=
 =?utf-8?B?QkN4bXJFZjc5U2Qram83YmZLRkNEL3BNcDlUVHJjZTFOUkpiK3U3TmZpcTJY?=
 =?utf-8?B?N0RiVnR2dXF4OXlZV0ZTQWRpeU11SGhKdVBKTzROWDdnNnlqK2h6YkU5eVNO?=
 =?utf-8?B?RUY1RnlXZitjOFZMWm1GZDJhNTN4Q3JVT0JhcUp6T1FZd2FzSU1RM3RXekcy?=
 =?utf-8?B?SngxTWpiaHh6Ym1BMEVrOFIrS1dhSGlUQTY1TkFmbjdRR0U2M0JKd1JpVXBn?=
 =?utf-8?B?VzZLSE9nRWZOb0VLT1V5K3VUT29SV2VmWE4zazRReVR5M0pSMmhubWVYc2RP?=
 =?utf-8?B?WmpIRGtTS3VtdENtSUluK05CZE9EZGlranpNY3pUWGFLT0tyWHAvekhpN3JU?=
 =?utf-8?B?THhKSXdqeFVxMmpsV3FFUzRmc2NtU291V1Z5UVZsejBmY3dOSDNKcG11Znhu?=
 =?utf-8?B?UlFZWFplVFJnanBkOXFDajB5dEhaSjVEZ3JjWHZCYlZ6enhRNlBtRnRFYUVF?=
 =?utf-8?B?cUt0SStzckxIQjE2K1RKdkl1Yk12NkE5NFBES0RTR3QrVU01RnZSWUNHeVU3?=
 =?utf-8?B?VHpCL0F3MTJPRlp6RDVWNzZieWR1LzJydllPb0RTU0RxUlBtdDFWejlJdXo5?=
 =?utf-8?B?SVpUTER2bnNNOW1HcjFHMDVUbjVyN2wxY09wZnNiREROQXhpZFJNQXdTcHNW?=
 =?utf-8?B?S29wekRvVld6VDkrMzFPa2IrUUdxa1huNmNERk9SWUdpb3FqS0YwY1ZDSmpZ?=
 =?utf-8?B?THFJYmZvQWxXSG9kL0c2elhlejdjYkQzMkJtWnJJaEFUOFdnRi9pQXJaVEw4?=
 =?utf-8?B?N1V5d2J4U3Bia29YdGdzUGcycDJBQ2MyU0QyS1M0cDJKbzcvc0lsb0pwbnpi?=
 =?utf-8?B?RmRNWnFleVE2ZTNPZms4YzBZMGhMZ3ZxWURTWkpQRVBIeXBpZ2pBakw3eHVQ?=
 =?utf-8?B?bU8yK0VMR1RwZUJMTVFPQnllM2IxSGxUMG4yTHdXRXFYQmxYemNUWG9XUFVv?=
 =?utf-8?B?V3FtTFdZQnFuWEI5UEU3VWVYY2xLSU55YXV2aXZsNDZ3aE1xbkN3WjEyYjBz?=
 =?utf-8?B?WDBJdzJDVC9HU1FyRzNnaGVMNXFvSmlZQnBaOGpsbzd2ZlZSWlBzTmhrSHRM?=
 =?utf-8?B?M0xCakMrT2FCeXR1ZEVBelFoWW1GKzRwWlRaRXRNUFRUUWhiZWRDb1VUbUI5?=
 =?utf-8?B?TW1nR1l5VFJuVE1tZ01hdkVWNnRudWI0L093d2RSZ1hKdTFKY1NmZjROUXBM?=
 =?utf-8?B?cUNNVEJuWGdPbHl0TjNHdERWUDRDS3FNZlFSdi9PVnB6NGk2L3BTZ0hScUNY?=
 =?utf-8?B?M1gweDF3TWU2eXIza1o3VDFWdUJwSVgwRkZ0Z3U4UFU4bVVvLzVubU52K21H?=
 =?utf-8?B?aWNqZUpscHAybG9pWFZXYUJpOVBPWU4zR3ZVZkNDZXpyMVAyZlROL2JvbVJY?=
 =?utf-8?B?dlphaHBzZVRtWUVhZkRGM2MvT2w1RWV1NG1mT3c3NU1qWm9Pck8rMDE2RmdQ?=
 =?utf-8?B?L0M1OEVIWDB3S25XL1NJSHYrNG1qYWNwRC82TUpZNU1IVE93QWNybGtKUWJx?=
 =?utf-8?B?YXNYTHJBYm9WSFZ4Y2dYSHhKRTMvM0N5bVVNTlk3NXIrbHJZdUNEQXQ1OUtW?=
 =?utf-8?B?bGJNUmpkektlOUxyRU9mK0VaMVBkQkRhNTJLbkMyclUyM2EreEQ4TnNkNmN5?=
 =?utf-8?B?Z2JVeVFtSDhjRWhoM29Ha21DKy92QjhJTTdMQmtZd3VCN1RPQXVXMFByUkpP?=
 =?utf-8?B?SEZ5ZGxYM2tKZEdIYmRJYWlQTXIwakFrNlJnTzNObXJjU1prVHcxVXI2QktE?=
 =?utf-8?B?N2RNWlhJendsMkZTOTNCWlF2U2pYRFBxRFl3ZTJBY0liUU5XKzZidmJud1Zy?=
 =?utf-8?Q?xUKwwwnjaP8gPoqXVRycNDs9q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd6093c-0e4b-4765-cd57-08de2c21ac21
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 12:53:46.8572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vy4R1ih6QkcQiykZ55QFLxA3kxqu3X1eO9Lu37N5xrbWFrj/TbKt216FWbPlCx2z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8062
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

On 11/25/25 11:28, Jan Sokolowski wrote:
> drm_file's object_idr uses 1 as base value, which can cause id
> mismatch when trying to use DRM_IOCTL_GEM_CHANGE_HANDLE
> to change id from 1 to 0.
> 
> Disallow 0 as new handle in that ioctl.
> 
> Fixes: 53096728b891 ("drm: Add DRM prime interface to reassign GEM handle")
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> Cc: David Francis <David.Francis@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Felix Kuehling <felix.kuehling@amd.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/drm_gem.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 68168d58a7c8..2a49a8e396fa 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -975,6 +975,10 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
>  	if (args->handle == args->new_handle)
>  		return 0;
>  
> +	/* As the idr base is 1, trying to set handle 0 will create id mismatch */
> +	if (args->new_handle == 0)
> +		return 0;

That would need to return -EINVAl or some other error code.

But I'm wondering why that is necessary at all? Doesn't idr_alloc() return an error when you try to allocate handle 0?

Regards,
Christian.

> +
>  	mutex_lock(&file_priv->prime.lock);
>  
>  	spin_lock(&file_priv->table_lock);

