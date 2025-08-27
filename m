Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D45B3894C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 20:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59EFC10E170;
	Wed, 27 Aug 2025 18:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4Ap4FfKM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EEA10E170
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 18:09:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DelC/OygZVvaey96DUlYQIvFWBSnH0LlN/tVlsPCXJ6XQ2LfRq/wQODBscKq6QF9ZGXZT4gv60kinebnfoAEiVmbe/j0QATDSwSWUNyunCBD17iDJB3yWprtFMuMEodMG1FqHPWa2mqc8yuT7M/efOYT6x/RiVXXpq4ZmXQ9URG/rTiuBOl24trSABUFYV/AfoQFGZAYqIAH8t07NIvM6+mjDpgg+7Ou3mPRfhX8b2rQKSzyx2n2yhSAEZVWVMyeqx5BhPMgtl5PtSL/ceEg5V1LRziXDsMCdDSyF+VutXlRoFQ5zDZWfMCarUDUyhW/4M+pXNyNkIMinVasgUCyvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fl0nLaZ3+nstSyi5Oj9864Y+O86pScnLIkoM+EYU6sI=;
 b=r80OysWswL0kg/zrITzBtWab/DgAdw9yqUNAKMsY2hEekIdEANBSsyXzDc2uGfiMX9630GhpaO2WzwB3xuHmi7QMbb9R23tcMrPtJ/2ETAJ8ZfVF8sCCPKuwgsFtPDR5oL9jt/aPUTJQtGpLtbuCa1xBeDl6hsguuCL/D9GG4XgULvKrPzFX13nEHCB4WwenUgp07sdPUhDa/MVNle0T6U8jhlvzXN6e58wc7lZw8Q8Ml1/IH1zcPju+JrdabHBoP1f6XEFDtYnepPhq2J1YQxWptIR4VTY49zCYHa7eVHA7pMACTc/3IvIzwpgcRlQgb5QVUfaJlcbpwd5EfVGVnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fl0nLaZ3+nstSyi5Oj9864Y+O86pScnLIkoM+EYU6sI=;
 b=4Ap4FfKM+rsPhwPQ+Ts2n1Q0FBJ45TDPlfIqxpeWez/Cm0evUaqpGeKALYnnjhswN+Dx9EODPAw3EvTf62xxhL7DqMj8CVLSaT+phpWvK+oFIjRAYBMyh7+6MQvQ4Iw3AwPJKdV1hQMYUt3wpafsRXe4f4p6AGL1iHUzAPsTIU8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ2PR12MB8978.namprd12.prod.outlook.com (2603:10b6:a03:545::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 18:09:24 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9052.017; Wed, 27 Aug 2025
 18:09:24 +0000
Message-ID: <a4fa5f39-17a9-4b47-a53f-ff49db536eb2@amd.com>
Date: Wed, 27 Aug 2025 13:09:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Add ioctl DRM_IOCTL_AMDXDNA_GET_ARRAY
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, jacek.lawrynowicz@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20250822172319.377848-1-lizhi.hou@amd.com>
 <2bec1429-4f8c-472c-99a1-420a33a3d316@amd.com>
 <d6a02baa-3b05-73e6-9c2a-66c257efecc3@amd.com>
 <a9814644-96e3-456f-90b7-8705a102c938@amd.com>
 <2a21100b-2078-a166-0b47-9db6b4446b5a@amd.com>
 <b758a72f-e30e-42f9-a6aa-6f6297b8cce3@amd.com>
 <b3874221-5b4f-9625-de8a-4e54dc6884a2@amd.com>
 <c048645d-480d-4b7f-8dde-efb095b2c2fa@amd.com>
 <492b465b-03d5-e80e-a31a-79ce4b1f83f7@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <492b465b-03d5-e80e-a31a-79ce4b1f83f7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::23) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ2PR12MB8978:EE_
