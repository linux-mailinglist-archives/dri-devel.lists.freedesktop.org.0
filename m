Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B75A7B28D70
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 13:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAC710E00B;
	Sat, 16 Aug 2025 11:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="SYSAjJcB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013051.outbound.protection.outlook.com
 [40.107.44.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6131010E00B
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 11:31:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGY2VG95XMFo8Vcq5gvka0MYAY9JX5UQ7DvrpiOMoQ8eCucYRdDXK2GeQkkKpbZ2zhvfVFLNmlPyk/ERbQBuTVtZ16m2V6Rc3fvkp1E1BGIO+1p+wJfyULRMQbQIs0kc92cunvDwLoK3USun23rnWSJHHykMNwM5th2UIVT3c9deq5ADICOSK9X3llDPex7yuwZX7eT+zRNwcKBZviMLYhKwaltYalQlb59UmxsL95beScMX1nDMMQ5FGmkcdMcq9Wywz+gjSNOK4R5XnfT6qWM4zECu/vI8suXeq51gp5SRaYwDnKIaXgMG1mUqhhCXLRlECEi0TL/7+PtliOzZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hdcAdtIyzLU0jyrK0/BRQDdAzex7dz8NpmxSXK5pKO0=;
 b=jaGIUwCKuiIv8tL9i4X7RqUn/jiRj6UDVYWOeCqdduCVzAEShGF8K4KwFf5DVQb+32KK5jR//50JqOqn+G6hhV8CYyCZw7lI2qaIHDa8vyv4mOe6GFWnLFRfd6Vj524HvuePIcVE6Yh7t/7LI54V5FgICMQi8FDUJVYuSOIyqFm1wIritvkIOHlrfxduFGbfna3sQOyxXjXNLJuvbwdd8kTnYVemcMd+dpCzkTa+pK+HZE8hwCPGCYXkfdSOCVlpjyxyZC/0JkuHxYBKKOGye22HcQxyoP60fsJDPzClO8E7UH2kt/nwPqF8Y+WYfYh1Ux7lAWusRsmxco0LeBzEyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdcAdtIyzLU0jyrK0/BRQDdAzex7dz8NpmxSXK5pKO0=;
 b=SYSAjJcBpEPGUKtSuasOuaNqVMXG58Fy5vDxqRJ6rHUj9suU6y+vi0U4c2qNCNNmGtNav2aAig7oRNu++fTw/RBRv6VYafsc+QlV/d8c/sQ1CXIUvusessV5Ab9QiucKq4ipL21MGMMXd71NnL3k4fd42lV49jC+G7m1CK6gZ+cVvLU8UyKeQLD53uQhJQqygtYOfbueMK+UsuV1JwZaTqdUFnqBZK/T9qXGElXw/ksqv2eWjjTh9d+F0xWqsmjL2wbFPP0yKvKYz2dibdreQZZ0dJ6pfn5RqisR9HOhWj8tIecMvrpWRenfuk0CljbE3i59Bg+hRe+mxeIv5THN6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEZPR06MB7175.apcprd06.prod.outlook.com (2603:1096:101:22a::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.19; Sat, 16 Aug 2025 11:31:04 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9031.018; Sat, 16 Aug 2025
 11:31:04 +0000
Message-ID: <0f33e6aa-56ed-4dfb-8959-3d6ea769e3cd@vivo.com>
Date: Sat, 16 Aug 2025 19:31:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/habanalabs: fix mismatched alloc/free for kvcalloc()
Content-Language: en-US
To: Lukas Wunner <lukas@wunner.de>
Cc: Yaron Avizrat <yaron.avizrat@intel.com>, Oded Gabbay
 <ogabbay@kernel.org>, Farah Kassabri <fkassabri@habana.ai>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Koby Elbaz <koby.elbaz@intel.com>,
 Konstantin Sinyuk <konstantin.sinyuk@intel.com>
References: <20250808085530.233737-1-rongqianfeng@vivo.com>
 <aKBmMU0_e2tGwCHT@wunner.de>
From: Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <aKBmMU0_e2tGwCHT@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEZPR06MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ac47e54-58ee-49bc-630a-08dddcb8623c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1UwYStYWmRnVFVZTzVjUEVNY0hlbFZrWkFZWGVEOEo5YlNxeTB5b1VPeUZX?=
 =?utf-8?B?UTlvYklsYTR1Um8xQXBNN0JQY1RqZ2tKamFVVklDcUhHVm9nbWFGQ0NkajZi?=
 =?utf-8?B?M3UzdEVxalRCdWZVb3ROS1lkNlk5UmlrZ1NZNGZHK1F2bkc0aTlPUHR2Q2hP?=
 =?utf-8?B?OFA0QTlYbS9DeVc2YTBpQVRjZkZZUk5MaVBXQWVVbDRhSGRnaDd5TC9wVU15?=
 =?utf-8?B?ODJmdnBzU3VPc2V2M3VlWXZuNWcwOFdmWmVIeHZHZmppV0dOZUV6d2llbi9Q?=
 =?utf-8?B?RkpGZnNEV0VuTmg5UkFIUVcvZ3JqSXpUbng2NFFxZ1JjU09iZVNvSjhDTytP?=
 =?utf-8?B?THlpayswYnZMMUd3QXVzN2lmMXEzdmppZnJ4THR6VWdKSTEvV3hrQTlCVWs0?=
 =?utf-8?B?d3NENW1UN2owZzBWS1pPTHkvVTF5YUVicWgwNVpxam9VV2ZYT2M1c0NMYjYy?=
 =?utf-8?B?dkRhZUltY3NWS3pxR1NDNTBWMWdLZ21IbzFQNWpJcTRkZDgxcmJ2b1FNT2R4?=
 =?utf-8?B?QVhpMFk2L01hNTJkdVBTUWNTRy80eUxxV3hMKzI3T0R1VHFuWDkzdDV1MjRz?=
 =?utf-8?B?bmVsNlp5VkdxcVlzdVRNc0xINlo2cE5GekUvN1c2b3Bob2JqSFdQMjNySm9z?=
 =?utf-8?B?d0xKZ05uOTMrZUVJN3U2czhSelNvcktFVHQzSDhxbzdQS0N0RHExZEl4d0l4?=
 =?utf-8?B?Y1BBeFQxemtGeTVSZXFHODdIOE1wTGZEMTdqMVl3dWkwNFdodjlyQ0FCTSsy?=
 =?utf-8?B?T1czOUdra3VxQ2ZpY0V1eTUrOHB0eDNWZC9uWXpIa1c2UDAxakpMSTg2NlB0?=
 =?utf-8?B?djFtSnI4UXJZUjVTcTA4dGVQcERQZ1U1VGhnMnNhS0c1NWtkd2VFcXBTSGxv?=
 =?utf-8?B?RXh3dTViWXZZT0NuRG5BeVlLazdyVVZuTkZMZ0xOVE96R1Y4cGtCVFoxY0FU?=
 =?utf-8?B?TlV0VXlrTEJMd3UrQ2psMmFYYkt5YWJkV3JaQU5LNy91cW9zalNKN3ptRkdj?=
 =?utf-8?B?SW5xK0NCV2lsTzRIcTlpS3V0MkNoTCtkNjIyRHFzZDZGMHc2cEQzYXF5aHN1?=
 =?utf-8?B?c2tQZmQwYlBqZnY2aU5Wa1UwanBpVkRUNVgxY0FQWCtWZGY5WHRsZkxCSnJZ?=
 =?utf-8?B?dXM0TnZJNHdPdk1KWDRlOFpxZVZncTZOZG11Y0RoUlNtRWE1MTByOGtoQnhy?=
 =?utf-8?B?c2w5dWtEVGM3M1MrQjdKY2hoVjRWaHh4QUxmZ1YxKzR0MXRJRmpzMkUrU2RM?=
 =?utf-8?B?aG9ET3B4OGlzQXFUU3l5c2NzNzZSNlMzOXZ2YldMZmcvQzZqQ1FJcmdsMy9x?=
 =?utf-8?B?WWFUelQ2cEF6K1poMUZlTkc1dG5QY0xKMnBrZGM1N2dleUVHNERlTUIwaTBV?=
 =?utf-8?B?MEY5bHJmelJxZTBFNk5HK0Jzd3lBNlFKM25MMzgvWG9EY29zR1MzQ2ZINUVt?=
 =?utf-8?B?dHNSbUJXZDd3cGNscFdIcW9rbXNqMjQ5UXNIYWdicDFBdnQ3SjdaVEtFTWU3?=
 =?utf-8?B?a3lxcUZrWll4Kzc0aGhVYlg4NkRmazhRYlo4V3UxTDV0YWRpZkN2ais1eit4?=
 =?utf-8?B?aEROWExoM3V5QmQ1L0VTUWdjYXUwRmxPYUU2OTNEcmhVQlhnSlpmUUp2YUxV?=
 =?utf-8?B?WXVUUy80OFNLU0pZRWVHbnRNRnNFbWFxNElJa2duUVZ6S3Fnek9MODRqeThp?=
 =?utf-8?B?MDBRcTNxNktxZG9LaGgzUGZQS0l1d1VPREg2TUU2WkQwTUlOcHNTdmE0VlE5?=
 =?utf-8?B?TGdpOW5xbmltelZQbit1TkdaL1dmQ2xhRm5sK0N0cXBMcTdjeWpwUVdoS0FL?=
 =?utf-8?Q?YKi+wwS/E8Od1R89jWmUKoJKCJBN4mP57L2tM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE9JY2hWUmx6TDFSTGFVWnllc3VtZXFwcVRHcFhtMURkZHo1SUFsS0tPR0py?=
 =?utf-8?B?QTVocW1JZm1qUHpVZ1JadERmNE5lZTc0ekhlV0FVNStCdXBoZjdDQStqaXFz?=
 =?utf-8?B?QVQ3ZGJWTWk1RFRWLzJCMDI0SkhtK2thKzRLUm5BdDZFTWhXVldQSWZDVjdN?=
 =?utf-8?B?djNCallCOUliSEtXUU5oT2MyWWNXbUErT3NvQTRON2MySGl1YTZyaWcvbW04?=
 =?utf-8?B?TFdvaWhNVE9vTUx0TEFtejM0MFl4ZEpqempkdm1sdllNTmJmRDcrVW5tZTJ6?=
 =?utf-8?B?NWxMd1RyWEVoZFhLb2pISDNqU3hualVYWHpuN3ZIMEtYQXpMWEkvMFpPM3R0?=
 =?utf-8?B?eFdzbDg4a2ZDS3kvVjlYQjQ0eFZLbm1oZWZmM3MyRG1tWXpkK3gyZEliTUpW?=
 =?utf-8?B?c0MrUFh6MkJENlA5RHNMSEdMeEVhcUNqNFZlTHJvUEtNM3hkY1lVMlZNVE9I?=
 =?utf-8?B?dXBWMFAyVzd4VFhBcm9yMW01ejYxcHpPQlFiYjhKQ3ZuNUM2ZUlnenlRbDlG?=
 =?utf-8?B?L3Fwb1BiMGs1cGR4Rnc4eTRLRzBFVVIwbHhITFFKRHQ3SEJ6Q0IwNWIxREh5?=
 =?utf-8?B?VGJPTDVSdVdKMGRxc3htaWJRWCtlWW11aC9hZDhvc1RNUTliN05FeUREOXE4?=
 =?utf-8?B?STBtMGVPR0pjL0FxSjZrLzZlVmJCeGZ6NUplTmM5ZVR3a3hzSXEzUUlGT1E3?=
 =?utf-8?B?T29wd2FSY05EYjMza0kzYzlDVndUR2daUCtBL3lsS2lRa1dnU1Z2TDBZeExi?=
 =?utf-8?B?Wm9GMk5pVmxPRkM5NVJROFplbHhrSGpUOVpCUmVZcnUxQnZFN0VRUERITkpF?=
 =?utf-8?B?bmFvaXFFTjhJUXNVVmNZVEdwZittWlNmYXdGMzFocVAyYnFEWHdvaDR6bFFU?=
 =?utf-8?B?Sy9sTzM2L1dUSjR0Zys3eVV2NVFBSEJkRThmQm1pMWJPOGVEM2Z5cllrYy8y?=
 =?utf-8?B?dUl1VzQ2THJBaDhSQUdnQkZIYk9IVFk5TXFYZ3RHa1lYM1NuV0hpbnFUK09r?=
 =?utf-8?B?QXJjMm5DU1ZKcDR2MmxDM2h6dHRGSXlCQUNrZGJ1OFFFNklXYktuL1cwTk00?=
 =?utf-8?B?eW1La2x1L3lSNXVnMDV0bnNxME1LMENJZm4xUmdtUEJpQUVQQVExT1lPV3JP?=
 =?utf-8?B?eSsxWGtvcURqQmNucDhlRXAwWENrNG5pYWc3WkpRWm9QSkwweURTTVZpMGpZ?=
 =?utf-8?B?YXNzdVdwTTk0VDRYN0FHRUdTUitBNkt2SXlTdVVmcGxqZEQyR1JtTTFtL1pD?=
 =?utf-8?B?RGZhOTg1NGhXVmE1a2NEZDlxbTc5Y28rNnVMNDV4TERVb2FKMVR2b1BqR2tQ?=
 =?utf-8?B?UUcwMkQyN3ZvdExrTWVWNEk2Snh1UzVzL1NJYzdHR3FQV1VNNS8vSS96VCtq?=
 =?utf-8?B?VHdqdy9oOE1rQysxV0lnUkE3R3pyV0VWNDhrdTZML0Zwc0ZkZk1EaklPcXJJ?=
 =?utf-8?B?SHh1NkU5UHdka0dKdkUvUkdWRDFUVmlKZGtJUnpMY1lubCs4L3pjTk90UXZn?=
 =?utf-8?B?WUFqYzluZTd0dkJ3eVhOQytBZnpPdkQxMkJKSXVMTTViWG9hN3h3Z0cwck94?=
 =?utf-8?B?elhwUlI5ZDBTVUpzOHVUb2Y2ek52NWxoMEZoTHZiWWRMK3o0REZvYTFYbU9M?=
 =?utf-8?B?VnFwNi9xYlBrRXhvdFFCUmRKMFRjU3NDbGNFenRhY2h0VEFyMmpTMWZwQ29j?=
 =?utf-8?B?dVFkcktNeHZGQzhNdko4MFRpei9lZ0lWTldkVFk4YzROanZJeUxsMktKR3NT?=
 =?utf-8?B?RTc0OXdiQ3BSU3hMS1NZUUNZZGdwamtVcldFTVNiR0NlTWI3U2dlNElKT3Q4?=
 =?utf-8?B?a2orMiswYndmOU9Ta2YybEhIaVoyWWcvWnZlSHdWMklTYThyQzY2SThmN09Y?=
 =?utf-8?B?bVVjQ1NDdzlCNW5oN010b0FkRlhlRGJZNXFiMWFSY056bHVSSnFMdXhBYysv?=
 =?utf-8?B?UTR2dVIxamUwcjREZ3FnL1FGc25PVTNhaGE0UVRHallVU0NkRExEakFFWE9n?=
 =?utf-8?B?elVhaDRmYk44aGJySmdDWEJZRWVYbFR5ZE5yTTVCRHFwL21Rb3I2NXc0ay8v?=
 =?utf-8?B?WkYvM0d5cnoyQ1dHODU4TjcrdW1BN1FLbm5iMTB5NUV5V1ZPRWx0MEdITEZZ?=
 =?utf-8?Q?2aEam/+hSyc3zMDd3xAAFomT6?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac47e54-58ee-49bc-630a-08dddcb8623c
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2025 11:31:03.8350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ilm4hXhcAaRyz+0vOd71GFYsFu7lSigjhjo5o2bXBWWoNq+MqV08zBQspXOEgfoinO2YZuDFLI2in+ts+JKbEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7175
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


在 2025/8/16 19:06, Lukas Wunner 写道:
> [You don't often get email from lukas@wunner.de. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> On Fri, Aug 08, 2025 at 04:55:27PM +0800, Qianfeng Rong wrote:
>> Replace kfree() with kvfree() for memory allocated by kvcalloc().
>>
>> Compile-tested only.
>>
>> Fixes: f728c17fc97a ("accel/habanalabs/gaudi2: move HMMU page tables to device memory")
>> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> Thorsten Blum submitted an identical patch a year earlier:
> https://patch.msgid.link/20240820231028.136126-1-thorsten.blum@toblux.com
>
> I've just applied his patch but added a Reported-by tag with your name to
> acknowledge your contribution.
it's ok, thanks.
>
> Thanks!
>
> Lukas
