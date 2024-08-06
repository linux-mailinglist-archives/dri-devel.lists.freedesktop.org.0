Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D86FA9491C2
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 15:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4CE10E370;
	Tue,  6 Aug 2024 13:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1350 seconds by postgrey-1.36 at gabe;
 Tue, 06 Aug 2024 13:40:14 UTC
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFDB10E0EB;
 Tue,  6 Aug 2024 13:40:14 +0000 (UTC)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4765CuPc022240;
 Tue, 6 Aug 2024 13:17:38 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40s9ry2twu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Aug 2024 13:17:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qY/IaGr6pTf/tH7zAt9NfpUP/JbJMFml3Fs8/E/4iFTcMZj+x5HXhozzvnMWOH97C6s5akr4zGbz7QeBjFSZR9C4rEszLLnn7KuLTjKMV3hMck6r4f01zkVUl2niWiYxfJoZokDvepX/8wz2/D1kV4KKnw0xi4khan3ed9FjPLCp6GRgWuTNnz/5GtErIvkn38U3aOk7mZ2j0oRnYAEcXUG+/tyhVuL/ctCwwxcNE7hSDIqsXBBZSwsU3Egocjgr3wAbA28Y0SrrOgKDO4+qeEs8Sl05G9LRnGgozmg0MOLjT33e9aqs6tvP4PrqFtPD8F3LZD6i1uzL/gvY3LpGnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAnpTr3eByMl2NzivtUSwZsPMIGBmtCzcDfPenBCEMU=;
 b=Ih89n4O0QK3pXk9I312gu3LL7EJyfY5xBeUQB2WlVdLQU6Rv4F34jRL3mCIDTDTo2K0HEvSLKLDtELV88ivRKf2mt5I3DwuN11D5PmztFs8451b+1DqJILelEfhVb7KZKCD1lNk/3amZg61ZS7Iil7/o9hqNy9BTj9mvYk88xaCZegK3eip/4VkRY1mSV4vuAF7ak/xRPGw/uypIOofK3UNIgH+u3Vem3TgmPSVgzg32JWfu2NomUyot7xknZuxN0SKHM8ZOHLFv2UKgypemQ+tz6v4KJCOiM/QjTvNgyIXuYEprbHYyho30By8RKMntvwElYkyux6oHHla6qah0VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by LV8PR11MB8512.namprd11.prod.outlook.com (2603:10b6:408:1e7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Tue, 6 Aug
 2024 13:17:35 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%6]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 13:17:34 +0000
Message-ID: <1d145674-b696-4193-81f8-baeb59c3dd09@windriver.com>
Date: Wed, 7 Aug 2024 00:17:25 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/etnaviv: Remove GFP_HIGHUSER in systems with 32
 address limits
To: Lucas Stach <l.stach@pengutronix.de>, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, airlied@gmail.com, daniel@ffwll.ch
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240806104733.2018783-1-xiaolei.wang@windriver.com>
 <8040eb85dbdef646a3373ef4602a9614f2d468c1.camel@pengutronix.de>