X-MS-Office365-Filtering-Correlation-Id: daeb740d-5b83-42fe-21dc-08dde594daa5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlgxSm82RE1UY0grOXhkYWw0M01kQUp5K2ZyK1pXRUs4aVluNDhZZ2czMzBh?=
 =?utf-8?B?V05KWEU0RWlITjhydGJwdVB0UEJDWDdGeUVMdG1iVTFxNDR0OUtEOEVjZXFG?=
 =?utf-8?B?bkt2YTFyS0VLalRoaWhkWm1qek9jbVlDMGJpTll0VGZzYnJoWDNIV2xSaFEw?=
 =?utf-8?B?bnZGUENSY25aa3l4NGUzMHVCaFBHTkVuVkhoNS8zenlKZFNCSGNRMjdyL3RD?=
 =?utf-8?B?K2k4TUpSU1FtOGoyU2JEWFZYdVVsUnV0NmYwUWhTbzc2ano2aG54VUMvS0R4?=
 =?utf-8?B?eXEvVzZ0Z1NlSFhPc1FRMFJNOW93cmF0MFdTMmkrV1BGQ2FJMG52bStIT0lK?=
 =?utf-8?B?eUppMVhxQU5TN2ltR0grSmxwa0I3SXh4V2trVXdEQnlvS0E0K3YwSnJ2c2xC?=
 =?utf-8?B?MEpseWpscksyTUd3Tm1FVHBvR3ZKSUZxYi9sZktlY1RrZ3QwWVdDWkhicGMw?=
 =?utf-8?B?dDcxbW5mNDdmcWdmc0RXTHdTdmF1MDFLL21aU2IrS2pjVklPbU5aNmZYUjlS?=
 =?utf-8?B?RDNvSm9BVzdiVytSZFV4RXRUTXVyZW5YaHg3RHlscjFSVmpyckE4eWZQaU4r?=
 =?utf-8?B?eGJIQXh3a1EyVFpMT3N4eDVTZ3BMYW8wcGpyOEE5ZWVXd0ZjVVczNS9Jd0pj?=
 =?utf-8?B?VEY3R2hMd0JBNFlBMVhKVmYvZWVmbEtVVmNKWkd0M2tURGNNOWJ1RkdVRGFL?=
 =?utf-8?B?UC9WRm1hNWo0aXJyY2diUzVUdkw0MW5uRGM2T05aRkZoeHR2YjJPalRrN2N2?=
 =?utf-8?B?QVhncXZLWWlvQlBMRi9uQ2gzczM2Z2tVSERWMkFBcEVXaXNGaXJweHptWFV6?=
 =?utf-8?B?U0JQOXR2YjVpeEpmc1JTZnhkY2xBbW9VY1UyK3hIVUFTTkhZRUpaYWk0Q3VV?=
 =?utf-8?B?MEovQTFHMkdXVW1sYkNmQW1iUUc3WWtIb2srRmhJbFFaR1lMS0F6eElyWTN0?=
 =?utf-8?B?amg4Y1BRTkh1aVEyZ0xPd2RyRXNVWFo5WFNhS014aTc5aUplem1TSUlXeWE4?=
 =?utf-8?B?dUVGVG1Qem5qYi92K0ZyenVCc0k4TkJRQ2F2T0FDa0pVRTVYd1ZRN2o1Y2Zo?=
 =?utf-8?B?djRhQ25xc1lCbmNaV2RYVE53dGNPWmdoc0RleURLb29XcThNMDZYRkRTOVdI?=
 =?utf-8?B?bXY3c1VrQ1ZyOW5DM3hCV2Q4OWprK09TZzg5anJkM3hEbVVwazZxR2MyZTBR?=
 =?utf-8?B?d1k3TDd5U053bjR0dUcxYVBjTVgxcndYVXBNNEVZRnhjTHpDQ08zQldZZGFk?=
 =?utf-8?B?c3hRR1p4dlk2NXo0MjZHM3ViTTlPMVF3Qm5qWEorMXlFamkxbGJJVVlzSGFU?=
 =?utf-8?B?S0l6OXJEbkk1bndaZzZaWFdEWWVJZEIzczV1anFvc1Vxenc1dWpQNXhUTFd4?=
 =?utf-8?B?L2pEaDN0cENwNmNmMXljdStDQTMwZ3ZQSGgyY3d5VzJtNWdNR0RRblVRd3NM?=
 =?utf-8?B?THlRbUVxMHJhdFZlSWJ4SWxPam1MTzdUSU92SzRZVy9NODRGVUZLQ2NlUkJD?=
 =?utf-8?B?aGEwU0dyNFpQVGxyaFlyaDRxOWl0QUZEVWVNREI2aHFialRqY1hIVVJCWjZ1?=
 =?utf-8?B?Q1Nob2FuckxXNUQwMUtwSy81QTZLL2VlYkV3WFFSRTlERnNZRDUwSGZwTlFv?=
 =?utf-8?B?N0MyUDJHWStGUnJaZGlLdzF6WmpReXJ6WFFQeTExN09DSXRwZWJhdEtxN0tu?=
 =?utf-8?B?clExRVFIc3BPTlR0MTJrYWRBQTIxd0ExR3lDUE9WT3VyK202WlJlSE5KblNq?=
 =?utf-8?B?SGJBZTMrVHpUQjRiT3ZwalJjZWxudG9Cc2k1OWtXcUltRXE0OFVOb2pPQWpT?=
 =?utf-8?B?Ym9heXhoNFhEK2I4Nkh1dGNzOHREK01YZ1VJY3h6UDhxdG80VVpDZHFtR1ZG?=
 =?utf-8?B?QXZkZitVcE56M1lrQXJFWVRGeUl6a0Z4c1VpU0VOLzFsTnR5cXhiT3Vuc1dz?=
 =?utf-8?Q?r5LHbySquMg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUJLdXA3KytmTFpBaXlXRFZwYzU1RjlrOEIrTUpJV1BIZmh5TEV1L3BQRTJy?=
 =?utf-8?B?b1FTQlhWdW13ZFNJdWFxMmd0bTJza01PT1hLcXl0S1JEdi96NGpiZG1tTE9B?=
 =?utf-8?B?aGJ3aURXb2dlSnBhb0lZVE9tN09ST2NSTEMycjFyRmU0elRIRXhmdDNnUDFG?=
 =?utf-8?B?WElWeGtBVUZZQUpyU3lTN0kzMlZTMHppV1B4TDlKRjk4TU9RbERhQlhQdWd5?=
 =?utf-8?B?eCs4NGxMS2JMS0VmNjN0bUtaQlI3VXV1aWpNT3BtVWZSRFNaWjdmcXZrZHlG?=
 =?utf-8?B?YktVdWFCeDFDZFpYZHRqejh5Ry9MN0Mya3M3aUV0MmxvZmJIZmx1MUlUdHYz?=
 =?utf-8?B?OHNuV3R2WER6d3dCTTNkZVlRUG9leXIwakFJcUxITlMxSFE5SFVKbjJLQ0xW?=
 =?utf-8?B?RW9CcDFqTnlXT05yU20yTmpVL3FWWjY2eWdobGMrTVFiZ1NXaGpNazZRRTJC?=
 =?utf-8?B?L2dpYU56UnR0T0gzMnZweHc2TS9rSC9tVUhBakpBL0pPcmpWNTVEeWFHOWpk?=
 =?utf-8?B?U3M2REpvN1V6VVNOMkZ1TmVCNGJFMkxuQWVZV0k1cHMxMFhFaW9halNacEdC?=
 =?utf-8?B?RW1wZXNsNnhOZTBJbHZDZ1lsN050SW5IR1g4ZUFBM2VtbHBQK0lubU9KSTZ5?=
 =?utf-8?B?Y3BoNGdLZE92YXdPbTJSZEw2ZHhhZU1nOVIxYWRRaTJkL3RYZFBVb1ZLZHlW?=
 =?utf-8?B?dit6cS96cUh4UTNiVW9yazZKVURIVmpEbkh4S2U3MTZJQ2NUY0Jya1M2bkFE?=
 =?utf-8?B?eTFidVBLUVNUeWZwbGJueHZnTFlibHY2cEtEdkt2THlYcDllZXgyRkxYVlNv?=
 =?utf-8?B?QnJ1K05nVjdXTGJJTm84M2hTZE5PY3VVZjJVWTMraTI1a3IxV1RMWDlPdjFH?=
 =?utf-8?B?OWhOd2M3N0I4NFp1Y1BYUVd4NFEwc1F3QkRBNXQwaHNwdGZaRjlCd3dkamZF?=
 =?utf-8?B?RVNLSnhZVk9sWFNtMmxSWGhWQWNBSDY5K2RsUFdiVk9zdWFBd0lwbmZhTVNV?=
 =?utf-8?B?Y1F5ZjRGR2JBMzlVRXNIU2JzY2dTbStadXBseDFBMWN5MlcxWFdCNllrVzFl?=
 =?utf-8?B?dDczeGZqbERrNnBlbWg4a1NBcm8rMjJjaEptSEJBK0hQemF2ZU5uRDNsckpW?=
 =?utf-8?B?emdCWE9KYTVUL3E4RXdoc2szRm15b29qSkVUQTBRT2RIcHN3aysyTzBKZU53?=
 =?utf-8?B?VHp6R0ZhRFhITWsyenNWcUxOYjZmbU15amFXK2lpWWx5TXJFUTdZMW5aeEtB?=
 =?utf-8?B?bmlqOTlGU2pmenRFTVd5VFNpa2pYZW9nbmczdzdheTBYVCtDaTlCWlA3N2dD?=
 =?utf-8?B?Y0FKZkkrc1oxUTk4VzJFdnF3S0dGWERYU1JPZVhzMk5MMUw1ZzJvRVVBSmhK?=
 =?utf-8?B?bENIZmJWWVZ0SXM0bzZoV0Zmb0RrVit1cjIwdHNZTGVoNVVUT0FGUzBxVGtj?=
 =?utf-8?B?VTZ3K2Z2SnQrcTNkMWxlUDdpbzIxSkxkWnYwL0txbGxzNy80RWt4WjFLNHEy?=
 =?utf-8?B?d0pnbjJHTHNoTGtJZndHdUNXbUdQZks2dGZOQmVzalZGRjFPWEZDaUkzNHk3?=
 =?utf-8?B?WDdtRnBVMHJUVUY4ZWpCL0pnZmlDRk9wakJmWldvb3VMdnJjWjRrbnlHZTRu?=
 =?utf-8?B?LzRjdTgrNEtnd2Rndm1oN01Ud01leHRLZGx1UE5RYzVDTi83cURUWHBBQkdy?=
 =?utf-8?B?MVpjaDJkQzJFSEVwQUpUVEZZT1JsOEZFOEx5NVFDUm5KNU4xYXRLOSt1ZG9B?=
 =?utf-8?B?ZG05Ymp2NURGM3FGTXMvTHFJMXV0NmM0eThPb2dUN1JVTWJLUDRYYWJ4RUg2?=
 =?utf-8?B?bEoyWG5oY2c0OWZvQk5zVjBJaDdKRXVIbFZibnhFK1ZJbTRiN2t1dkhBcmI1?=
 =?utf-8?B?QlBSVDIzS0UxUTRNYUk1bjJGa1UwcnVYWE92RmRVbHhsendjN3JkZW95YzRj?=
 =?utf-8?B?aUZkaG1IakpFY29qMHVPZWhKMG5Jb01tZVlKc2QrNElvb0x0STg0MjIyQzkw?=
 =?utf-8?B?MHhlYWxLYzd4a1V4TkE1U1F3TnNZTmdaZmM5RDg5a2txUWJrOURmeHYrNGtx?=
 =?utf-8?B?SGZsc1AvcUVkTGlhVGhjV0M3ZGgwdGNRWERNNTdXVG1jWStQMGs5L201Rnk3?=
 =?utf-8?Q?eyu/xx6xPGvaduf+09J/k+0RH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daeb740d-5b83-42fe-21dc-08dde594daa5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 18:09:24.4760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+Av3GQSJ1eIFQRizbxYD4vhzAn9pRNo7dpJMhdorq6qbZZ9l/z/PuZa9+dfYk/CXmcSD3D47M/2b5J+66TS1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8978
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

