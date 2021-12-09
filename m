Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF4C46EF98
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:01:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9181010E617;
	Thu,  9 Dec 2021 16:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0048210E116;
 Thu,  9 Dec 2021 16:09:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CXJgMPV07fcyPGZRV53ceIweTIn0bPETjkL9FtEtgZ6NbNWgiXzoJKK8SIhheFZl32XXEcL3i8z94Yma1lMWbTwwp3EEHoXOqGD7z6WMdaVE8DWRMMdWDn0TP4VsqINMJKjzLzMkM16kIJ3lDA+rmMiDTPZ+oF2oVlKKL1S7JFOWsf7iJ/uPtevb/xbFnPyPwSycazes7d24eX1XiZpKz68Fu5dt/RoS2phbfgr/Ad7Xe3jHYWiApMp2Wvy2lbu+sGStkPZuk00rog5+/RqIvc+mhwJO1Z+2dcuR800e2OUr7B642maDBGgg+n73bIJAL+sUe6f0ySRQzlcQS7aIqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIQH8dKpSFLhB+6g7X8O5rMBjVCtA9Mcd/eAtP0sNZc=;
 b=UG2ylpu0ejkdtQZu8YDU8RkiDnAyknOfGSVjJGizlwsbgXKScdyveRwYYYlMjhaYwsZb49PKsGppX2QSm5Cnm8U9duunZ5wYe4MGFQiduUGjIy/Q4g9s+ksYt/40pSeE5Jhs0ORA0l3qL7FenG7vtSn9rHcQoz+80XZuCbw04IQTY1vogRKJd47C+94RB7Sio3ohO+7OExsg0JVkUJxMlMDVG1DTI67hiV00CG/D9BDLE0mcROkGFiMBgXUkah7JZhFchExXWyHGJIl2DqI8tTuewRadfmDlTQjpKkOhIIvvVBm+JoC7JBTSHagAfAP81UUJ6+vXT35mYUjc0wxe9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIQH8dKpSFLhB+6g7X8O5rMBjVCtA9Mcd/eAtP0sNZc=;
 b=BzAUGNbmSldpStLN7oBXUHi6psZ3cbQi+8J2TCNE2LLQZahFtKgFvvMSgkYR03AhS7GFFBy2D43ifL0E7JVMaFs8HE5yAhRqX+evVQOJ5RYrR752m8uwnVfFBNYpyMm2JsOJkXP1m8t6zDAy5MtoLI2SSj424pybOS/sIr9bVLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1342.namprd12.prod.outlook.com
 (2603:10b6:300:e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 16:09:53 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::d16c:a6d5:5d2e:f9d4%12]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 16:09:53 +0000
Subject: Re: Reuse framebuffer after a kexec (amdgpu / efifb)
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 linux-fbdev@vger.kernel.org, kexec@lists.infradead.org,
 amd-gfx@lists.freedesktop.org
References: <62aab616-53cb-ff9f-c5f3-169c547bd1ee@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <bb02d57c-d850-b319-9e76-663c0c2f8eed@amd.com>
Date: Thu, 9 Dec 2021 17:09:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <62aab616-53cb-ff9f-c5f3-169c547bd1ee@igalia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM6P195CA0028.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::41) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:76cf:54fe:ebe4:b83c]
 (2a02:908:1252:fb60:76cf:54fe:ebe4:b83c) by
 AM6P195CA0028.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 16:09:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9e3eeb9-f6bb-4abd-2b30-08d9bb2e55f5
