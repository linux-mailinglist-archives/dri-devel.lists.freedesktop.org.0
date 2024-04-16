Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC438A609C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 03:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D2110EC4E;
	Tue, 16 Apr 2024 01:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="d/2m2YJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7319B10EC38;
 Tue, 16 Apr 2024 01:58:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReGr3vuJ0d5qHQySdUKgl1u90aK4KbEj3COrcgE9W/5U0Phm78ToB2PFnxMDbBm3nKOfZqBEHFPgGnRMqjOTL5wbq1y+Z9T8cSn7aLubfLMOKK+v3a/aXD2a/7LAq7CvSo0O30df3Hp5nci4uwFSiKYZKsQy8TztHxJGYTDslNxljqOAibTfV9M4PcHkU/sEfQj40k4QRXQpnSlbba1OF+oF7A5f2yWmoPZNAR6YezF3ed84gjcvcZC1B85gbHETqIJKYQidXuPnSzQHbLhOdjjWS617LP+0NNspibkqBz1yzk2kq6CsRmCwR/idFlScVNEk4BDBpWAoVP6He4O57g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9RjKYMhkZNASBefEEHqgtsvgwirSIFMxzy/5NArRhQ=;
 b=KvXAeRsqUsU34PXMjSw90CAKHWcQ3Cor4MsnRrr7Ow+jxlIwGA9FVhrwimbr3V6ab0bafhWqHbB7VosMKbV8EmZL1wrFDb1uvVYo7j6/Q21uSdIV40Rsaqu7wBa0hoIkVcOs/eN7wYeypAHA1pjl7NQS3rLCqP2nTA80EgaRmPoH2FCnr75hv4VizQsu/PjzSQM6E4fBdSJWlJP73vvFrdf/Nsvm6Nc9U2JZ26FBwzxPeAqnA4dF0ed+NMu3KgoSMHST/gh3biLDBRzu4ihNEPQgMeSkL4T5ckrIL18ktQVeg6Ez6KCHjZsSR0LU9KsQ+m3ApnDlD5P2b0sRWRbMTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9RjKYMhkZNASBefEEHqgtsvgwirSIFMxzy/5NArRhQ=;
 b=d/2m2YJMQVgmmAi004EcVyCRhXJ797awm0l69QPvDDzK/J7LEQMJNucWgtmkfyJVRfs7To2unMBonK9gfk8b8iweMeorsR93aA5bKk5l0cMxRTOFJ15uR1mNhcy/Z60w2v+BVEkpq7nRJC7eu/SBolNH34RuM/ekaEYidrk5bNo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM4PR12MB5985.namprd12.prod.outlook.com (2603:10b6:8:68::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Tue, 16 Apr
 2024 01:58:36 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::d895:b707:1189:dfd7]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::d895:b707:1189:dfd7%3]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 01:58:36 +0000
Message-ID: <26d0c683-88d5-432d-9fc1-2caa74793ba1@amd.com>
Date: Mon, 15 Apr 2024 21:58:33 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdkfd: fix NULL pointer dereference
To: vitaly.prosyak@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Cc: Christian Koenig <christian.koenig@amd.com>,
 Xiaogang Chen <xiaogang.chen@amd.com>
