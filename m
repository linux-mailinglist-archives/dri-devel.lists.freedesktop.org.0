Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 737CEBC5587
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 16:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D07110E821;
	Wed,  8 Oct 2025 14:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sKPfTuEY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012066.outbound.protection.outlook.com [52.101.53.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E0710E81D;
 Wed,  8 Oct 2025 14:03:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ToejnVPNURarcAx0orPRVw2ObeIeygbDUXGSo2rEShGPSE01OgPF6jZFwRDXIfTlmb1vf+gwLgdiEFNRol1XC5Ogzc33Ltyr0LVP1GkK0VJ9zPFeV52UnF6NxQBx3XYbUGqcx8hMsER2BxFeo83LNuwe0QHYB6wc0Zine6mYQBccX+QEehhuqlgAJy/O4rGkCU6kmc/TeReNZAjqqBoJ9tGpI5Rjsnm+AuEWRmjNhrjqAtoV/AdhzmgRftIwM6LphNxJhWANiffuCRyUMaSg8zE98LBum0qGdzYAP7SVkUtKD+9QHJd/MSClXORSdDgClOTgE0mwOegniSktPkCy+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVUSMWL+6tiBfcVtKrO1ZOZBiTamSDDbISlJOGcepWo=;
 b=PFgO2wLk60hN0hjKk+krYjTBsBKW489ZpPKFH8xdddB+5n8I6hNEoXy+N9K8LgD7i9ICG33w//E3M+JDwoUDAERLuGzY4huRJ0uOP2khBNjF5Yll4gAUC0kFlk3G4a0JQlZ5Qb3tnkwRDqAJjZn3ujM4Ukf7tpxAtBN6i9fIKaWQoPGBkEFTk6tp/c354n1Mo2DWM2WRnuSV0W9iXbpUeH66yiUrvwFWAl1XA1Gf4Nm67R4e/ZQ1NIKyQ2oyElgo46pnucGCgotEyXl43Cf3/pSgicABv8mSOM75civ7Fgyd6r6F9F4M6f1WzK7fttF5UM/SydGy6Q06kmL6QJ6GPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVUSMWL+6tiBfcVtKrO1ZOZBiTamSDDbISlJOGcepWo=;
 b=sKPfTuEYS/3WpwKl/O7pqb/jZkS3/oVQNPay0ozKHVn8qSWreCv9jI+QUwCvVk1jX6oBvCgl4+5E3Up05pswFPTUv9cAHrOeBz5BpMbega0GC7H0o0d4qF1eA428VhZwmeh1mVri+1d1DeRMZDzJmuuR06QW4vv4EN5rP+siSnQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6528.namprd12.prod.outlook.com (2603:10b6:930:43::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 14:03:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 14:03:00 +0000
Message-ID: <9bb3c06e-25c1-43d8-a4e8-e529c53ff77d@amd.com>
Date: Wed, 8 Oct 2025 16:02:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Improving the worst case TTM large allocation
 latency
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zack Rusin <zack.rusin@broadcom.com>
References: <20251008115314.55438-1-tvrtko.ursulin@igalia.com>
 <6bba6d25-91f3-49a6-81fc-7a03d891cd1d@amd.com>
 <22228578-a03c-4fc1-85b2-d281525a2b6f@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <22228578-a03c-4fc1-85b2-d281525a2b6f@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0382.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: d0ebfccd-3b3a-4a27-3894-08de06736432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ci9oTnI3ZXlpWC9oOXM1VlIyWi9LZUl0RXRJcVo1cjlURmpDcVpEMWxJYVp1?=
 =?utf-8?B?bzVXMlN4cXFmS0gzaXpCdWlURGNqd21BZ2EzOGt3L1lpV2xnQW9SbG9Yc2No?=
 =?utf-8?B?MGRKYUV3a0FUQVVKMW5GbjB1UHdJOGlHem9tdGpqOGRsVW0wRjdUVE13a0pn?=
 =?utf-8?B?Q3VZSGVuVllHLzZ5NHJmYzRCWUt6UHQrUENUbTNqdDR5b09oYnZCU2NNaCtv?=
 =?utf-8?B?Q0hlT25teWd1NmoyRU44OVhiNEZKVU05anp5WmhNSlFHaGdjMXhhYjQ0bVFr?=
 =?utf-8?B?cDRUa1BGcjhTUk42Z1lVNmdSdlZ5MEorU1RRNVpXdE5UNzRVc0lwbTFlSVpw?=
 =?utf-8?B?eUxVdXRybU5mK1JYK3lPcWh2RmZrZEk4eVAyZXFWWkVjWmRPbXRNNDRNVzhm?=
 =?utf-8?B?UmcwbllUUnVBbTh6bC8yV1dGanRGRXVob2tYWjM0cGR2b3J1TzZlaFQ4bHdH?=
 =?utf-8?B?Vlc1aElibll1S1FNZjFnYkRNWXBRcnRmNzNSYzdlenNoTmJ3RjR5eTl5ai8w?=
 =?utf-8?B?OUhSSHZML3NKaS9ra0o1T0FHc0N3T2Z3eVNVelQ2am10R2ovQWJyQ084UlVo?=
 =?utf-8?B?dldjU09NMjdmRGYxK2tkTFpWa25SUzM3MDBJbklmdjA0ODI5ckh6bCtKUmdv?=
 =?utf-8?B?cEJCMTZvaGRIdWR5SE5oaEduZk1NY0tUaUZVV1JuTTI5RHVTWTZYQldTb1A4?=
 =?utf-8?B?a0JsRG5lYUlVQ0FqejZHVFRYblFXZ1Zxd2h5bFpMT1VBUVYyL281QmI3b2Rr?=
 =?utf-8?B?eWRJYzUxTzgrNklISGNwN3l0ZVlZNjQ2UXBsTmJTYktRL08xNHFnTUFLYlVx?=
 =?utf-8?B?bVhHdXBnMUpOVEhoU2ZpVzA1WERtY1UvMDlzRUVob3VXRHI4b3gzcHhTRVo2?=
 =?utf-8?B?cmdjSDVBeWI2YjY0bzVNNGZPSXR1MXRtNGxVOE9tUU1XTHJVSVBYUlVRODJY?=
 =?utf-8?B?SCthR0ZDTmd3VUpLWXR2WElaNDcyQ3I3MmkzTU9XWk1rU1dzdGhyL3dwUnJs?=
 =?utf-8?B?ZHExNEhYU2g4V2xMOTFibEc4MS9IYW5WdUVRVkRlN1RoazF1cmdvdFlqeVla?=
 =?utf-8?B?d01lSm9laDNMQnAwSEpNRnhTSm1YaC9EcnlmNlliVE5EUTdNQ3h4ZjFodzRx?=
 =?utf-8?B?ZFUzbXJNbU1pZnVwQ0oydTJucGxUNkNvdU1OVWxIVHZQM1kvdlMyaWlRUkRt?=
 =?utf-8?B?Mmt6R2ZGMmFnNE0vT20vcGZGL0MwTVlRWWhLelJ2SDNLL0t0ZDhwLzMwbmVH?=
 =?utf-8?B?WXFrbXZ5NTQ3YmpRZEtOZjVaZW9EWkU4cC9wRDFGS3dQdDdkb2hzbWJGemVN?=
 =?utf-8?B?NzB5SWxPV3JSeVYwRGtYZWFzbmdwRUtkUWl6SkVLODVabmFGZnBHZElOYklJ?=
 =?utf-8?B?bElpYjFBck9iNDJtUGViNmx1K3dMOStYbk9YUXV5NG81RGNKMTA3SGM0dUpJ?=
 =?utf-8?B?UzJ2U0t1MXVFNkRMNGV2TGFRNEdybTlRQVpmZEg2ZWZwYmNqRENVMXNiSUIy?=
 =?utf-8?B?MXVST2hNZlMzZlVIczk5a0sybUE5Q0pHbFY3QkJhd054YzJkTStVMDEyLzNN?=
 =?utf-8?B?cnNFVFVSeXVBSThHb3M5NnlrbzRiVFNGbUNiTWRFdDlRallIc1VVcGNSTHVa?=
 =?utf-8?B?Nk84SmliSmM3NUw3SXorU0RVckt5azhaZ3JrcEtwWkk2OHJxSmV0cExsUllo?=
 =?utf-8?B?NW82SU9kTWJML0JKMit6NXdPeGNKVXZidDltMDFVcEJZSHp5ZnkrNExoWEIv?=
 =?utf-8?B?elVzOUNLMnIyUzF2Y3J0WGNLZzBKUkNHTGt5eUpLaS92UEd5dUdOZmtzZURp?=
 =?utf-8?B?bStqU3RpWjg5czlIR1hPT2VJVzZwNzBzNjhUSFM5ZXIrQXhiZXYwUDhJRzYx?=
 =?utf-8?B?cnNaYWU2ZFBmNVFYbXpFQ1Y0N0x5TkNQTS9RejgrMTZPdEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlFScnh6WjlmeUtJMXRlME5Ta2VJY2JoVENFNlUzRWFaazl5cStDazAxenM2?=
 =?utf-8?B?cGNpTldIRHhSaEFsbnJaOFlKdzVQRXlzbjNoOHdjZGN3S0x2QjVLN2pVQzNm?=
 =?utf-8?B?SWdLaTZ3b283UDcxbnBpQlEyTmFPYmlYdWRQeXpWZzlBNFhtMURHT1BSRjF5?=
 =?utf-8?B?ODQyMzk5MFhvMmdjNlBWVFJtMGFpemRGazNEZjV5bmJQYi9XeFozdHU0MFJw?=
 =?utf-8?B?ZnQyK2V1b0FuWnN6TDJoNXJjcWZ2cU12clE0eHVDbnZmSHJZVGppdHBlZlFs?=
 =?utf-8?B?ZUIzbWdyUE9NREYreWxxT2FkRUUwNjNoSVdCU3lqaVNkT1dneExBWEQ1TXBP?=
 =?utf-8?B?TEtUcXliU3hOWHNKSHRwaVBsU0pOaFVOYU9LTEh1dkZWdDY2SU1wR2k5WC9u?=
 =?utf-8?B?cU9OTjlWWklEV2dPYmZZUHQ2U3o5akRCQkhQbmlqZnN6Si8zQ0dUYWRCdVZC?=
 =?utf-8?B?QWJkYkdlTXhodysvT0c0VkdxaDRVVk0zNktqanhQZEJLQ2JQTVl5MW82aTYw?=
 =?utf-8?B?Q2RaQ3VveUdudllSdHk1bGtpY2VTVi9JejRjRERNMUNqUnB6Yk15WEZ5ZkJ4?=
 =?utf-8?B?THNTTndweFppK1ZSNmZIQnJaUjM1UWJiRVgxdXd2dldkRHROdGVXTW1sY2Mr?=
 =?utf-8?B?ZnIwTi9JMC9ZQ2JUT3pmaXpsZktvSk1CS0VYbW5lemp1TE5FQmNVSEt3ZG5z?=
 =?utf-8?B?a3dHWTdOSlRpS2NJUU0vWkttL3NzbXUzcnlhcUgwQ3RzZi9xQzBid1lydFN0?=
 =?utf-8?B?WUZFKzFzV00vQlhnQUJ6RE0rMmhNQnYyRys2UVRyRTRvcEJjelZNVGFmR3ZG?=
 =?utf-8?B?RURGTTFxamtORmtnYmhrOWN0bW1PUVRxandvUGhRcVhqU0pYNHRLaFRpRGV2?=
 =?utf-8?B?cXAyU0J2eUxOcTBVRXVKV3RHSlhNeWhKZ3lMUFRBRTF6R0tSR1BncmlYc01V?=
 =?utf-8?B?ZjJ2M29QY3VYQzNwNlFoc1ljc2pMRHpENTFjL3lCVWtYWUl4UU52dFo5YUNN?=
 =?utf-8?B?RW5XUG42ekpxWDdqdE1jNTRBc3pTakhLcUZmNFJoQjBjdVUvcTRYZlFsL1FF?=
 =?utf-8?B?cG80WXNpQjVvcVF1RGU1dWhWakJMNml0d1hkT0RrYngvTFdtZkgwNXJiNExt?=
 =?utf-8?B?TFVlVUJnTjczV2VrcWNVYnIweWZpMllKd2lBUk1qS1RCSU04aHkyc2dveFFQ?=
 =?utf-8?B?am9TZFpFYktrYlJDT3pzeEJTeDJlSXgvTkdQWHZlZFBTTWltcTJaZW9EK3JD?=
 =?utf-8?B?OUIrazFQaXNVSWhCdkFtSU4rUkhWZFV3d3owK1piYThLUHZVYU85SE5GSUVM?=
 =?utf-8?B?Nm9VRmNIWHRoYk5CenRrM1A0aDM4cklmNnF4L0ZJcldERGRTUlhxVldhOWs0?=
 =?utf-8?B?eGI2MUhIM0JoMHl1cmdnZVpuUDlEeXlQTTNmc3B1am81NXMvMHg0ZVltNUpI?=
 =?utf-8?B?dVNtSkxjMTZSMnJiNHJ6cHJKUDlYK0xsSXpBZzkxUGEzM1cvbnN0blBGaDBM?=
 =?utf-8?B?aFVrUUJJV3VqY3RMeVNRQ2dCeFhyTG9ZVTh3eURDSUpUUldIQnhEK29ITlM0?=
 =?utf-8?B?VVlSYjRvTVpvTERZYXdxS3BIaHJBazdCMkQ4QXlEeUtqUVhtQnNYOG9kZFVl?=
 =?utf-8?B?OHVpS1IwV3NZMVl1R1F0ekRnRkwvQVBXaXVMbnA0ZXVXTGUvdUdpOGMwZ3NX?=
 =?utf-8?B?b3JYd2F3M1VkTFFaTmo3S2NWSW9kT0RyM0lTdE1xU2RiN202QVFBcDFhWHJ3?=
 =?utf-8?B?cndvMkRCZXNRRmFLaVJSR2NBOEVHbklKU3h1MjRBM3R1RDJnWHJqekl0V3Fr?=
 =?utf-8?B?b1g4S2tablk1YldJbjMrUW5YZmdEZENNS0NqS3BtaTBnZmh4UlJVV0EwL0VX?=
 =?utf-8?B?bENjSUV3RlRSYytURE5EcE5HWDBFdEtyU0ZXRHN4QmZPZlhva09qNkNOYko0?=
 =?utf-8?B?QU5LR1ljQllRMENYMWk0UnUrRGFoemRZODEzNnQvNUZOYTdCMCt3YlRiekVY?=
 =?utf-8?B?WEZnV2drc3R5cmcvWVhNQ0dRLzFIazlOQ3dEc3lnVERkUkpyZmtGTTdaLzFD?=
 =?utf-8?B?RmZWc25QRTdPTlBRZjZkV2NrbWtLOExFbVlHZk5uNmJLYjhaazMzNUpZdE44?=
 =?utf-8?Q?u8WZOkx6ZYG7XLCxdOdpIQgaT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0ebfccd-3b3a-4a27-3894-08de06736432
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 14:03:00.7964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GR0fWqFYg6zI0jOhBBs4qRnRZoEPBhP9RTVBHUCt/THIWPo5Z7mveERV9bWOqwK2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6528
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

On 08.10.25 15:50, Tvrtko Ursulin wrote:
> 
> On 08/10/2025 13:35, Christian König wrote:
>> On 08.10.25 13:53, Tvrtko Ursulin wrote:
>>> Disclaimer:
>>> Please note that as this series includes a patch which touches a good number of
>>> drivers I will only copy everyone in the cover letter and the respective patch.
>>> Assumption is people are subscribed to dri-devel so can look at the whole series
>>> there. I know someone is bound to complain for both the case when everyone is
>>> copied on everything for getting too much email, and also for this other case.
>>> So please be flexible.
>>>
>>> Description:
>>>
>>> All drivers which use the TTM pool allocator end up requesting large order
>>> allocations when allocating large buffers. Those can be slow due memory pressure
>>> and so add latency to buffer creation. But there is often also a size limit
>>> above which contiguous blocks do not bring any performance benefits. This series
>>> allows drivers to say when it is okay for the TTM to try a bit less hard.
>>>
>>> We do this by allowing drivers to specify this cut off point when creating the
>>> TTM device and pools. Allocations above this size will skip direct reclaim so
>>> under memory pressure worst case latency will improve. Background reclaim is
>>> still kicked off and both before and after the memory pressure all the TTM pool
>>> buckets remain to be used as they are today.
>>>
>>> This is especially interesting if someone has configured MAX_PAGE_ORDER to
>>> higher than the default. And even with the default, with amdgpu for example,
>>> the last patch in the series makes use of the new feature by telling TTM that
>>> above 2MiB we do not expect performance benefits. Which makes TTM not try direct
>>> reclaim for the top bucket (4MiB).
>>>
>>> End result is TTM drivers become a tiny bit nicer mm citizens and users benefit
>>> from better worst case buffer creation latencies. As a side benefit we get rid
>>> of two instances of those often very unreadable mutliple nameless booleans
>>> function signatures.
>>>
>>> If this sounds interesting and gets merge the invidual drivers can follow up
>>> with patches configuring their thresholds.
>>>
>>> v2:
>>>   * Christian suggested to pass in the new data by changing the function signatures.
>>>
>>> v3:
>>>   * Moved ttm pool helpers into new ttm_pool_internal.h. (Christian)
>>
>> Patch #3 is Acked-by: Christian König <christian.koenig@amd.com>.
>>
>> The rest is Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Thank you!
> 
> So I think now I need acks to merge via drm-misc for all the drivers which have their own trees. Which seems to be just xe.

I think you should ping the XE guys for their opinion, but since there shouldn't be any functional change for them you can probably go ahead and merge the patches to drm-misc-next when there is no reply in time.

> Also interesting for other drivers is that when this lands folks can start passing in their "max size which leads to performance gains" via TTM_POOL_BENEFICIAL_ORDER and get the worst case allocation latency improvements.

Yeah, as said before if any other driver says they don't need this behavior we should certainly add something.

> I am thinking xe also maxes out at 2MiB pages, for others I don't know.

For AMDGPU it can actually be that this changes on future HW generations, so having it configurable is certainly the right approach.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>> v1 thread:
>>> https://lore.kernel.org/dri-devel/20250919131127.90932-1-tvrtko.ursulin@igalia.com/
>>>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>> Cc: Dave Airlie <airlied@redhat.com>
>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Lyude Paul <lyude@redhat.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Sui Jingfeng <suijingfeng@loongson.cn>
>>> Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Zack Rusin <zack.rusin@broadcom.com>
>>>
>>> Tvrtko Ursulin (5):
>>>    drm/ttm: Add getter for some pool properties
>>>    drm/ttm: Replace multiple booleans with flags in pool init
>>>    drm/ttm: Replace multiple booleans with flags in device init
>>>    drm/ttm: Allow drivers to specify maximum beneficial TTM pool size
>>>    drm/amdgpu: Configure max beneficial TTM pool allocation order
>>>
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  7 +--
>>>   drivers/gpu/drm/drm_gem_vram_helper.c         |  2 +-
>>>   drivers/gpu/drm/i915/intel_region_ttm.c       |  2 +-
>>>   drivers/gpu/drm/loongson/lsdc_ttm.c           |  2 +-
>>>   drivers/gpu/drm/nouveau/nouveau_ttm.c         |  4 +-
>>>   drivers/gpu/drm/qxl/qxl_ttm.c                 |  2 +-
>>>   drivers/gpu/drm/radeon/radeon_ttm.c           |  4 +-
>>>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 16 +++----
>>>   .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |  2 +-
>>>   drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 31 +++++--------
>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 22 ++++-----
>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  7 +--
>>>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 23 +++++-----
>>>   drivers/gpu/drm/ttm/ttm_device.c              |  7 ++-
>>>   drivers/gpu/drm/ttm/ttm_pool.c                | 45 +++++++++++--------
>>>   drivers/gpu/drm/ttm/ttm_pool_internal.h       | 24 ++++++++++
>>>   drivers/gpu/drm/ttm/ttm_tt.c                  | 10 +++--
>>>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  4 +-
>>>   drivers/gpu/drm/xe/xe_device.c                |  2 +-
>>>   include/drm/ttm/ttm_device.h                  |  2 +-
>>>   include/drm/ttm/ttm_pool.h                    | 13 +++---
>>>   21 files changed, 125 insertions(+), 106 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/ttm/ttm_pool_internal.h
>>>
>>
> 