Content-Language: en-US
From: wang xiaolei <xiaolei.wang@windriver.com>
In-Reply-To: <8040eb85dbdef646a3373ef4602a9614f2d468c1.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0182.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::20) To MW5PR11MB5764.namprd11.prod.outlook.com
 (2603:10b6:303:197::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|LV8PR11MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d58ca5b-b300-4c0d-6de3-08dcb61a2255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWRZTTV0YlhCQmtJY0FzQWlIT1lkb0VXd0hiMUdYeUpyVytHUitmc0ZNQTZn?=
 =?utf-8?B?Yy9HVWZqdTFic1FJV3BVb2NSeFNpY2kvTXJRTzNwMXQ1WjdhN0didHFOZkk2?=
 =?utf-8?B?ZnRDeWxLMGpmY2t6OXc1bHRIZCtiVHhLS0oyWlIwYXJZSEZlWmdaelIzUzJr?=
 =?utf-8?B?c0FqSG42UnNtZlRlRm13ZVVXNWdkYUlSUkt1QkdHRlpDc0J0QkxXR211MTVs?=
 =?utf-8?B?NU1XbXl2VVFYUHZPZGJvenA3Z1JXUXZ2VzNjVTVPcmlMc0Z4RmhXWEw3MXBh?=
 =?utf-8?B?RmhxSEZOa29ueFBaeG1hMU5hemFnbW1NU2ZJd1ZyV1p3SmlXUlcxbHdCcGZz?=
 =?utf-8?B?L1l5YmsxczRlZWdkRG9WOWlJdlVxdlNJL3JHa2hLQXc1V0IrVVVlYXVtSU9h?=
 =?utf-8?B?NUtpKzRCNmJDbHVLcm9IeFljSHN0a3RBQnhsNWgraWt6T2FKc1NOU3h0Skh0?=
 =?utf-8?B?UnNTSUs5T0NTSVd3N1gwREVMbi90dlNodXNha0NKU1NiaXlSVGFURGgyd1Iz?=
 =?utf-8?B?b2FvMjh4ZER4d0dkWTNTdmd2YTlaR3NHUzMzbnBxc3dtYzNNT1J3N2RVOE8z?=
 =?utf-8?B?YmdIbXRWOHpYQ3p4eDFhRWxBZmdSNkkrbGlmeWdCancwVnhKdXJaV0xxdzBp?=
 =?utf-8?B?T0lvUXNRRzkvZm52ZjExd3FmNnhkclhTQlNNTGF5K0ZaalB6YWlxd0RmNU5U?=
 =?utf-8?B?LzVrZVo0aHVWMHZ3K1FrOVFKQ0NzLzlUc1ZjMHZ0UlRSVmJDeElDbU95amZt?=
 =?utf-8?B?L2tXVFhvRVFBRFFiTmE2T3YrYVVLRnQvbDVqb05FNVE4R3A5anN4UjJpYWhU?=
 =?utf-8?B?NmlaQkcrWVhkK3VyeVhQdTlUazBvNzVieFl4WVlQV3h6YmJ4dllXR3FjN2tI?=
 =?utf-8?B?a0Y3VzAvTHIrOXJDa2wxa0R6dnFPRmc3RVJ2NTZTdkx2djV2dkZkSFRQUjVR?=
 =?utf-8?B?b1FpQ2VYd092clBIMVFVUVZDR3BQRHdpWUNvSmxVcldzTklvQUFBTUY0REFO?=
 =?utf-8?B?ME9SZkxodnliSUovYWphbUlkRHRrT3JNWHJtN09OL2hIMnJnN3l4bG1yNktE?=
 =?utf-8?B?WDVJU096R2pqZGJob3pIUU02T3R2d1lIV3FGUHlJWWpDc2JtbDlUanFTa1ZL?=
 =?utf-8?B?QnNLUk5BelpqV2ZBZEdtU2ZpZDAwMW93TzBGbHZ2NE03RWhIVi8vUmlYL3FB?=
 =?utf-8?B?eHE5MHVJakRPRGFHWDdZeWswaElCQ2xOcC9nbys4SGJESUV4UUlUZWRRZXJz?=
 =?utf-8?B?eUtnVDdtUVoybzdFencxbWw4STlmMm82aGM2MXEydWlkZndZUHVkUnJUdXQz?=
 =?utf-8?B?cDFhMUhGZXFxcHlTT2d1WUQ3aU9vT1ppbWhWRG1nOTF0ZGxKenQzendzbjRY?=
 =?utf-8?B?ZGp4Nk5lcXFoRXppcHdyYi9ldTVjME9xQ0lzeHFpTjRRR1VHS3JEdytBaXg4?=
 =?utf-8?B?bGJxNVV4TnY5c3NWVjRNOUdRei9QVjZla3FtVTJ0VnBPazI5ZzBPb1FRZm1W?=
 =?utf-8?B?eFdkVXlGYjhWU1JXeFRLVmlFdjFiSjhJNzR5K2pYUXo1aU9qcUNuQndFN011?=
 =?utf-8?B?WU1JcVNVRHVZYzdvQWoxVXNQNVpjQ20ydHQwQUlLV3dYZkI5bjVuOVZoS3l1?=
 =?utf-8?B?SUNzMkU5RE02QjJzMjZyQ3padktVSjJjR3FTTkE0U2s1VlBVS0Y0Si9Na1py?=
 =?utf-8?B?MHAwckxOM3pxdHZSTFBIK1E2L2F1cVJqZWhYUmRWbmt5bFhMcDJkaXdmVTQ4?=
 =?utf-8?B?N0JjNkR0NDRvK1MzRE1NdktNS1Z6V3grVnh5c2M4aThVUTZtVkpleVZPTWUx?=
 =?utf-8?B?RVh1dU9nV1Q1cXZpNXZIQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR11MB5764.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajdENGdnd1RWdmFZNUY4WHl3cVFzaUV1M05wWjhoZTZ5ZXRKVFd4QlNyU1dG?=
 =?utf-8?B?bjMzbUZUa2c3citLckR6T25OT003bFFYeHltUXFCcm1DZFZrbk1RVHBtOG1U?=
 =?utf-8?B?dEFmYU1RNFdBSWo2ZldHNE1UaTBweUhoNlZKMXdOYlREVndsVkxIaVJzTUo5?=
 =?utf-8?B?aVZTd1Y1RXRhZjR0aENYbXcxcFFKS2FvditMQlJMWGVsUkE2WDZVL3VaaDE5?=
 =?utf-8?B?WGdaQVhnQUk1NWo1MDh1UVpMVVA2VGtsQlMwS3VvU3RDU1FDM1hMWm9IZHlp?=
 =?utf-8?B?b1FSOEkySmRKVW9PWk5VTUhiZ3dUcVEreU0rL1IzMFZuVUR0WkdISlNmaGdC?=
 =?utf-8?B?cFRxMTgxZ0Nqc29IcklIZGZpc3VkNW11TFFCSEFUeWVzbU95VEw2eTY4cDVL?=
 =?utf-8?B?N2JtNXM3d3doM2ZpS1VTS1Fuc0k0cHZyOW9OVUFkc2ZZZXBWMWxrNmlIOEZv?=
 =?utf-8?B?YWl6VFJzdmZ0NVZqUTdxYml0QnUvVFd1OWhZQmo2dVEzN2pnWndiV3VXQVJz?=
 =?utf-8?B?NmI2aXk0emRRRXIzeXFkMjd3MHlaeVVtMWZ6WXB3ZC9scHp1UGY4N004dzEr?=
 =?utf-8?B?QU9JOFZLbXhIZVRlSlg3dkJ0dmxRc2x6OUo3YnlLd0wvL1NVMjRHMjVSeER0?=
 =?utf-8?B?RjB2SnhhM2p2S05oSUtEUDZGV3dPOVdBWmZ5MjdhT1dQK1g3YTRrYWV4bVZl?=
 =?utf-8?B?cHVNOXRxYWRXdlZNQjZHL1llMkd4d2gwUi9qd1RVcDhtYndtQ1FQMkx4VGtB?=
 =?utf-8?B?TjlVQ0Vpc0drVjRIdXZlSEVBMkgzeW50aStIN28zcE11OG9KVjJPbEFJY3FE?=
 =?utf-8?B?NWg3RFBGV0Y0bHlpNVZPa3BJa09BSFdkTjRBZzBWOUVwaWg3elhEMVdOYnFL?=
 =?utf-8?B?L0lvY1hTbURtcmdhMmdRRmVrTkZ4UXR2djQzenBwTGpiZWZYNjBXSTE1R2Qz?=
 =?utf-8?B?R3E5NmpZQkx0M0pUdjlSdUNUdHlDOUdMem1acGp1MEkwdURka2wwY1U0MnRP?=
 =?utf-8?B?MzlMbEdoM0NYSFFPc0pEaVBGUHp6NXB3VVhMTi9sTVFoUEQ0R295TUVoVmdj?=
 =?utf-8?B?VjlvQjZZNXg5bFQxTk5UTUV6RmYrYzJmNmNkNkl1d1lteGk3NmQxTFBlNWQy?=
 =?utf-8?B?SUorTXUybncrSVZYZFlRY0lOcnZsNWNZRmVTWmQzTzU5RUhDdVFBU09DTGx1?=
 =?utf-8?B?SUtWVlh4eSt3NDFkU21ZSUhUZUplWVVaK3E0emlkd2VlUXhEUzQrWjFVcGlw?=
 =?utf-8?B?NzRRc3hudWtCZWduZDlYN2RUT3E5MnU5VzFOSFZ4M3E4WllMQitvQmpmRjdv?=
 =?utf-8?B?WTJsVGdDVHZ2WGxqVDYyMUF1Z21mSUpESUc4TTBQaW53ekplTTg1WkdZMlVC?=
 =?utf-8?B?VzdoZjNLTXBXZ2V4cStCMUNpTk9CZ2xmVWVWc1F4QmZTUVhVd1MvNjRNZFRy?=
 =?utf-8?B?dldGcnE1T2psMUJhazlqVDA1c0RpaklLWnFFbFVPTUdFZWdKUFJqZkg5S1Az?=
 =?utf-8?B?MXZQbFRwb21RajFybWpSdENFT2JweGVvQS8zcEpLdmFtZnd3OGpNY0IwSm9y?=
 =?utf-8?B?bFpEcDlDVk43UHpIckhLZWI2TmVXQ1huQTB6dzRRNDd3SmpxakszZHp1dWZK?=
 =?utf-8?B?U3B1ekExWXJvTExENFFrR3Q0Q3hqU0hpd3M5OWk0WWNPWktDOG05bk4yd2Vq?=
 =?utf-8?B?WG5HTnd2dXJtMkpQbDFZcjNJcjdZMUIxSFFnejg3UXkvb0RDUUcrdTZtVUtq?=
 =?utf-8?B?QTNQZEV3TVpkN3dqdzNvZGZZK1REcmovNW5jbVlSR21LSEZxbWdGOEJjUk9C?=
 =?utf-8?B?N1l1MllMTy92dXcwak1ZSDZzaWN5cjh5K2NRVGt1amJ5VVdSaHNPMDl3WVcw?=
 =?utf-8?B?WXhzYk5ldmN1citKWUdNd0lyMDJGWElGekV1emFpUzMvU1FGNmpvYmdhbnRu?=
 =?utf-8?B?OElsUHVhNjZEVytDRm1xQmNmTE9TMVpZZkpNTXFtNitsbUV0VXpoZlU4YWhY?=
 =?utf-8?B?N1B5NVc1N3Z1aHZXZU5qc3pwVXk4UWVlbFFza2V6ZmVsMjh4Q0h6UEJGcHhI?=
 =?utf-8?B?cVVySmNBWU9qNXNEcURUc2s1b1Q0ZTJIMVJiUGVNTXZadmtoQ3V3UGVpTi9O?=
 =?utf-8?B?UXNuTnpGdzRvUkhMaks4VlhieUtpSmJYYUlPODdtc3l5ZEZzUEQvOCtxV1pH?=
 =?utf-8?B?N2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d58ca5b-b300-4c0d-6de3-08dcb61a2255
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 13:17:34.4335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kwEMnXl0szxI7wMXe1V7FuxpA88W6jnqoLq0T6iR5gtni4NV+0AHuw1yHc9Qm1FnopHfatozbmYY91MEhiferVGT3sW9OF1LyFz58LK5vFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8512
X-Proofpoint-ORIG-GUID: LXcmqeQ4hmzFWUkDezt8x7UyiL-tDs8D
X-Proofpoint-GUID: LXcmqeQ4hmzFWUkDezt8x7UyiL-tDs8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_11,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408060093
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


On 8/6/24 11:23 PM, Lucas Stach wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Xiaolei,
>
> Am Dienstag, dem 06.08.2024 um 18:47 +0800 schrieb Xiaolei Wang:
>> GFP_HIGHUSER is for userspace allocations that may be mapped
>> to userspace,An example may be a hardware allocation that maps
>> data directly into userspace but has no addressing limitations,
>> this conflicts with GFP_DMA32,The kernel reports a BUG:
>>
> GFP_HIGHUSER is a combination of GFP_USER | __GFP_HIGHMEM. Only the
> highmem part is incompatible with DMA32. You don't want to clear the
> GFP_USER bit here, as the driver allocated buffers might be mapped to
> userspace.

Yes, I will update the commit log in v2

thanks

xiaolei

>
> Regards,
> Lucas
>
>> kernel BUG at include/linux/gfp.h:139!
>> Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
>> Modules linked in:
>> Hardware name: NXP i.MX8MPlus EVK board (DT)
>> pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>   pc : __alloc_pages_noprof+0x5d8/0x72c
>>   lr : alloc_pages_mpol_noprof+0x100/0x4e0
>>   sp : ffffffc08c6a71c0
>>   x29: ffffffc08c6a71c0 x28: ffffffc086e46000 x27: ffffffc086e46a68
>>   x26: 1ffffff81122b260 x25: ffffffc089159304 x24: ffffff80da938000
>>   x23: 0000000000000000 x22: 0000000000000000 x21: ffffff80da938000
>>   x20: 1ffffff8118d4e46 x19: 0000000000146cc6 x18: 0000000000000000
>>   x17: ffffffc081b00980 x16: ffffffc081b002a8 x15: 1ffffff8118d4e56
>>   x14: 00000000f1f1f1f1 x13: 00000000f3f3f300 x12: 0000000000000000
>>   x11: ffffff80da9384c8 x10: ffffff80da938000 x9 : 00000000f2f2f200
>>   x8 : 0000000041b58ab3 x7 : 00000000f3000000 x6 : 00000000f3f3f3f3
>>   x5 : 1ffffff01b527005 x4 : 000000000000000c x3 : 0000000000000006
>>   x2 : 0000000000000000 x1 : 00000000000003a3 x0 : 0000000000000000
>>   Call trace:
>>    __alloc_pages_noprof+0x5d8/0x72c
>>    alloc_pages_mpol_noprof+0x100/0x4e0
>>    folio_alloc_mpol_noprof+0x18/0xb8
>>    shmem_alloc_folio+0x154/0x1a8
>>    shmem_alloc_and_add_folio+0x180/0xee8
>>    shmem_get_folio_gfp+0x660/0x103c
>>    shmem_read_folio_gfp+0x98/0x104
>>    drm_gem_get_pages+0x174/0x5ac
>>    etnaviv_gem_shmem_get_pages+0x18/0x5c
>>    etnaviv_gem_get_pages+0x100/0x328
>>    etnaviv_gem_cpu_prep+0x2e8/0x438
>>    etnaviv_ioctl_gem_cpu_prep+0xb0/0x1ac
>>    drm_ioctl_kernel+0x158/0x2c8
>>    drm_ioctl+0x494/0xb48
>>    __arm64_sys_ioctl+0x120/0x18c
>>    invoke_syscall+0x6c/0x25c
>>    el0_svc_common.constprop.0+0x174/0x278
>>    do_el0_svc+0x40/0x58
>>    el0_svc+0x50/0xc0
>>    el0t_64_sync_handler+0xc0/0xc4
>>    el0t_64_sync+0x190/0x194
>>   Code: 52800021 39003c01 d4210000 17ffff57 (d4210000)
>>
>> Fixes: b72af445cd38 ("drm/etnaviv: request pages from DMA32 zone when needed")
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> ---
>>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> index 7c7f97793ddd..c3f329226bed 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
>> @@ -844,8 +844,10 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
>>         * request pages for our SHM backend buffers from the DMA32 zone to
>>         * hopefully avoid performance killing SWIOTLB bounce buffering.
>>         */
>> -     if (dma_addressing_limited(gpu->dev))
>> -             priv->shm_gfp_mask |= GFP_DMA32;
>> +     if (dma_addressing_limited(gpu->dev)) {
>> +             priv->shm_gfp_mask |= GFP_DMA32 & GFP_USER;
>> +             priv->shm_gfp_mask &= ~GFP_HIGHUSER;
>> +     }
>>
>>        /* Create buffer: */
>>        ret = etnaviv_cmdbuf_init(priv->cmdbuf_suballoc, &gpu->buffer,