References: <20240413180706.232041-1-vitaly.prosyak@amd.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20240413180706.232041-1-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBP288CA0015.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::12) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM4PR12MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: 292545db-d109-420e-6e24-08dc5db8ba46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnova3JoQ0V5N1FKQ0JPcWNGNUt0ZGNPWC9DdGxpbmZKeHg5QVBmQTVaVzdY?=
 =?utf-8?B?QkJwdGRPZWt3RWptRkNpVUFIMktTZnZnSTZTM0ZkQ2VOb1phSk0wdlY3ZFl5?=
 =?utf-8?B?MzU2RExYUEMwemF6Uk1XcE92cEQzZHNGQjd3T2QxTURsMSt4ZEphOWU3cFBi?=
 =?utf-8?B?dHNQVDk3cGt5STdUaFJvU0JhVHpxUW5WRW5FZmFiTHdJTFFTYlRYZkdDV3dG?=
 =?utf-8?B?empFazI3VVRzU3RuZTVGR2lpdm9oYzlCWGpHdW1JV2xFOCtMMnBiQjZHUGhM?=
 =?utf-8?B?bDVsRHhVZnVNUlNRZ0dyUXhZYyt3M2pxL0NGTDFzd1dMaFJUVERyWHF3WThz?=
 =?utf-8?B?d2k0RlJtK2UveXRMYUZ2VkNMMEswOUZETU1QQkJleTBlSG02YjhDUWR2QS9V?=
 =?utf-8?B?R0xEN29MaUhhR1hBcHliU2dwWGxMbDk5Yjd0aks3WTRPMDdiRkNreE1FTGZV?=
 =?utf-8?B?Unk3RkZCWWVMK2pzZXRvbHA0Ujd2cmN1RTF6Z005aTV3NldvTzVsTjgzL3Yz?=
 =?utf-8?B?dkdNWnBvSFFpREJTU0Jta1AwUmVsdFZIWEhYZDY4SHNGVHFveVcralBHcDdP?=
 =?utf-8?B?YUxub1FKYllvcmhmNzFtZFFWWXZoTHlzZ2RhdzZyM214bW9Ud1cvSjVLWUIz?=
 =?utf-8?B?bWJ4S3VVSmdyVUJ1SE1EYUFacW02b3Nkb0RudTRIQ3UxLzNDSXZQcVV1Z0I5?=
 =?utf-8?B?VkQya2ZCdFRoUHYzSUtqZ0pEMDkrRWhZTWZYWmNIdTYxcmorMXhwbzRQbmM4?=
 =?utf-8?B?MkxGaWJRcXEvc1kxTjYxN2ppVjlwTks3eVppcSs5NzdYYjNsZHpUM3hVMTc4?=
 =?utf-8?B?K2ZJWU9DNmZxbGRFcC9MNHdyY2pra0ZCSURSd1hzSWtBdmtvbzd1SXB4ZFBE?=
 =?utf-8?B?R2l5Z1k2M0NrQjQ2Y016Uk15TGRYL3RWWG54Y1VvUmd1TFpUWU5PVng5NkNN?=
 =?utf-8?B?RURjSlE2Vlc5emRZU3dkbnpwdzlxdWl3akRhNDgvU0VwRkFPdjN3Z2wzSStT?=
 =?utf-8?B?NEliTjhUUURHaVV1U2o5MUxJd2dZRExTdllQUUlYV0lkYmpjU09CbU9qNFVG?=
 =?utf-8?B?U2c5dmJabTE3WnhzcDVIS0hjL2xSL0g3YVB6ZGJHWHRMUWlWZnZkeHFIV3g4?=
 =?utf-8?B?S0Nxb2FpeTE2Rk9LdzRMUkFMWTBnbWY1NStJSjJnd0s2eHRIOGN5VStScnBH?=
 =?utf-8?B?dkZpMG1DRTBtcjFTSDFxWHNvNGdOWjFCK3REdXdHUXVvNFBSUEZkV21mTFR5?=
 =?utf-8?B?WkpVc1lGUzMwMzF5a292NFlNNG1CWDh3cXJ2dXVTVHhISGpPMTNGOU5iQ0lS?=
 =?utf-8?B?clViZnFTMjQ3VVZSaGNxdy9Ja1JzYjlSL2Z5NWtFMFNiZkhPRGJDNDE3aU5U?=
 =?utf-8?B?Ujh5aG5YR204RTNiZlMvelZrbDNVUjlTWENBNDlHQUtIWlg4ZFJrSFBmaFZL?=
 =?utf-8?B?ZWxNakR4czBSakZ1TGY0MmRCMWdsMnNDeE9MaGFpbG9wR0RsR3VIRUJzREox?=
 =?utf-8?B?NGFxMUZWbFp3ZEppUGJxOElhampzS0ZEQ1ZaMXF4QzdoWU9uaUZ0c05HdFhM?=
 =?utf-8?B?dHNYVytWYW5Pekd0KzZzMTE2eW00ZnhiRWZKSmZlaDNJV2xmT2RqTTU1Mlpl?=
 =?utf-8?B?ek5EQlZRQk82Yjd6VE9OY3czTWRQdWp5TXU2Y3NXa0FIZGZEZmxEQmRFUnh2?=
 =?utf-8?B?UW1hU2tRUFFmUkM5TGd4U3dwdVROMUtKRUYxVForWVFIVWtUQVhpa3NBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmEyU2gvQW53Q0ptdzZPNm1JUG5oQS9LanVoVU1BWDBMYUMrSXVUdVZRbFdX?=
 =?utf-8?B?VkR5UzBJSSsrNGdWbzd3OWJUOWRXUGFLbmwrUDZSdVJia3dZV0xuWWRML3E5?=
 =?utf-8?B?a3p4aTZJcndSN2NsVVEvajI2TFlrSC9yT051d2pMVVFibFgrd2VmdkJuK3JJ?=
 =?utf-8?B?U1dqOVIvUGVITURTdmJVb3VGYkRUUnZWTmJOblp0RmRvY1VWVWduQ0FZYUxM?=
 =?utf-8?B?cUM4czZnQnVFUWtuOXdjTkZMWGM0d0lUaFFJSmJ4eml5ZXlvajBnUHo4aVRj?=
 =?utf-8?B?V0ZGS3ZyOERML3I4QnlzaDFJU0dsQ09vbHVtUmNhd1Aya0FCSks0L2VmdWlw?=
 =?utf-8?B?aDN0NkFZbU0yRTg3aTJ2R0IrMkFNa25MemJGb0gwUGZkY1d2VE93VXBhV1Bk?=
 =?utf-8?B?ME55elJoY1M3QjFzclFhd3ZlWGFlZ3ovSHF2dTNxYk9mZTNKQk9iam9BbjJM?=
 =?utf-8?B?eXlFK2F3MGFSSENjZ09JRnJQWnRSa3lLRjhGSXVtOFBPM0ZSQThleWdPTW9l?=
 =?utf-8?B?K1ZRcjd4Yy9zMW9PSHBEZFZhUmQ1WGZsSjAwNUpJOUdta1QwWDFkVWxucnNO?=
 =?utf-8?B?MWpUZFo0LzV4VXhtMmtSTnNaYXNrUlg3eEd6QSs4Y21TVlhHcFlmTUpDVmcr?=
 =?utf-8?B?dWY5cWNyeTdlZkVSdmxkbllzbjgxKzd5ZS81U3I4Y09JRmlKSXQ0R3NIOXJS?=
 =?utf-8?B?N0NzWHloY0JVQkRvS05TNVJ3UHVxRnBJTW9UNGJmeitFTWl5RXhPOFUwaUZC?=
 =?utf-8?B?RysxVmFUd3JSTWsrTGVDUWJWU2w2aWUzdEJ3eFp3UmR2cCs0ck9kRHMrRUV2?=
 =?utf-8?B?M05GMUE4RlU3UU5qaUhnNzVHMHZWTkJvNTdiYWZNc1M0UmFFajZxVy9oWmlp?=
 =?utf-8?B?Yk9SOFcvVXJjM1FwbzFJZ2xYY1Z3TUNHSXVCc3FBZ0Fnd3p1NWkrUE5wQ3V5?=
 =?utf-8?B?N2NsT3BTVSttMFdyazlaUFdpN2NxMFV2TmJXMHhyUGZKOGhJQ3pzKzdEbW1X?=
 =?utf-8?B?RXV0N2x6RWN3MVNQejBwZkExMjczV1p3RXJob2VsQkRxamY4eWlUcEpNNldi?=
 =?utf-8?B?ZExUWjNUUWxMVjlhT2FYTmVRWWVMbzZjR3R3QU1QL3Zac0FXODZLZU9uelZW?=
 =?utf-8?B?MkxjN3dxTnVyRDA4alhKWkRMdmEvYzh1NDE5NlhYcW9wZ0cvbFdzOEZNTmth?=
 =?utf-8?B?RGhDNG03MDVFaFlZem5ISzhWNFZ5TnR4b29LcFhHSy82REhRdEVmWWt2dTI5?=
 =?utf-8?B?QWZIdDFUSjdtRXM0MnRlRTNLRFJrak5qSms0NldiK1FuVWQ0WHlCT1poelJx?=
 =?utf-8?B?OGlkZmZ5YWlpcHBxbnlVc29YYWxjdW52d29SMWVLK0ZLdS9memxod1hsVzZF?=
 =?utf-8?B?bDN5RndMMnlpQTFjUkQ4MXF5RnFqRk5IYVJsci9RNGZXVU03ZDZDdU1MU051?=
 =?utf-8?B?Z1M0YXdpZnRnSGJLTlpZZk9pQkx4Snk0ZDAxSlJrbjhZSU5sanhaQTdIaVYx?=
 =?utf-8?B?Y0c1bW1QMVlmWDN6d2dxUGhVTVhOaDR4dllRVi9Sb25jV2pKOWVjaHhIbVVu?=
 =?utf-8?B?allHWGtFSmk1QjlGSk5VUTJ0WFF4ZGRtVXM3c21OZlY3bGN4QlBFWTB2SWho?=
 =?utf-8?B?RHI5RER4a1pjTDRlemdiazlMSFg4WlUrTkVpTCtJcm9Ia3AvYmZ1SW5LaHlv?=
 =?utf-8?B?SFdKcERkSnEzQmtPRUNRaHp6THMrVTNZZHBER08wVzVrQU1qUjBmbkl4UVJi?=
 =?utf-8?B?MS8rWnJIVnJZdlZSQ1lzczVEdUxiZFplb0tvTG9yQW9tTHhSNGRIZ1FteUdt?=
 =?utf-8?B?VTd0cmVuWnErd2ZLb2w0L1dyUVIyRmh1bC9QZXVXVk9wZjBSUnhYK0JnZ0NJ?=
 =?utf-8?B?R2ZPcGE2a3FoUHI5YmJyclJPVzRGWkRJdElLa2wxcFM0eHY4MG01eFdJWmVB?=
 =?utf-8?B?SjJ3YUthTDRacSsrU25kdFpHK0UxbnpTZmtpdVB4MXBsRGRwTktEY2dKVEFN?=
 =?utf-8?B?RVVjMWhSWXJRc3JzZlRXQVVLOGpLLzN3UmFSSXNtd3RLeVdDWTVvUWk5WWZt?=
 =?utf-8?B?amtQNElaR2Iwa1NPR3BEdlpjSXBXR0VJUTZBbVVpaVRsWG4ycHcvRzBxZkwv?=
 =?utf-8?Q?Iztq0g8byJSHRFmjxkaAE5Coe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 292545db-d109-420e-6e24-08dc5db8ba46
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 01:58:36.1782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0JqU4LdSIF2AwLX/z7w96u8rwLyrQhKlJTdhy+J2qHbLuufzn0YKFs+4qe+DGT4MU6JBH53cK+PWLisdXK9hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5985
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

