Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F062B9AEA5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 18:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE68210E24C;
	Wed, 24 Sep 2025 16:49:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VLObTgMJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013020.outbound.protection.outlook.com
 [40.93.201.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23F0C10E24C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 16:49:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SezilUXLT1ySoPSGnuZ8ubTSSYtwTDhGQ83vEpR7/z3nJNoXLxOmm1KkMsM+iuJihosyxkoNKnyGb8IWblMKnwm5iSKasteuzWkjX9aSIZ/ymmJ4bPNn+57okwgcX5LaUrp8wvNhBQKZ1c4NIY+BbuPVHu3lxg1z6qjtAGs2qQ+D6Xjb649o5qSn11mrqOpWpnOuoRFITpzx+N5PXf+FGcanjL/F2gXLS48kfQw7mTpsgk7dHvs96BUfMILmCpZ0VdwiGQRawF75fq6xtZzNETQ3aCy+vPwuCQqOvsjZhcfNDs6PeYLR7fn4fhxfD2VXrYrZxhYMDSTeZLVXs4v/vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeMLETioRvB7G5r4+lC7kdOxbvSGTQArCGdkFmkdtnw=;
 b=lT+KWu/kuAMau3lXIPOz+mVBDLip8YL2bG8BagX/xHrLXCVygZqGQgaLMoZxIjTFDMesq1R1Gcnhs9GuIknVi01gNThoesCHFEhKzh9ZNO7vHjNhNtFzeqTaOOmL/NRwmjDUPAPVmRODYGvYdcom4NX8JKE+NIWkEclh6GvVHNamxvj5hG3l2Of+FPZ0xkg3sg1BOkGucmhFtlXkpNybCq/8NBCzXDLVJhr6FfgBhMvMNkXcaElmi04gApUCobdrctWDcHwlmZ0HwKo6H+rWCocmPQmh0PTm7QT0gsoc7ED4Mv2G6sZMrV5F0pEvuPiTzgh2MxtUwd02+yfWbod51A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=suse.de smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeMLETioRvB7G5r4+lC7kdOxbvSGTQArCGdkFmkdtnw=;
 b=VLObTgMJ+Kbw9BDF1yFiGH1SMCep4tvSz3ItBFic4Lq1wz+nK9+4+YbhPYWRLqsh8B5dh53JX9alKKiCH3X2vlvIKGGgYb9cgQeapV1S+YZ0RqxN2vsRW9Vk1ErpavDt3f6tDQrFj4r16DqfybI7z1UP7ebnb49Mvw4STEVyQU+PqgFSGTlWd+30JdyTnfhHYKk3JdqBS2DhSj1VVXEFyYecgKf957cG3RKvxU0Kve3UvDlBa0qsgOpIbYUfMOvdaf2PXTdNa/0h2XqyzcCs4ilTFei7p/V9nG0SjHhSM21teaQQVHzZhX8sYcfjbLrf0lCJwnz3DBgr+pBVGA5d+Q==
Received: from BN0PR04CA0057.namprd04.prod.outlook.com (2603:10b6:408:e8::32)
 by SA5PPF0EB7D076B.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8c5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 24 Sep
 2025 16:48:41 +0000
Received: from BL6PEPF00022575.namprd02.prod.outlook.com
 (2603:10b6:408:e8:cafe::6d) by BN0PR04CA0057.outlook.office365.com
 (2603:10b6:408:e8::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.21 via Frontend Transport; Wed,
 24 Sep 2025 16:48:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00022575.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Wed, 24 Sep 2025 16:48:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Wed, 24 Sep
 2025 09:48:23 -0700
Received: from [10.221.136.181] (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Sep
 2025 09:48:21 -0700
Message-ID: <13fc56f4-402c-4bc3-af8a-4f15af107aa9@nvidia.com>
Date: Wed, 24 Sep 2025 18:47:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ast "WARN_ON(!__ast_dp_wait_enable("ast, enabled)) on reboot
To: Thomas Zimmermann <tzimmermann@suse.de>, Carol Soto <csoto@nvidia.com>,
 KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Matt
 Ochs" <mochs@nvidia.com>
References: <d81cc339-43c9-4529-ace5-29a687378b0d@nvidia.com>
 <bfb9cf60-decd-44c8-aee7-061fb64d5041@suse.de>
 <ccb24ca8-60e6-48b7-aff0-d1774630c700@nvidia.com>
 <9aebc248-6f63-4f01-bb41-840095e44cd0@suse.de>
 <PH7PR12MB688258B3FDD48ACAEFFE0697CC1DA@PH7PR12MB6882.namprd12.prod.outlook.com>
 <27af2540-312e-48fe-b0b4-4155c134d50b@suse.de>
 <PH7PR12MB688239917CEB67BEFA458AD4CC1DA@PH7PR12MB6882.namprd12.prod.outlook.com>
 <b56175d0-ddc1-4168-95eb-a24e3157bbd6@suse.de>
Content-Language: en-US
From: Nirmoy Das <nirmoyd@nvidia.com>
In-Reply-To: <b56175d0-ddc1-4168-95eb-a24e3157bbd6@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022575:EE_|SA5PPF0EB7D076B:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f5ea44a-6d46-4530-4c1d-08ddfb8a3766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmxSL2R1dDkyRW9QcnpkTlkwSVZ5emo2YkNhb0RqTXc5OGN4V1BtSFBrUU03?=
 =?utf-8?B?d1F3cUE2ZWh0MkhTS2pZOHRLQUt3NGYwNnNxajQ1VWE1UHFUWS9OMjZyeXk3?=
 =?utf-8?B?a1hwR2ZrdnBuVFo2N1B2dFd1NXhOM0tDVStpZzFsSE15WUc2WlBpVk1xdDdT?=
 =?utf-8?B?eWdmNEZTamZ3WStENTUyZjF2QXF2dEQveWZVWWEwWGZXUTZWOWIzL1U4ejhk?=
 =?utf-8?B?NEJLNDYrZWRJZWtSN0YzUW54M0tROElvaWlWUEUwWFVBVTFJUDlmdy84S2JL?=
 =?utf-8?B?RzY0b0s3L3M5V1FmVHZmM28rUFJ3TXdDTXY2YUFza3A0am45eE5KSjlENXlx?=
 =?utf-8?B?eGVEZDh2dmhkMmUwTzV5cXhKK2tTZ1ViZzM2S0d3VVhrM0Q0WlVSTVM3MkNN?=
 =?utf-8?B?Q0NPVjdQZ2VPS1VpT1lZc3ZUSy9vdnJGYk00a2hxNWNzSUptaThDRmhtTkFp?=
 =?utf-8?B?ZFRnZVRxMFlYNDkwSVQ2R0E0TUZ4alBhb0xIREFFK0dCMVFYemFEeDFiT001?=
 =?utf-8?B?V29sdFZtVkVmd3hCVUFMbHArYzVySzlqTUN2RE1KWE1qTE9CSmRCSVdtYzcw?=
 =?utf-8?B?aW93aEc2Q2hYTlVTZzM0eHcyVFhCZS82eTRlcnV2S2p1Z2Rjck54MlhabkF5?=
 =?utf-8?B?SFhhajNaR1p4eUZDMnRkVXgrclVJcjBMYWJjbElDcll4UnJodlNlTFdBTVNs?=
 =?utf-8?B?ZHY0Mko2dGIzQjgzY3NPSlNSaXVLRy81ZFhpd3d2eklYT1ZNYlhPZ0FxY0hv?=
 =?utf-8?B?clM3Z08xNit5SUZEMWFHc1ZhYmpFbW9OdzNJMDhHVlJncjdnM1k5c1NTYmh6?=
 =?utf-8?B?aVdITlZEMHJocXd4TFVXUzEvLzY0clBkUTk0MTQvNEFlY1RLc1V5b3ArWDM1?=
 =?utf-8?B?RW1nbmppd1pVTlQ5dDJyV2xiTmZPQ091R1FnZnNQRmJqbmlGaWRSTjBLaEdX?=
 =?utf-8?B?ZVh3bkxtZDVLWjlKVWRnYTJQUHplM0hiT1lVMEw4VHBBcGdJZDEveGtRYzB4?=
 =?utf-8?B?RVljYlI3TFRsUlZPZUZsd3drR09PVUc2SXJDU2VpME0yT2ZBTjJLZmx3UGdi?=
 =?utf-8?B?QTRhWDV3Snd0U0ZrZzZOdGdjdmk4SlFUbVB5TFlHUHZxZ3YyZnRXTFlVby9x?=
 =?utf-8?B?VC9MNmwwVmxKck5lR0VOVlVMUHdsQmJURTJ5elIvZUF1SzZMTDFqYVJLdnVx?=
 =?utf-8?B?djFTUjFRWVFYazB1ZnRGUEFQS3p6VTRsQWcrQ3VQcDNBWnhhZTBQc2JiMkpI?=
 =?utf-8?B?RWw3NWdaNU9jNTJPa1d3Z3Z3ZG9HRitlb1BYQVRSaWwwNXhPSitNSkZ1SHhS?=
 =?utf-8?B?T3E1ZEJTQnhDMlRJSUIxMW1sSSsrNUMzRnB1WTNxYjJKTmFVSFNRZlh3Wit6?=
 =?utf-8?B?VVpHTnZxQ3lRZTdUdjBtVHVIa0ZBSmk1NHZoR0IzN1BrdmJoSHBETUY5czFE?=
 =?utf-8?B?UGFZRC9UaCtkcHlxNWk1aXJaQUpSalljajZ1RzJTVk93ZWgwWW04ajhZVTla?=
 =?utf-8?B?Rk5GQ29JQVMzSlh5RjE0eEhWTUo2Zmtoc29rUmtmZ0pYOHhibVhLMmZIUlFa?=
 =?utf-8?B?OGY1MlRLUWdEK0tReG54cjF2b05uV0dTVDZJWDN3QUdOUEEwdjhZYWVEaEtp?=
 =?utf-8?B?S3h4RnFzeC9XTEs5TjZoTnBqTzVIRHBtQ3IreEh4bzlKUUpoS3pXQjBxQ1h5?=
 =?utf-8?B?ZWRIQmU3N1BqYUxwS3NueUdETWdQZ1RZV29meHJBeGEzbEd4bFZGTTZuQW1P?=
 =?utf-8?B?dFloSkFyeXdqcjhFanZQQWdKQk1Qb09RV1ZSUXE5M1c2czFEVUsvZnQ5WjNu?=
 =?utf-8?B?K0EwZnRReGxTRHF0cy8rRWpkRW45R25iMTY0TlZSWVpUZ2NodXpZMDQ4VCtt?=
 =?utf-8?B?YjlGYndPMEkwMDhQV3hISHMyN0JLejlrbklNWHhwWWVPa3BteFFkWnFybGtQ?=
 =?utf-8?B?SFV3UlJyTmpVNnpNRjlYUHBCQWdqYkRvOGdvNmk1VmtjcU9yVFk2NXdzU09h?=
 =?utf-8?B?alJXZUZaRmoweFdwTjZvK0tYK1drWlprMnUrZ1ZLRHhTbWQxRWYvV2gvOGJS?=
 =?utf-8?Q?flbb0l?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 16:48:40.8086 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f5ea44a-6d46-4530-4c1d-08ddfb8a3766
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF0EB7D076B
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

Hi Thomas,

On 23.09.25 18:46, Thomas Zimmermann wrote:
> Hi
>
> Am 23.09.25 um 17:36 schrieb Carol Soto:
>>
>> From dmesg we see this:
>>
>> [ 35.845199] ast 0008:04:00.0: [drm] Using ASPEED DisplayPort 
>> transmitter
>>
>
> Sure, it detects DP, but do you also connect the monitor via DisplayPort? 

It is a remote machine so it will be hard to physically verify but 
looking into the state file. I see that the display is indeed connected 
to a DP port.
cat  /sys/kernel/debug/dri/0008\:04\:00.0/state
plane[32]: plane-0
         crtc=crtc-0
         fb=39
                 allocated by = [fbcon]
                 refcount=2
                 format=XR24 little-endian (0x34325258)
                 modifier=0x0
                 size=640x480
                 layers:
                         size[0]=640x480
                         pitch[0]=2560
                         offset[0]=0
                         obj[0]:
                                 name=0
                                 refcount=2
                                 start=00010000
                                 size=1245184
                                 imported=no
                                 pages_use_count=2
                                 vmap_use_count=2
                                 vaddr=0000000051d78cc3
         crtc-pos=640x480+0+0
         src-pos=640.000000x480.000000+0.000000+0.000000
         rotation=1
         normalized-zpos=0
         color-encoding=ITU-R BT.601 YCbCr
         color-range=YCbCr limited range
         color_mgmt_changed=0
plane[34]: plane-1
         crtc=(null)
         fb=0
         crtc-pos=0x0+0+0
         src-pos=0.000000x0.000000+0.000000+0.000000
         rotation=1
         normalized-zpos=0
         color-encoding=ITU-R BT.601 YCbCr
         color-range=YCbCr limited range
         color_mgmt_changed=0
crtc[36]: crtc-0
         enable=1
         active=1
         self_refresh_active=0
         planes_changed=1
         mode_changed=0
         active_changed=0
         connectors_changed=0
         color_mgmt_changed=0
         plane_mask=1
         connector_mask=1
         encoder_mask=1
         mode: "640x480": 60 25175 640 656 752 800 480 490 492 525 0x48 0xa
connector[38]: DP-1
         crtc=crtc-0
         self_refresh_aware=0
         interlace_allowed=0
         ycbcr_420_allowed=0
         max_requested_bpc=0
         colorspace=Default


Regards,

Nirmoy

> I'm asking because the DP code always seemed fragile and there seem to 
> be devices that have both ports, DP and VGA, with no way of detecting 
> VGA.
>
> Best regards
> Thomas
>
>> *From: *Thomas Zimmermann <tzimmermann@suse.de>
>> *Date: *Tuesday, September 23, 2025 at 10:35 AM
>> *To: *Carol Soto <csoto@nvidia.com>, Nirmoy Das <nirmoyd@nvidia.com>, 
>> KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
>> *Cc: *dri-devel@lists.freedesktop.org 
>> <dri-devel@lists.freedesktop.org>, Matt Ochs <mochs@nvidia.com>
>> *Subject: *Re: ast "WARN_ON(!__ast_dp_wait_enable("ast, enabled)) on 
>> reboot
>>
>> External email: Use caution opening links or attachments
>>
>>
>> Hi
>>
>> Am 23.09.25 um 17:31 schrieb Carol Soto:
>> >
>> > I think this call was failing in this system for 6.8 kernel. The
>> > difference is that now is a WARN_ON so we see the stack trace at
>> > reboot with 6.14 and above kernels.
>> >
>>
>> OK. Just to clarify: your system does use an Aspeed DisplayPort? There
>> are also systems with VGA port.
>>
>> Best regards
>> Thomas
>>
>> > Carol
>> >
>> > *From: *Thomas Zimmermann <tzimmermann@suse.de>
>> > *Date: *Tuesday, September 23, 2025 at 4:41 AM
>> > *To: *Nirmoy Das <nirmoyd@nvidia.com>, KuoHsiang Chou
>> > <kuohsiang_chou@aspeedtech.com>
>> > *Cc: *dri-devel@lists.freedesktop.org
>> > <dri-devel@lists.freedesktop.org>, Carol Soto <csoto@nvidia.com>, Matt
>> > Ochs <mochs@nvidia.com>
>> > *Subject: *Re: ast "WARN_ON(!__ast_dp_wait_enable("ast, enabled)) on
>> > reboot
>> >
>> > External email: Use caution opening links or attachments
>> >
>> >
>> > Hi
>> >
>> > Am 23.09.25 um 11:25 schrieb Nirmoy Das:
>> > >
>> > > On 23.09.25 11:15, Thomas Zimmermann wrote:
>> > >> Hi
>> > >>
>> > >> Am 23.09.25 um 10:34 schrieb Nirmoy Das:
>> > >>>
>> > >>> Hi Thomas and KuoHsiang
>> > >>>
>> > >>>
>> > >>> (Not sure if there is separate portal to report AST issues. Let me
>> > >>> know if there is one)
>> > >>>
>> > >>> We are observing the following trace on every reboot. I tried
>> > >>> increasing the timeout value but that did not resolve the issue.
>> > >>>
>> > >>> I tried to read AST_IO_VGACRI(0xdf) and AST_IO_VGACRI(0xe3) which
>> > >>> returns a value of 0xff. I wonder if
>> > >>>
>> > >>> the device is accessible at pci_device_shutdown().
>> > >>>
>> > >>> I have attached the lspci output for your review.  Please let me
>> > >>> know if you have some ideas how to debug/fix this.
>> > >>>
>> > >>
>> > >> Is that a new problem? I occasionally refactor parts of the driver.
>> > >> It could happen that an older version works?
>> > >
>> > >
>> > > We saw this on 6.14 and 6.16 so I think it is not a new issue. 
>> Should
>> > > we try out more older kernel?
>> >
>> > If you can. The DP code got added in v5.19 by commit 594e9c04b586
>> > ("drm/ast: Create the driver for ASPEED proprietory Display-Port").
>> >
>> > Best regards
>> > Thomas
>> >
>> > >
>> > >
>> > > Regards,
>> > >
>> > > Nirmoy
>> > >
>> > >>
>> > >> Best regards
>> > >> Thomas
>> > >>
>> > >>> [ 196.248014] ast 0008:02:00.0: [drm]
>> > >>> drm_WARN_ON(!__ast_dp_wait_enable(ast, enabled)) [ 196.248045]
>> > >>> WARNING: CPU: 76 PID: 1 at drivers/gpu/drm/ast/ast_dp.c:282
>> > >>> ast_dp_set_enable+0x124/0x158 [ast] [ 196.277550] Modules 
>> linked in:
>> > >>> bcache qrtr cfg80211 binfmt_misc cdc_subset ast dax_hmem
>> > >>> drm_shmem_helper cxl_acpi drm_client_lib cxl_port i2c_algo_bit
>> > >>> cxl_core ipmi_ssif drm_kms_helper uio_pdrv_genirq uio 
>> coresight_trbe
>> > >>> arm_spe_pmu arm_cspmu_module arm_smmuv3_pmu spi_nor mtd
>> > >>> coresight_funnel acpi_power_meter acpi_ipmi coresight_etm4x
>> > >>> coresight ipmi_msghandler dm_multipath efi_pstore drm nfnetlink
>> > >>> ip_tables x_tables autofs4 overlay isofs nls_iso8859_1 raid10
>> > >>> raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx
>> > >>> xor xor_neon raid6_pq raid1 raid0 linear mlx5_ib ib_uverbs ib_core
>> > >>> mlx5_core ghash_ce sm4_ce_cipher sm4 sm3_ce mlxfw sha3_ce psample
>> > >>> i2c_smbus sha512_ce nvme tls sha1_ce arm_smccc_trng nvme_core
>> > >>> pci_hyperv_intf spi_tegra210_quad dax_pmem i2c_tegra cdc_ether
>> > >>> usbnet aes_neon_bs aes_neon_blk aes_ce_blk aes_ce_cipher [last
>> > >>> unloaded: ipmi_devintf] [ 196.355667] CPU: 76 UID: 0 PID: 1 Comm:
>> > >>> shutdown Tainted: G W 6.16.4-dev-main-nvidia-pset-linux-6-generic
>> > >>> #16+f4490439 PREEMPT(none) [ 196.369453] Tainted: [W]=WARN [
>> > >>> 196.372481] Hardware name: NVIDIA Grace CPU P5041/P3880, BIOS
>> > >>> FF.04.00 20250422 [ 196.379955] pstate: 63400009 (nZCv daif +PAN
>> > >>> -UAO +TCO +DIT -SSBS BTYPE=--) [ 196.387073] pc :
>> > >>> ast_dp_set_enable+0x124/0x158 [ast] [ 196.392148] lr :
>> > >>> ast_dp_set_enable+0x124/0x158 [ast] [ 196.397221] sp :
>> > >>> ffff80008049b930 [ 196.400604] x29: ffff80008049b930 x28:
>> > >>> ffffa507dbec1b98 x27: ffff0000acb337b8 [ 196.407901] x26:
>> > >>> 0000000000000000 x25: ffff1003985d2e00 x24: ffffa507dbdc45b8 [
>> > >>> 196.415197] x23: 0000000000000000 x22: 0000000000418958 x21:
>> > >>> 00000000ffffffdf [ 196.422495] x20: ffff100008bac0c8 x19:
>> > >>> 0000000000000000 x18: 000000000000004c [ 196.429790] x17:
>> > >>> ffff100008b5f200 x16: ffffa508522b5ce8 x15: 0000000000000000 [
>> > >>> 196.437087] x14: 0000000000000000 x13: 2d2d2d2d2d2d2d2d x12:
>> > >>> 2d2d2d2d5d206572 [ 196.444384] x11: 656820747563205b x10:
>> > >>> 0000000000000020 x9 : ffffa508523621cc [ 196.451681] x8 :
>> > >>> 00000000ffffffff x7 : 0000000000000030 x6 : 0000000005000000 [
>> > >>> 196.458976] x5 : 000000000000004d x4 : 00000000000000c0 x3 :
>> > >>> 0000000000000003 [ 196.466271] x2 : 0000000000000000 x1 :
>> > >>> 0000000000000000 x0 : ffff000081356040 [ 196.473566] Call trace: [
>> > >>> 196.476061] ast_dp_set_enable+0x124/0x158 [ast] (P) [ 196.481135]
>> > >>> ast_astdp_encoder_helper_atomic_disable+0x28/0x90 [ast] [
>> > >>> 196.487630] disable_outputs+0x11c/0x3c8 [drm_kms_helper] [
>> > >>> 196.493160] drm_atomic_helper_commit_tail+0x2c/0xb0 
>> [drm_kms_helper]
>> > >>> [ 196.499753] ast_mode_config_helper_atomic_commit_tail+0x34/0x58
>> > >>> [ast] [ 196.506427] commit_tail+0xd8/0x220 [drm_kms_helper] [
>> > >>> 196.511503] drm_atomic_helper_commit+0x174/0x190 
>> [drm_kms_helper] [
>> > >>> 196.517824] drm_atomic_commit+0x94/0xe0 [drm] [ 196.522392]
>> > >>> drm_atomic_helper_disable_all+0x204/0x220 [drm_kms_helper] [
>> > >>> 196.529158] drm_atomic_helper_shutdown+0x90/0x158 
>> [drm_kms_helper] [
>> > >>> 196.535567] ast_pci_shutdown+0x1c/0x30 [ast] [ 196.540020]
>> > >>> pci_device_shutdown+0x3c/0xa8 [ 196.544216]
>> > >>> device_shutdown+0x140/0x2b0 [ 196.548229] 
>> kernel_restart+0x4c/0xb8 [
>> > >>> 196.551974] __do_sys_reboot+0x148/0x260 [ 196.555979]
>> > >>> __arm64_sys_reboot+0x2c/0x40 [ 196.560074] 
>> invoke_syscall+0x70/0x100
>> > >>> [ 196.563907] el0_svc_common.constprop.0+0x48/0xf8 [ 196.568712]
>> > >>> do_el0_svc+0x28/0x40 [ 196.572097] el0_svc+0x34/0xd8 [ 196.575220]
>> > >>> el0t_64_sync_handler+0x144/0x168 [ 196.579670]
>> > >>> el0t_64_sync+0x1b0/0x1b8 [ 196.583411] ---[ end trace
>> > >>> 0000000000000000 ]--- [ 196.656701] reboot: Restarting system
>> > >>>
>> > >>> lspci:
>> > >>>
>> > >>> 0008:03:00.0 PCI bridge: ASPEED Technology, Inc. AST1150 
>> PCI-to-PCI
>> > >>> Bridge (rev 06) (prog-if 00 [Normal decode]) Subsystem: ASPEED
>> > >>> Technology, Inc. AST1150 PCI-to-PCI Bridge Physical Slot: 2-1 
>> Flags:
>> > >>> bus master, fast devsel, latency 0, NUMA node 0, IOMMU group 24 
>> Bus:
>> > >>> primary=03, secondary=04, subordinate=04, sec-latency=0 I/O behind
>> > >>> bridge: 40000-40fff [size=4K] [16-bit] Memory behind bridge:
>> > >>> 40000000-410fffff [size=17M] [32-bit] Prefetchable memory behind
>> > >>> bridge: [disabled] [64-bit] Capabilities: [40] Power Management
>> > >>> version 3 Capabilities: [68] Express PCI-Express to PCI/PCI-X
>> > >>> Bridge, MSI 00 Capabilities: [b0] Subsystem: ASPEED Technology, 
>> Inc.
>> > >>> AST1150 PCI-to-PCI Bridge Capabilities: [e0] Vendor Specific
>> > >>> Information: Len=20 <?> Capabilities: [100] Device Serial Number
>> > >>> 00-80-5e-00-00-10-0b-b0 Capabilities: [10c] Secondary PCI Express
>> > >>> Capabilities: [150] Virtual Channel Capabilities: [1e0] Vendor
>> > >>> Specific Information: ID=0001 Rev=2 Len=010 <?> Capabilities: 
>> [1f0]
>> > >>> Advanced Error Reporting 0008:04:00.0 VGA compatible controller:
>> > >>> ASPEED Technology, Inc. ASPEED Graphics Family (rev 52) 
>> (prog-if 00
>> > >>> [VGA controller]) DeviceName: Embedded Video Controller Subsystem:
>> > >>> ASPEED Technology, Inc. ASPEED Graphics Family !!! Unknown header
>> > >>> type 7f Memory at 650040000000 (32-bit, non-prefetchable) 
>> [size=16M]
>> > >>> Memory at 650041000000 (32-bit, non-prefetchable) [size=256K] I/O
>> > >>> ports at 40000 [size=128] Kernel driver in use: ast Kernel
>> > modules: ast
>> > >>>
>> > >>
>> >
>> > --
>> > --
>> > Thomas Zimmermann
>> > Graphics Driver Developer
>> > SUSE Software Solutions Germany GmbH
>> > Frankenstrasse 146, 90461 Nuernberg, Germany
>> > GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>> > HRB 36809 (AG Nuernberg)
>> >
>>
>> -- 
>> -- 
>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Software Solutions Germany GmbH
>> Frankenstrasse 146, 90461 Nuernberg, Germany
>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
>> HRB 36809 (AG Nuernberg)
>>
>