On 8/27/2025 11:41 AM, Lizhi Hou wrote:
> 
> On 8/26/25 17:31, Mario Limonciello wrote:
>> On 8/26/2025 1:10 PM, Lizhi Hou wrote:
>>>
>>> On 8/26/25 10:58, Mario Limonciello wrote:
>>>> On 8/26/2025 12:55 PM, Lizhi Hou wrote:
>>>>>
>>>>> On 8/26/25 10:18, Mario Limonciello wrote:
>>>>>> On 8/25/2025 11:48 PM, Lizhi Hou wrote:
>>>>>>>
>>>>>>> On 8/25/25 14:28, Mario Limonciello wrote:
>>>>>>>> On 8/22/2025 12:23 PM, Lizhi Hou wrote:
>>>>>>>>> Add interface for applications to get information array. The 
>>>>>>>>> application
>>>>>>>>> provides a buffer pointer along with information type, maximum 
>>>>>>>>> number of
>>>>>>>>> entries and maximum size of each entry. The buffer may also 
>>>>>>>>> contain match
>>>>>>>>> conditions based on the information type. After the ioctl 
>>>>>>>>> completes, the
>>>>>>>>> actual number of entries and entry size are returned.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>>>>>>>
>>>>>>>> How does userspace discover whether or not the new IOCTL call is 
>>>>>>>> supported?  Just a test call?
>>>>>>> The kernel header version will be used to determine whether the 
>>>>>>> application which uses new IOCTL will be compiled or not.
>>>>>>>
>>>>>>
>>>>>> But it's not actually an application compile time decision, it's a 
>>>>>> runtime decision.  IE I can compile an application with the 
>>>>>> headers on kernel 6.18 that has this, but if I try to run it on 
>>>>>> 6.15 it's going to barf.
>>>>>>
>>>>>> To some extent that comes with the territory, but I'm wondering if 
>>>>>> a better solution going forward would be for there to be a 
>>>>>> dedicated version command that you bump.
>>>>>
>>>>> For in-tree driver, I did not aware a common way for this other 
>>>>> than checking the kernel version.
>>>>>
>>>>> And here is qaic patch of adding a new IOCTL.
>>>>>
>>>>> https://github.com/torvalds/linux/ 
>>>>> commit/217b812364d360e1933d8485f063400e5dda7d66
>>>>>
>>>>>
>>>>> I know there is major, minor, patchlevel in struct drm_driver. And 
>>>>> I think that is not required for in-tree driver.
>>>>>
>>>>> Please let me know if I missed anything.
>>>>>
>>>>> Thanks,
>>>>
>>>> Right; so bump up one of those so that userspace can check it. Maybe 
>>>> "minor"?
>>>
>>> I meant for in-tree driver, is it good enough for userspace to just 
>>> check kernel version?  E.g. The drm driver versions are not used by 
>>> ivpu or qaic.
>>>
>>
>> Just because they don't doesn't mean you shouldn't.
> Ok. :) It does not sound amdxdna specific. Just wondering how the other 
> driver/application under accel subsystem handle this.
>>
>> Take a look at what amdgpu does for user queues earlier this year for 
>> example: 100b6010d7540e
>>
>> This means that a userspace application can look for that minor bump 
>> or newer to know the ioctl supports user queues.
> 
> As in-tree driver is part of kernel, the userspace application can check 
> kernel version to determine whether a feature is supported or not. Could 
> you share the idea why would user application to check drm driver 
> version for this?
> 
> And amdxdna driver is new added driver which never bumped drm major/ 
> minor before. Thus there is not any application use drm versions. Maybe 
> using kernel version directly is good enough in this case?
> 
> I am fine to bump minor if it provides better support to user applications.
> 
> 
> Thanks,
> 
> Lizhi
> 

If you're running mainline kernel I totally agree with you that you can 
make a runtime call based upon major/minor kernel version.  To me the 
problem ends up being cases that distros do a backport of a driver or 
subsystem that this falls apart.

For example RHEL and CentOS stream both do this, and then such 
comparisons can no longer be made accurately.