This patch does not apply to amd-staging-drm-next. This is against a 
DKMS branch and should be reviewed on our internal mailing list.

However, I suspect that part of the problem is, that the DKMS branch has 
diverged quite a bit in this area, and is missing at least one patch 
from me that was reverted, probably because of an improper port. The 
proper solution should involve getting the DKMS branch back in sync with 
upstream. I'll look into that.

Regards,
   Felix

On 2024-04-13 14:07, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> [  +0.006038] BUG: kernel NULL pointer dereference, address: 0000000000000028
> [  +0.006969] #PF: supervisor read access in kernel mode
> [  +0.005139] #PF: error_code(0x0000) - not-present page
> [  +0.005139] PGD 0 P4D 0
> [  +0.002530] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [  +0.004356] CPU: 11 PID: 12625 Comm: kworker/11:0 Tainted: G        W          6.7.0+ #2
> [  +0.008097] Hardware name: ASUS System Product Name/Pro WS WRX80E-SAGE SE WIFI II, BIOS 1302 12/08/2023
> [  +0.009398] Workqueue: events evict_process_worker [amdgpu]
> [  +0.005750] RIP: 0010:evict_process_worker+0x2f/0x460 [amdgpu]
> [  +0.005991] Code: 55 48 89 e5 41 57 41 56 4c 8d b7 a8 fc ff ff 41 55 41 54 53 48 89 fb 48 83 ec 10 0f 1f 44 00 00 48 8b 43 f8 8b 93 b0 00 00 00 <48> 3b 50 28 0f 85 50 03 00 00 48 8d 7b 58 e8 ee be cb bf 48 8b 05
> [  +0.018791] RSP: 0018:ffffc90009a2be10 EFLAGS: 00010282
> [  +0.005226] RAX: 0000000000000000 RBX: ffff888197ffc358 RCX: 0000000000000000
> [  +0.007140] RDX: 0000000000000a1b RSI: 0000000000000000 RDI: ffff888197ffc358
> [  +0.007139] RBP: ffffc90009a2be48 R08: 0000000000000000 R09: 0000000000000000
> [  +0.007139] R10: 0000000000000000 R11: 0000000000000000 R12: ffff888197ffc358
> [  +0.007139] R13: ffff888100153a00 R14: ffff888197ffc000 R15: ffff888100153a05
> [  +0.007137] FS:  0000000000000000(0000) GS:ffff889facac0000(0000) knlGS:0000000000000000
> [  +0.008094] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  +0.005747] CR2: 0000000000000028 CR3: 000000010d1fc001 CR4: 0000000000770ef0
> [  +0.007138] PKRU: 55555554
> [  +0.002702] Call Trace:
> [  +0.002443]  <TASK>
> [  +0.002096]  ? show_regs+0x72/0x90
> [  +0.003402]  ? __die+0x25/0x80
> [  +0.003052]  ? page_fault_oops+0x154/0x4c0
> [  +0.004099]  ? do_user_addr_fault+0x30e/0x6e0
> [  +0.004357]  ? psi_group_change+0x237/0x520
> [  +0.004185]  ? exc_page_fault+0x84/0x1b0
> [  +0.003926]  ? asm_exc_page_fault+0x27/0x30
> [  +0.004187]  ? evict_process_worker+0x2f/0x460 [amdgpu]
> [  +0.005377]  process_one_work+0x17b/0x360
> [  +0.004011]  ? __pfx_worker_thread+0x10/0x10
> [  +0.004269]  worker_thread+0x307/0x430
> [  +0.003748]  ? __pfx_worker_thread+0x10/0x10
> [  +0.004268]  kthread+0xf7/0x130
> [  +0.003142]  ? __pfx_kthread+0x10/0x10
> [  +0.003749]  ret_from_fork+0x46/0x70
> [  +0.003573]  ? __pfx_kthread+0x10/0x10
> [  +0.003747]  ret_from_fork_asm+0x1b/0x30
> [  +0.003924]  </TASK>
>
> When we run stressful tests, the eviction fence could be zero and not match
> to last_eviction_seqno.
>
> Avoid calling dma_fence_signal and dma_fence_put with zero fences to rely
> on checking parameters in DMA API.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Xiaogang Chen <xiaogang.chen@amd.com>
> Cc: Felix Kuehling <felix.kuehling@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index eb380296017d..a15fae1c398a 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -2118,7 +2118,7 @@ static void evict_process_worker(struct work_struct *work)
>   	 */
>   	p = container_of(dwork, struct kfd_process, eviction_work);
>   	trace_kfd_evict_process_worker_start(p);
> -	WARN_ONCE(p->last_eviction_seqno != p->ef->seqno,
> +	WARN_ONCE(p->ef && p->last_eviction_seqno != p->ef->seqno,
>   		  "Eviction fence mismatch\n");
>   
>   	/* Narrow window of overlap between restore and evict work
> @@ -2134,9 +2134,11 @@ static void evict_process_worker(struct work_struct *work)
>   	pr_debug("Started evicting pasid 0x%x\n", p->pasid);
>   	ret = kfd_process_evict_queues(p, false, KFD_QUEUE_EVICTION_TRIGGER_TTM);
>   	if (!ret) {
> -		dma_fence_signal(p->ef);
> -		dma_fence_put(p->ef);
> -		p->ef = NULL;
> +		if (p->ef) {
> +			dma_fence_signal(p->ef);
> +			dma_fence_put(p->ef);
> +			p->ef = NULL;
> +		}
>   
>   		if (!kfd_process_unmap_doorbells_if_idle(p))
>   			kfd_process_schedule_restore(p);