X-MS-TrafficTypeDiagnostic: MWHPR12MB1342:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB13427BFAB762F993F784A3E683709@MWHPR12MB1342.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RDbzvSScDPk/9EsXPEXxtn5rKAh7XWcbVWso0X+ZblQ6CsyVUbOouS6jirKkGMQ6XFKLQ0claXSC5LXK01DsISFLJyomeT1gIW+tYci1+OmOaXokJf2GGqmydmd0F8yjJTzZjVYhUg1dOe1i8KkA97yndLshm1lUrJZNhnbLnG+S1U4OnTOayNRrC5u5pMi1OGjOC12Q6NBOiQ/Xu+8tKTDKL7BG6urA8gYkJYjBEXHFPNP4eTStm6m1VImMfUFjWHQe7+FmSnainsPy18zIaFbErGCuxQ8+RZaOm8obbqsFi1gMowtudpmGldETPPwSzXhOsgtvNxjSd35e6xyon/2757uhC3CF28DzXxO3F58OwXJMWkuOgocJMuXGzvKHaobv3yppEBpA76f+e9MMm8mdlfSVwOFWP/BUGPLlImJ8mmr1qmUULab/abg82NosydjQh2k5d46jSAkQU9wD2tXzTzh+N33AEZLAqUgy18qnwuzHZiiRCDdIfNspO8xfnZ3c9JRo63+5wEB3OH2KgpC0Iv7ovh8+2Vl/kWbB6f7b25Cha2KI1xPFYh7EO5B2TjHI+VurpVfGcC6Fagp+0qVNdhXL29i8Uv3NvqBNhLAm3qlaUg+oe1E4pI2uhRgAif9HxICouk3okm8CDh1fbZDj+HtaNNbx6Hek5MApPaKREegWbi7PtZps8xDZx8hEi6soFO7cR1VS/caJkN+g4cXn5r+Km4UgY+AirSOTohTbmt26eyXdjyUjVU/vv2Ws
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(4326008)(66556008)(8676002)(8936002)(2616005)(508600001)(66946007)(36756003)(7416002)(6666004)(83380400001)(86362001)(31696002)(316002)(2906002)(31686004)(38100700002)(5660300002)(186003)(54906003)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SktzTW9CTGpXczZGU0NCcjQwWVRTSDVlMnRPeHNGcFVldWZMN2FFcDVNb2Nv?=
 =?utf-8?B?RTAwcUVtMnl1Mzg2eEJjUEMvOGx3VUdidVMzbGZrVXVlaUJhM3duaEorL0ZJ?=
 =?utf-8?B?RnNrNUlGS1IrQ1pXdlJjV2JPK2xXVmRIdWdueERoRnl6WDNoemJzOFNZbUdH?=
 =?utf-8?B?WHcrTzhYY3VvTWVQQWgzbE4vZ3NtU2JQalZobnFMdUZka3MzSWlaUjljc09m?=
 =?utf-8?B?NGlhbGpwd2psbGxoUVU3dGhsQit3SGp4dTljOFFKQWFMSEpsMlRMWWc4NlU4?=
 =?utf-8?B?WUROeVhlenRIUkIrd3ZTL0ozbmJhQ0czeWtzZ1llMm9CcEtHck52SEw3emFu?=
 =?utf-8?B?MmdvR1l1ZFEyMGdzOTBvK1RtVUY4UjVMa0UxcDBWMXdmcWo0bVJLRkhEYXkv?=
 =?utf-8?B?SVFMcTJVSTJQVWRWOUNRMFRiOVN1TlJ3dkt4c1NEUUR6dUhvcnJkRkxBdDZV?=
 =?utf-8?B?cElKZ3BWbHZIR3FnU0IxRi8vZ1NJeXVIN1QycWJEUitnb2RvSzNrZVFFL0Ey?=
 =?utf-8?B?cXh6d2Y3MS9RdUF1L1ljWlNCMmdFY2dOVlp2L0QzcW5ZZEVPUlNvM2lXRlhp?=
 =?utf-8?B?eVYvU1VEVUhSZ1ViLzdnS1lTTWJUZ1hBSjA1dUhURnRQSk9mT2IxNnM0Tkxl?=
 =?utf-8?B?dmVVRTdZTUxEVU01MGVFcGdhNStmOGpZNDBFN3E2RFF3U04wQjZxb3IvK3Iz?=
 =?utf-8?B?YW4vZENjUDBJRTljR09kbFRXcW4yejJKMm5oNi9ydU5VWWlRSGFabHhwS3Jk?=
 =?utf-8?B?cGxJcVBraHV6YnNZMm51T3ZDSUtUZ0ZKRi9wVEswdHhoTXJORUgvcHFKWDFS?=
 =?utf-8?B?Nys1Z2NON2FXWjI0MUduS2RBTzZXc3dlbGp1Qjg4bkJlSDRJNE5YbDM5VTQw?=
 =?utf-8?B?dDNIWjNwdFdLWW01NzlYYzh6YVMzZmRZRzQ0eGdjS0xzUkZIVENHTlFEMVl2?=
 =?utf-8?B?Smd3QjJyNE44THFMcldUdFdyZW5BeDBhbEs0RUdON3BQRGV1R1AxRXN0WmVF?=
 =?utf-8?B?UHVrT1Ewd0dJTzhHdWFyc3A1QkFyUDBjT1BUdFU4TnVscEtuZTdsaWJxcWJt?=
 =?utf-8?B?VDc2ZmtOZldtMGE5aExHam5ObThxUGhPbEprUjVkZEZJWGFkbk4wcmFySWNG?=
 =?utf-8?B?clV1ZmVnZklqUVZKUUxUWGJuVGRwTytEVEwxdGJlaW05aUQwTEFtQlJvMjkz?=
 =?utf-8?B?dFo5RmY0MWV2Ukc3UEd1NXdLUHFBQUJ6MFpLdnRJV3V2K3lCQmRRdEtvWTY0?=
 =?utf-8?B?cWFTWGprd0U5TC91NnYxZW13Nlg3RDJNdGVLVzZrOTR6RC85MUVsb09WaEhO?=
 =?utf-8?B?dmVQaU9xdXZFUjhabWVST2M0ZndUMy9xQ0draGFvdHVLVnZYOFFVMkY3b0Fa?=
 =?utf-8?B?TWlpdEhtWjl1NGthMlVrSkJhUVF5SGt0VVVzemIvWE5xeGxiQU1sejAyUVNG?=
 =?utf-8?B?Ti9hTWxsOFZPLzJiK0xiaS9hZ2FCMERBTEdJK3VKekQrenBSKzV3S3h6VTFs?=
 =?utf-8?B?aDExcEErOE1yNjRnRFZiN3BEQXg0b0pkR2p6Y3RXN1dOTm1YeVA4MkR1SkRM?=
 =?utf-8?B?eERxcTZGVHVBZkg4VnhLWFN6eGVtTTZCaTd4TDZ2RWp2dUpCbGRDWUNTdDNK?=
 =?utf-8?B?ekhkRkQzeDRXYlU4M1hNRXoxOXN1QiswQXdRQTVTSXl5cS9HRm5KTlovMGJW?=
 =?utf-8?B?UXFwOFl1d3kwbWZySkJIMit1V0NTSU5Qd016N1Y5YVpXSUtzRlUvL3JlaVU4?=
 =?utf-8?B?alV0MVZ6aHdxMHVrOFRSbFlMOFNNZDBSeGZHbE1DeTZYZFEzbFJvUFRsMkVW?=
 =?utf-8?B?S1hGRy9YaXpKMUFBVlA2QTVLUFBja1dLMjdyZjZuWVAxbEJ2ZmQxWmIzNEpU?=
 =?utf-8?B?Z2IrbFRZVVVCTk9GSEZESFA5QXFSaGFEaktkWmFGclVzS2Fhblk1WkcwWUZs?=
 =?utf-8?B?aFlwOUFIU0lKaHpJMDQ0YkZTOHk2cHZTdXNTMVA1amxIUU00RGpXZXJzcGJ5?=
 =?utf-8?B?REZ4cmU0UVNpcHBUMWhmQ0cwejJseUZjdkRhN25BQzgydk1VYUlXUDdvckVI?=
 =?utf-8?B?eFA1U1d5bzJmR2N3NUx0d1A5TUtmbGdlOUxTbElrLzdBNUJsNHh6S0IzRHhO?=
 =?utf-8?B?WEZXWXJNVnBFbWo2Z0UyZExwNXI0Z1NzUDhjWEtjUDREdGV3ejF2cnRFYTcr?=
 =?utf-8?Q?9+5g1WZLsQ/wwmmS9TTa/7o=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9e3eeb9-f6bb-4abd-2b30-08d9bb2e55f5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 16:09:53.6465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ag49N4Z13oCkQr5Kf9W2CW8i/HQ33D/yfc357i2iykxGRaRSbyK9aT7LvbQ1cF1m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1342
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
Cc: kernel@gpiccoli.net, kasong@redhat.com, Baoquan He <bhe@redhat.com>,
 =?UTF-8?Q?Samuel_Iglesias_Gons=c3=a1lvez?= <siglesias@igalia.com>,
 Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org, pjones@redhat.com,
 kraxel@redhat.com, alexander.deucher@amd.com, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guilherme,

Am 09.12.21 um 17:00 schrieb Guilherme G. Piccoli:
> Hi all, I have a question about the possibility of reusing a framebuffer
> after a regular (or panic) kexec - my case is with amdgpu (APU, aka, not
> a separate GPU hardware), but I guess the question is kinda generic
> hence I've looped most of the lists / people I think does make sense
> (apologies for duplicates).
>
>
> The context is: we have a hardware that has an amdgpu-controlled device
> (Vangogh model) and as soon as the machine boots, efifb is providing
> graphics - I understand the UEFI/GRUB outputs rely in EFI framebuffer as
> well. As soon amdgpu module is available, kernel loads it and it takes
> over the GPU, providing graphics. The kexec_file_load syscall allows to
> pass a valid screen_info structure, so by kexec'ing a new kernel, we
> have again efifb taking over on boot time, but this time I see nothing
> in the screen. I've manually blacklisted amdgpu in this new kexec'ed
> kernel, I'd like to rely in the simple framebuffer - the goal is to have
> a tiny kernel kexec'ed. I'm using kernel version 5.16.0-rc4.
>
> I've done some other experiments, for exemple: I've forced screen_info
> model to match VLFB, so vesafb took over after the kexec, with the same
> result. Also noticed that BusMaster bit was off after kexec, in the AMD
> APU PCIe device, so I've set it on efifb before probe, and finally
> tested the same things in qemu, with qxl, all with the same result
> (blank screen).
> The most interesting result I got (both with amdgpu and qemu/qxl) is
> that if I blacklist these drivers and let the machine continue using
> efifb since the beginning, after kexec the efifb is still able to
> produce graphics.
>
> Which then led me to think that likely there's something fundamentally
> "blocking" the reuse of the simple framebuffer after kexec, like maybe
> DRM stack is destroying the old framebuffer somehow? What kind of
> preparation is required at firmware level to make the simple EFI VGA
> framebuffer work, and could we perform this in a kexec (or "save it"
> before the amdgpu/qxl drivers take over and reuse later)?

unfortunately what you try here will most likely not work easily.

During bootup the ASIC is initialized in a VGA compatibility mode by the 
VBIOS which also allows efifb to display something. And among the first 
things amdgpu does is to disable this compatibility mode :)

What you need to do to get this working again is to issue a PCIe reset 
of the GPU and then re-init the ASIC with the VBIOS tables.

Alex should know more details about how to do this.

Regards,
Christian.

>
> Any advice is greatly appreciated!
> Thanks in advance,
>
>
> Guilherme

