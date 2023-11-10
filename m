Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6D17E75F9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 01:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB54310E390;
	Fri, 10 Nov 2023 00:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2055.outbound.protection.outlook.com [40.107.96.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFD010E390
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 00:31:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHvbGNfp9PHF6+GbJnRpenQy7VIjTBlXSTWiAdizgv2k7lWLTATSLao/e/lZgdEMMrLuxfPoi8EhHV3FVu9TQs/m7hp3MOUzPfVU+qjlUxCi+3ol/HqNNkvyxFWzSVyXsVAI40q4f26XvGMT1kTsRtqZ2WxVIsq+8aanuPG3JFI/5cBulWFHCRyp+C17zUGHsAxAt4RxlauHWyCbDIpuDhtspjLluYDiHZocMFtftasT3FUjG7y8mdqLMT93B2kqfIn5695dG/L+Fu5Pk9kvd/476hiJG91pp/1DZz+z7LcgjepaUCTDvErgw7MUU9sHmOTmR/nLYZhRavt6Q71ajg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqg+ZCknKu0fYMksZz0Lv2+R38+4mrnBmAbu4ftKkmc=;
 b=V2WJgnElRkXNS7jxPwzHVUsrMxPaUgrcI8BKPwIEdaCXkr1oSnVFqq3Lwu5l3+BqUbfZNiJ7Scgy8RldWMa4950JrQu8SpEseSzvVAjSltRY4jgspbdszQDwhbKZ3NH+cDXuINlFRoK14feZDTMX2lha8NnuBqXmGHbKuC6F7AF2PLB4g44x7rkg4MGca28U21WUBty2yRG0T7Ys3Ik21vzu6I8dTvi8RcWKwzDzFGU1QoiDZ5Ql3nFWZ6WVXQL43K+u07nVlRHpvBIx3uUEeVsy4ORUUTC/9ePKT7A3HxPpTBuliEFC8EPgWC1rh2v81vQzacbv6WA9aNjXYyb50Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqg+ZCknKu0fYMksZz0Lv2+R38+4mrnBmAbu4ftKkmc=;
 b=tUx9trWpoieMD80VXnFiG2r+hSrxhUxYUERge9eRZW6VZnPmfv770PX8Esn5yDpolPlx84HN1UbFXQ4mF74b676gsgHa6892Plcwl6QvWXh6z8+RM6GQjTLqnna9I+eDP5VaPWKnbYDAPElHCOokYHxp65FC8tIniTH/oVg/Z5c=
Received: from DM6PR03CA0048.namprd03.prod.outlook.com (2603:10b6:5:100::25)
 by CY5PR12MB6035.namprd12.prod.outlook.com (2603:10b6:930:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 00:31:06 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:5:100:cafe::f7) by DM6PR03CA0048.outlook.office365.com
 (2603:10b6:5:100::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Fri, 10 Nov 2023 00:31:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.21 via Frontend Transport; Fri, 10 Nov 2023 00:31:06 +0000
Received: from [10.236.30.70] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 9 Nov
 2023 18:31:03 -0600
Message-ID: <17776853-7458-40b4-8930-37e2d4b0ef0c@amd.com>
Date: Thu, 9 Nov 2023 18:30:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG in drm_kms_helper_poll_enable() fixed by reverting "drm/ast:
 report connection status on Display Port."
To: Jocelyn Falempe <jfalempe@redhat.com>
References: <ecb3570e-f7f4-47e7-8cef-13e592b6d396@amd.com>
 <54c6752d-3ef2-4f98-b96f-2c8d2509e692@redhat.com>
Content-Language: en-US
From: Kim Phillips <kim.phillips@amd.com>
Autocrypt: addr=kim.phillips@amd.com; keydata=
 xsBNBFh3uA4BCACmMh2JZ9f6vavU7XWTg45pl64x61cugDKZ34jiRLohU280rECk+kyXrKGB
 GdtV5+8tZWhMCyn151/C/OEYIi3CP5DY6wyrjbFkhI8ohqR4VqyC9gWAqD25coTQpOHyt7pd
 8EvSBDAuL031gqw5w6JNeqEbMplZeToy5Rgdr1i35MZOzyIaO01H+F2/sOL7qk6pY21y5Flj
 ojjFT/uWg7eodnOu/BJ1Uem6FaO6ovYSAMOaCs/GpguznsS76ORsH6Jnyp6+e3KlZe/F2M7H
 5HWCVsS5np2rf1luDsfHKV7HCd2+4iFRhxjbbulSBRMn7zx16PEGh8ccNwJm9/nwof6jABEB
 AAHNI0tpbSBQaGlsbGlwcyA8a2ltLnBoaWxsaXBzQGFtZC5jb20+wsCOBBMBCgA4FiEEaBZs
 4ROWXWKVJWj8Z9viHdU8iO8FAmHm/zMCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQ
 Z9viHdU8iO8aXQgAnByD4TUD+xGXXDAkIopwqip2Vfy3qzNhmfzdvLxKxsb6I6Tf1l2pMPGP
 EHxDPfuQhheyh+iRWrba6flwBGaNriJTFuVpQUGoRcjV11F2cpEbToqv2LGPaXIpc7IxEoRt
 lg9VKr70XcRePKq4iH5e7wrmzACP9UlvaKlRJl97FTckZIguQQMZe9kqLga1yRDqcQVN5Kj6
 IP6V8WzRz0qGpVE1GE/vjYH13o2qHrvp9d/zlPBTZFwhNpLBn4JHohyxQ63t7eZ1L4U66Caq
 jZ0lhdN/psHJWab0SeIIRAG5+WLMcRbx3+LPjzIyrXJSonsm4t5lU3RmGmWwJSunxGDu1s7A
 TQRYd7gOAQgAp2VJv7J5eaWVdHvazWijdobOXSa13GnV8DXENQLQSSQlxGkLkYa3nDHr6Xjk
 z2NPFn4cf8GgMd7Bd4p3MR6DbwA4qKE+8ZW2x4XdH///HGDDEI69sDZEzLPXgl/9dv49dxym
 Q/nuco2KtF4xaMS/mjRsv7Eu5oGH+2+vPKe7L8ykXUh7SJmr0tI2/y9A6MVOPckdenywmKQ+
 6R0gw6aL2OeUyWZLS/e/3+0zFmQxeTyHpoJb8cNk/XqUGsBXsTO6y+7fdykpXNCfeJL/bSGE
 SXgwRROHCnQeKwVbbvEU/e5GZlNnKXoD7u2jyJxt4NTG2c0Jze+W3MPwh1wxzNg6BQARAQAB
 wsBfBBgBCAAJBQJYd7gOAhsMAAoJEGfb4h3VPIjv33EIAIRVHWqFbAYPZZtYKdwugwzL0FKa
 X0VbkUvKNG8SQAcdvkKmnSITWrIbecHPQaSqrtl/W8qKD6YFNOC9JNCHEfyLPTxo33WonQpo
 utm5nbRS1p45Mk65Uu76qhuHMjPnOgbMqmRHgWjIRiNfKm1QD5/3bml08HnJ1PuucuxI4HkK
 SWR00RE4Jyhxi1ISB3UEQ98iZtobAkTYa3aZ6xCZzd+v+o4CkLDKtS8vrBXpppi/HAeRlL7m
 waGKsjcegLX8cEHSblIct+9KKjUrE8uZyokt67sTYDlPapVCkhTtKn5O88jXkqA2PgAU6XqP
 KeUe7zYeAD22yc9K+Ovi7bZ9I5o=
In-Reply-To: <54c6752d-3ef2-4f98-b96f-2c8d2509e692@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|CY5PR12MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e7b6d21-ae42-4d81-751d-08dbe18453cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lyIBU9nGBF9SfaErcCeXtGp0yYKgdW6Et/yLTFiLF4PNvCQnroZvP80uEci8xYLgMZDPudlosvS9EEOX2H1zpCdx4rdLM+hKtA4DM1Sno3gegBgZ7SBoJ3o8DByN3sUZ+bm2EDnkDps/e0GuCwnlbO9HavNImplAXF1XCC8Q6aJ+GS5h4+PWVzJDstC0jqF1KynkC7i2VY2WKme44xFN5EjLUoKEZzCdxO5ggZv9O+PmQM0VgKdidOhoWvtIuyB+vGtY/rX8wGlauntLmdwkFOBkXywEOEXncq2q9u2a+RSFStq5VemApJRVR2BRF0IgCox02MvOsAbU5qQ6PoJmmpDYsWiaTEi/SXQ6zJKVBBdonf6P6NMYpr99ynFxwGk4VsoYi0r31fz7ULqm3OEG4+MBc2OXOyxIh1W0SZVmswSPeBBLGqIjL3cPBq623m4ik9auKAqb94Wk6I8yY5QuDnl5mumyp2rYwyCuJBHj9QVwzKcbmtkpA8D28W3TNltyAP8h0q4F/0/JFrPZClsTxz4UmQgkhCPHHMnMs5X+dGXFy04kl1uZSjQFsm14lhh4hMXcyp2CtIqLkAqfXCFB8TKCm8/TdLlyT/HWKD4+Cxpp0G/0LIZJvS/lDJLuvFHO3SIRev7YT4LajyM5R3TCvxcO3mZcwzy5mEFPsByoZ34J07ddrAXNKYHZKBJqRMFXx2usQGmdfkuvtD2bCn0Ew7tv+FFYXWygM1lpX3YxHOVpJmhHags5F4R3yjNtDZTZDB3taPcsgdU8ZBYXmkKgmIpdBmZvRYBxEV3BQFSuG65yEKI3TDXrhb9qtQHuTkvOh1clZsPXopZxG5hbwe6/sguCM1EsPAvOxRBgEFLNrjat2NE175GLgN5LvX+jtSCI
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(230173577357003)(230922051799003)(230273577357003)(451199024)(82310400011)(64100799003)(186009)(1800799009)(36840700001)(46966006)(40470700004)(336012)(316002)(426003)(16576012)(53546011)(6916009)(54906003)(478600001)(966005)(70206006)(26005)(16526019)(6666004)(4326008)(44832011)(8936002)(8676002)(70586007)(83380400001)(47076005)(45080400002)(31686004)(40480700001)(2616005)(5660300002)(36756003)(7416002)(40460700003)(41300700001)(82740400003)(36860700001)(81166007)(356005)(86362001)(31696002)(30864003)(2906002)(43740500002)(36900700001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 00:31:06.0000 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e7b6d21-ae42-4d81-751d-08dbe18453cf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6035
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
Cc: jammy_huang@aspeedtech.com, "Giani, Dhaval" <Dhaval.Giani@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Grimm,
 Jon" <jon.grimm@amd.com>, dianders@chromium.org, Ainux <ainux.wang@gmail.com>,
 kuohsiang_chou@aspeedtech.com, Borislav
 Petkov <bp@alien8.de>, dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+LKML

On 11/9/23 7:47 AM, Jocelyn Falempe wrote:
> On 09/11/2023 01:37, Kim Phillips wrote:
>> Hi, current linux kernel commit 90450a06162e
>> ("Merge tag 'rcu-fixes-v6.7' of git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks")
>> and the attached config cause the following BUG when booting on
>> a reference AMD Zen4 development server:
>>
>> [   59.995717] input: OpenBMC virtual_input as /devices/pci0000:00/0000:00:07.1/0000:02:00.4/usb3/3-2/3-2.6/3-2.6:1.0/0003:1D6B:0104.0002/input/input4
>> [   60.033135] ast 0000:c2:00.0: vgaarb: deactivate vga console
>> [   60.066230] ast 0000:c2:00.0: [drm] Using default configuration
>> [   60.070342] hid-generic 0003:1D6B:0104.0002: input,hidraw0: USB HID v1.01 Keyboard [OpenBMC virtual_input] on usb-0000:02:00.4-2.6/input0
>> [   60.072843] ast 0000:c2:00.0: [drm] AST 2600 detected
>> [   60.072851] ast 0000:c2:00.0: [drm] Using ASPEED DisplayPort transmitter
>> [   60.099891] ast 0000:c2:00.0: [drm] dram MCLK=396 Mhz type=1 bus_width=16
>> [   60.115780] [drm] Initialized ast 0.1.0 20120228 for 0000:c2:00.0 on minor 0
>> [   60.135643] fbcon: astdrmfb (fb0) is primary device
>> [   60.135649] fbcon: Deferring console take-over
>> [   60.146162] ast 0000:c2:00.0: [drm] fb0: astdrmfb frame buffer device
>> [   60.331802] input: OpenBMC virtual_input as /devices/pci0000:00/0000:00:07.1/0000:02:00.4/usb3/3-2/3-2.6/3-2.6:1.0/0003:1D6B:0104.0002/input/input5
>> [   60.405807] hid-generic 0003:1D6B:0104.0002: input,hidraw0: USB HID v1.01 Keyboard [OpenBMC virtual_input] on usb-0000:02:00.4-2.6/input0
>> [   60.423774] input: OpenBMC virtual_input as /devices/pci0000:00/0000:00:07.1/0000:02:00.4/usb3/3-2/3-2.6/3-2.6:1.1/0003:1D6B:0104.0004/input/input6
>> [   60.443170] hid-generic 0003:1D6B:0104.0004: input,hidraw1: USB HID v1.01 Mouse [OpenBMC virtual_input] on usb-0000:02:00.4-2.6/input1
>> [   60.460675] ast 0000:c2:00.0: vgaarb: deactivate vga console
>> [   60.479996] ast 0000:c2:00.0: [drm] Using default configuration
>> [   60.486603] ast 0000:c2:00.0: [drm] AST 2600 detected
>> [   60.492249] ast 0000:c2:00.0: [drm] Using ASPEED DisplayPort transmitter
>> [   60.499732] ast 0000:c2:00.0: [drm] dram MCLK=396 Mhz type=1 bus_width=16
>> [   60.508955] BUG: unable to handle page fault for address: ffff8881e98109f0
>> [   60.516623] #PF: supervisor write access in kernel mode
>> [   60.522449] #PF: error_code(0x0002) - not-present page
>> [   60.528168] PGD 8dbc01067 P4D 8dbc01067 PUD 104c984067 PMD 104c837067 PTE 800ffffe167ef060
>> [   60.537394] Oops: 0002 [#1] PREEMPT SMP DEBUG_PAGEALLOC NOPTI
>> [   60.543805] CPU: 0 PID: 9 Comm: kworker/0:1 Tainted: G W          6.6.0+ #3
>> [   60.552251] Hardware name: AMD Corporation ONYX/ONYX, BIOS ROX100AB 09/14/2023
>> [   60.560309] Workqueue: events work_for_cpu_fn
>> [   60.565173] RIP: 0010:enqueue_timer (/home/amd/git/linux/./include/linux/list.h:1034 /home/amd/git/linux/kernel/time/timer.c:605)
>> [ 60.570129] Code: 44 00 00 55 48 89 e5 41 55 49 89 cd 41 54 49 89 fc 53 48 89 f3 89 d6 48 8d 84 f7 b0 00 00 00 48 8b 08 48 89 0b 48 85 c9 74 04 <48> 89 59 08 48 89 18 48 89 43 08 49 8d 44 24 68 48 0f ab 30 8b 4b
>> All code
>> ========
>>     0:   44 00 00                add    %r8b,(%rax)
>>     3:   55                      push   %rbp
>>     4:   48 89 e5                mov    %rsp,%rbp
>>     7:   41 55                   push   %r13
>>     9:   49 89 cd                mov    %rcx,%r13
>>     c:   41 54                   push   %r12
>>     e:   49 89 fc                mov    %rdi,%r12
>>    11:   53                      push   %rbx
>>    12:   48 89 f3                mov    %rsi,%rbx
>>    15:   89 d6                   mov    %edx,%esi
>>    17:   48 8d 84 f7 b0 00 00    lea    0xb0(%rdi,%rsi,8),%rax
>>    1e:   00
>>    1f:   48 8b 08                mov    (%rax),%rcx
>>    22:   48 89 0b                mov    %rcx,(%rbx)
>>    25:   48 85 c9                test   %rcx,%rcx
>>    28:   74 04                   je     0x2e
>>    2a:*  48 89 59 08             mov    %rbx,0x8(%rcx)           <-- trapping instruction
>>    2e:   48 8
>>    31:   48 89 43 08             mov    %rax,0x8(%rbx)
>>    35:   49 8d 44 24 68          lea    0x68(%r12),%rax
>>    3a:   48 0f ab 30             bts    %rsi,(%rax)
>>    3e:   8b                      .byte 0x8b
>>    3f:   4b                      rex.WXB
>>
>> Code starting with the faulting instruction
>> ===========================================
>>     0:   48 89 59 08             mov    %rbx,0x8(%rcx)
>>     4:   48 89 18                mov    %rbx,(%rax)
>>     7:   48 89 43 08             mov    %rax,0x8(%rbx)
>>     b:   49 8d 44 24 68          lea    0x68(%r12),%rax
>>    10:   48 0f ab 30             bts    %rsi,(%rax)
>>    14:   8b                      .byte 0x8b
>>    15:   4b                      rex.WXB
>> [   60.591081] RSP: 0018:ffffc900000dbbe0 EFLAGS: 00010086
>> [   60.596908] RAX: ffff888fd59e31b8 RBX: ffff8881ec87c9e8 RCX: ffff8881e98109e8
>> [   60.604866] RDX: 0000000000000099 RSI: 0000000000000099 RDI: ffff888fd59e2c40
>> [   60.612826] RBP: ffffc900000dbbf8 R08: 0000000000000001 R09: ffff888fd59e2c40
>> [   60.620787] R10: 000000000000550d R11: 0000000000000000 R12: ffff888fd59e2c40
>> [   60.628748] R13: 00000000ffff1640 R14: 00000000ffff163c R15: 0000000000000000
>> [   60.636706] FS:  0000000000000000(0000) GS:ffff888fd5800000(0000) knlGS:0000000000000000
>> [   60.645732] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   60.652141] CR2: ffff8881e98109f0 CR3: 00000008d5e3c003 CR4: 0000000000770ef0
>> [   60.660101] PKRU: 55555554
>> [   60.663114] Call Trace:
>> [   60.665838]  <TASK>
>> [   60.668174] ? show_regs (/home/amd/git/linux/arch/x86/kernel/dumpstack.c:479)
>> [   60.671971] ? __die (/home/amd/git/linux/arch/x86/kernel/dumpstack.c:421 /home/amd/git/linux/arch/x86/kernel/dumpstack.c:434)
>> [   60.675375] ? page_fault_oops (/home/amd/git/linux/arch/x86/mm/fault.c:707)
>> [   60.679942] ? search_bpf_extables (/home/amd/git/linux/kernel/bpf/core.c:765)
>> [   60.684800] ? enqueue_timer (/home/amd/git/linux/./include/linux/list.h:1034 /home/amd/git/linux/kernel/time/timer.c:605)
>> [   60.689077] ? srso_alias_return_thunk (/home/amd/git/linux/arch/x86/lib/retpoline.S:181)
>> [   60.694422] ? search_exception_tables (/home/amd/git/linux/kernel/extable.c:64)
>> [   60.699571] ? srso_alias_return_thunk (/home/amd/git/linux/arch/x86/lib/retpoline.S:181)
>> [   60.704917] ? kernelmode_fixup_or_oops (/home/amd/git/linux/arch/x86/mm/fault.c:762)
>> [   60.710256] ? __bad_area_nosemaphore (/home/amd/git/linux/arch/x86/mm/fault.c:860)
>> [   60.715505] ? bad_area_nosemaphore (/home/amd/git/linux/arch/x86/mm/fault.c:867)
>> [   60.720364] ? do_kern_addr_fault (/home/amd/git/linux/arch/x86/mm/fault.c:1227)
>> [   60.725030] ? exc_page_fault (/home/amd/git/linux/arch/x86/mm/fault.c:1503 /home/amd/git/linux/arch/x86/mm/fault.c:1561)
>> [   60.729503] ? asm_exc_page_fault (/home/amd/git/linux/./arch/x86/include/asm/idtentry.h:570)
>> [   60.734174] ? enqueue_timer (/home/amd/git/linux/./include/linux/list.h:1034 /home/amd/git/linux/kernel/time/timer.c:605)
>> [   60.738453] __mod_timer (/home/amd/git/linux/kernel/time/timer.c:635 /home/amd/git/linux/kernel/time/timer.c:1131)
>> [   60.742439] ? local_clock_noinstr (/home/amd/git/linux/kernel/sched/clock.c:301)
>> [   60.747202] add_timer (/home/amd/git/linux/kernel/time/timer.c:1245)
>> [   60.750798] __queue_delayed_work (/home/amd/git/linux/kernel/workqueue.c:1962)
>> [   60.755463] queue_delayed_work_on (/home/amd/git/linux/kernel/workqueue.c:1987)
>> [   60.760226] drm_kms_helper_poll_enable (/home/amd/git/linux/drivers/gpu/drm/drm_probe_helper.c:310) drm_kms_helper
>> [   60.767229] drm_kms_helper_poll_init (/home/amd/git/linux/drivers/gpu/drm/drm_probe_helper.c:914) drm_kms_helper
>> [   60.773936] ast_mode_config_init (/home/amd/git/linux/drivers/gpu/drm/ast/ast_mode.c:1931) ast
>> [   60.779382] ast_device_create (/home/amd/git/linux/drivers/gpu/drm/ast/ast_main.c:518) ast
>> [   60.784533] ast_pci_probe (/home/amd/git/linux/drivers/gpu/drm/ast/ast_drv.c:106) ast
>> [   60.789107] local_pci_probe (/home/amd/git/linux/drivers/pci/pci-driver.c:324)
>> [   60.793292] work_for_cpu_fn (/home/amd/git/linux/kernel/workqueue.c:5621)
>> [   60.797471] process_one_work (/home/amd/git/linux/kernel/workqueue.c:2630)
>> [   60.801941] ? process_one_work (/home/amd/git/linux/kernel/workqueue.c:2605)
>> [   60.806608] worker_thread (/home/amd/git/linux/kernel/workqueue.c:2697 /home/amd/git/linux/kernel/workqueue.c:2784)
>> [   60.810790] ? __pfx_worker_thread (/home/amd/git/linux/kernel/workqueue.c:2730)
>> [   60.815554] kthread (/home/amd/git/linux/kernel/kthread.c:388)
>> [   60.819151] ? __pfx_kthread (/home/amd/git/linux/kernel/kthread.c:341)
>> [   60.823331] ret_from_fork (/home/amd/git/linux/arch/x86/kernel/process.c:147)
>> [   60.827318] ? __pfx_kthread (/home/amd/git/linux/kernel/kthread.c:341)
>> [   60.831498] ret_from_fork_asm (/home/amd/git/linux/arch/x86/entry/entry_64.S:250)
>> [   60.835878]  </TASK>
>> [   60.838309] Modules linked in: crct10dif_pclmul crc32_pclmul ghash_clmulni_intel sha512_ssse3 sha256_ssse3 sha1_ssse3 ast(+) i2c_algo_bit drm_shmem_helper hid_generic(+) drm_kms_helper uas dax_hmem nvme usbhid usb_storage drm hid ahci(+) libahci i2c_piix4 nvme_core wmi aesni_intel crypto_simd cryptd
>> [   60.867920] CR2: ffff8881e98109f0
>> [   60.871616] ---[ end trace 0000000000000000 ]---
>>
>> drivers/gpu/drm/drm_probe_helper.c:310 is the
>> dev->mode_config.poll_running assignment here:
>>
>> void drm_kms_helper_poll_enable(struct drm_device *dev)
>> {
>>      if (!dev->mode_config.poll_enabled || !drm_kms_helper_poll ||
>>          dev->mode_config.poll_running)
>>          return;
>>
>>      if (drm_kms_helper_enable_hpd(dev) ||
>>          dev->mode_config.delayed_event)
>>          reschedule_output_poll_work(dev);
>>
>>      dev->mode_config.poll_running = true;           <<<<< HERE
>> }
>> EXPORT_SYMBOL(drm_kms_helper_poll_enable);
>>
> 
> Hi,
> 
> Thanks for the detailed bug report.
> 
>  From the call stack, I think the crash is more likely here:
> https://elixir.bootlin.com/linux/v6.6/source/kernel/time/timer.c#L605

Ah, right, sorry about that.

> But the timer looks correctly initialized in
> https://elixir.bootlin.com/linux/v6.6/source/drivers/gpu/drm/drm_probe_helper.c#L908
> 
> So I'm not sure why it fails in this case.
> 
>> If I revert commit f81bb0ac7872893241319ea82504956676ef02fd
>> ("drm/ast: report connection status on Display Port."), the splat
>> goes away:
>>
>> [   60.603837] input: OpenBMC virtual_input as /devices/pci0000:00/0000:00:07.1/0000:02:00.4/usb3/3-2/3-2.6/3-2.6:1.0/0003:1D6B:0104.0002/input/input4
>> [   60.651733] ast 0000:c2:00.0: vgaarb: deactivate vga console
>> [   60.659978]  4k 16711104 large 0 gb 0 x 1303[ffff888000097000-ffff8880a7ffe000] miss 383488
>> [   60.669321] ok.
>> [   60.670497] ast 0000:c2:00.0: [drm] Using default configuration
>> [   60.677894] ast 0000:c2:00.0: [drm] AST 2600 detected
>> [   60.683545] ast 0000:c2:00.0: [drm] Using ASPEED DisplayPort transmitter
>> [   60.685381] hid-generic 0003:1D6B:0104.0002: input,hidraw0: USB HID v1.01 Keyboard [OpenBMC virtual_input] on usb-0000:02:00.4-2.6/input0
>> [   60.691032] ast 0000:c2:00.0: [drm] dram MCLK=396 Mhz type=1 bus_width=16
>> [   60.697172] [drm] Initialized ast 0.1.0 20120228 for 0000:c2:00.0 on minor 0
>> [   60.729565] fbcon: astdrmfb (fb0) is primary device
>> [   60.729570] fbcon: Deferring console take-over
>> [   60.741322] ast 0000:c2:00.0: [drm] fb0: astdrmfb frame buffer device
>> [   60.928226] ast 0000:c2:00.0: vgaarb: deactivate vga console
>> [   60.940376] input: OpenBMC virtual_input as /devices/pci0000:00/0000:00:07.1/0000:02:00.4/usb3/3-2/3-2.6/3-2.6:1.0/0003:1D6B:0104.0002/input/input5
>> [   60.965436] ast 0000:c2:00.0: [drm] Using default configuration
>> [   60.972051] ast 0000:c2:00.0: [drm] AST 2600 detected
>> [   60.977698] ast 0000:c2:00.0: [drm] Using ASPEED DisplayPort transmitter
>> [   60.985181] ast 0000:c2:00.0: [drm] dram MCLK=396 Mhz type=1 bus_width=16
>> [   61.000056] [drm] Initialized ast 0.1.0 20120228 for 0000:c2:00.0 on minor 0
>> [   61.013486] fbcon: Deferring console take-over
>> [   61.016918] hid-generic 0003:1D6B:0104.0002: input,hidraw0: USB HID v1.01 Keyboard [OpenBMC virtual_input] on usb-0000:02:00.4-2.6/input0
>> [   61.018454] ast 0000:c2:00.0: [drm] fb0: astdrmfb frame buffer device
>> [   61.040853] input: OpenBMC virtual_input as /devices/pci0000:00/0000:00:07.1/0000:02:00.4/usb3/3-2/3-2.6/3-2.6:1.1/0003:1D6B:0104.0004/input/input6
>> [   61.059112] hid-generic 0003:1D6B:0104.0004: input,hidraw1: USB HID v1.01 Mouse [OpenBMC virtual_input] on usb-0000:02:00.4-2.6/input1
>> [   61.358397] input: OpenBMC virtual_input as /devices/pci0000:00/0000:00:07.1/0000:02:00.4/usb3/3-2/3-2.6/3-2.6:1.1/0003:1D6B:0104.0004/input/input7
>> [   61.376885] hid-generic 0003:1D6B:0104.0004: input,hidraw1: USB HID v1.01 Mouse [OpenBMC virtual_input] on usb-0000:02:00.4-2.6/input1
>>
>> This has happened before when drm_kms_helper_poll_init() was added
>> to an ast connector_init(), see:
> 
> The crash was in the detect() callback for that previous case.
> This time it crashes when setting the timer, but they still look very similar, thanks for pointing this.

Right, I thought that since they both added poll_init() calls,
then there was a wrong assumption about what poll_init() was
doing, but see below.

>> commit 595cb5e0b832a3e100cbbdefef797b0c27bf725a
>> Author: Kim Phillips <kim.phillips@amd.com>
>> Date:   Thu Oct 21 10:30:06 2021 -0500
>>
>>      Revert "drm/ast: Add detect function support"
>>
>> I'm willing to test any proposed changes, esp. if it means
>> not reverting this commit, too, because that will only likely
>> lead to yet another BUG instance if/when another poll_init() gets
>> added in the future.  Should the FIXME described in
>> reschedule_output_poll_work() be addressed?
> 
> 
> This fixme just change the timer interval from 10s to 1s, so it shouldn't explain this crash.

Ok, since my config has so much debug, it slows things
down a lot, so I thought it could have been related.

> Can you test with the attached patch ? I want to see if the detect callback is called, and also make sure the delayed_work struct is properly initialized.

Thanks, and yes, alright, there's more that meets the eye here.

Adding your printks show the values get preserved, but also now
the BUG doesn't trigger.

With my original CPA_DEBUG=y and init_on_free=1, prior to
the BUG reported, this list_del corruption occurs, which
I had thought was unrelated before:

[   57.274102] ------------[ cut here ]------------
[   57.279345] list_del corruption. prev->next should be ffff8881e6a25008, but was ffff8881a5406208. (prev=ffff8881a6995dc0)
[   57.291580] WARNING: CPU: 113 PID: 1356 at lib/list_debug.c:62 __list_del_entry_valid_or_report+0xc0/0xf0
[   57.302265] Modules linked in: usbhid usb_storage nvme drm hid ahci(+) libahci i2c_piix4 nvme_core wmi aesni_intel crypto_simd cryptd
[   57.315685] CPU: 113 PID: 1356 Comm: kworker/113:1 Tainted: G        W          6.6.0+ #3
[   57.324813] Hardware name: AMD Corporation ONYX/ONYX, BIOS ROX100AB 09/14/2023
[   57.332873] Workqueue: events blkg_free_workfn
[   57.337833] RIP: 0010:__list_del_entry_valid_or_report+0xc0/0xf0
[   57.344536] Code: b1 00 48 89 ca 48 c7 c7 10 fa 44 b4 e8 99 92 8d ff 0f 0b 31 c0 5d e9 7a 12 b1 00 4c 89 c2 48 c7 c7 48 fa 44 b4 e8 80 92 8d ff <0f> 0b 31 c0 5d e9 61 12 b1 00 48 89 d1 4c 89 c6 4c 89 ca 48 c7 c7
[   57.351947] nvme nvme0: 32/0/0 default/read/poll queues
[   57.365490] RSP: 0018:ffffc90006637dd8 EFLAGS: 00010082
[   57.377160] RAX: 0000000000000000 RBX: ffff8881e6a25008 RCX: c0000000ffefffff
[   57.385123] RDX: 0000000000000000 RSI: 00000000004ffffb RDI: 0000000000000001
[   57.393087] RBP: ffffc90006637dd8 R08: 0000000000000000 R09: 00000000ffefffff
[   57.401048] R10: ffffc90006637c40 R11: ffff888fd37fffe8 R12: ffff8881e6a25158
[   57.409008] R13: ffff8881a6995af8 R14: ffff8881e6a25000 R15: ffff8881a6995dd0
[   57.416970] FS:  0000000000000000(0000) GS:ffff888ff1c00000(0000) knlGS:0000000000000000
[   57.425999] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   57.432408] CR2: 0000000000000000 CR3: 0000000bbfa3c001 CR4: 0000000000770ef0
[   57.440371] PKRU: 55555554
[   57.443387] Call Trace:
[   57.446117]  <TASK>
[   57.448458]  ? show_regs+0x6e/0x80
[   57.452254]  ? __list_del_entry_valid_or_report+0xc0/0xf0
[   57.458281]  ? __warn+0x91/0x190
[   57.461883]  ? __list_del_entry_valid_or_report+0xc0/0xf0
[   57.467913]  ? report_bug+0x19d/0x1b0
[   57.472001]  ? srso_alias_return_thunk+0x5/0xfbef5
[   57.477348]  ? console_unlock+0x70/0x170
[   57.481730]  ? handle_bug+0x46/0x80
[   57.485622]  ? exc_invalid_op+0x1d/0x80
[   57.489901]  ? asm_exc_invalid_op+0x1f/0x30
[   57.494580]  ? __list_del_entry_valid_or_report+0xc0/0xf0
[   57.500606]  ? __list_del_entry_valid_or_report+0xc0/0xf0
[   57.506630]  blkg_free_workfn+0x9e/0x120
[   57.511011]  process_one_work+0x229/0x530
[   57.515486]  ? process_one_work+0x1c9/0x530
[   57.520162]  worker_thread+0x1f0/0x3f0
[   57.524350]  ? __pfx_worker_thread+0x10/0x10
[   57.529119]  kthread+0x109/0x140
[   57.532723]  ? __pfx_kthread+0x10/0x10
[   57.536907]  ret_from_fork+0x3d/0x60
[   57.540895]  ? __pfx_kthread+0x10/0x10
[   57.545077]  ret_from_fork_asm+0x1b/0x30
[   57.549476]  </TASK>
[   57.551905] irq event stamp: 6418
[   57.555599] hardirqs last  enabled at (6417): [<ffffffffb3bd09ac>] _raw_spin_unlock_irq+0x2c/0x60
[   57.565502] hardirqs last disabled at (6418): [<ffffffffb3bd060a>] _raw_spin_lock_irq+0x7a/0xa0
[   57.575210] softirqs last  enabled at (3260): [<ffffffffb2ad6e90>] __irq_exit_rcu+0x80/0xb0
[   57.584530] softirqs last disabled at (3255): [<ffffffffb2ad6e90>] __irq_exit_rcu+0x80/0xb0
[   57.593850] ---[ end trace 0000000000000000 ]---

Then there's a CPA assertion failure at AST-init-time:

[   57.650808]  nvme0n1: p1 p2 p3
[   57.989415] ata2: SATA link down (SStatus 0 SControl 300)
[   58.309409] ata3: SATA link down (SStatus 0 SControl 300)
[   58.629449] ata4: SATA link down (SStatus 0 SControl 300)
[   58.949384] ata5: SATA link down (SStatus 0 SControl 300)
[   59.269404] ata6: SATA link down (SStatus 0 SControl 300)
[   59.589379] ata7: SATA link down (SStatus 0 SControl 300)
[   59.909445] ata8: SATA link down (SStatus 0 SControl 300)
[   59.937086] usbcore: registered new interface driver uas
[   59.949887] input: OpenBMC virtual_input as /devices/pci0000:00/0000:00:07.1/0000:02:00.4/usb3/3-2/3-2.6/3-2.6:1.0/0003:1D6B:0104.0002/input/input4
[   59.987962] ast 0000:c2:00.0: vgaarb: deactivate vga console
[   60.019403] ast 0000:c2:00.0: [drm] Using default configuration
[   60.026023] ast 0000:c2:00.0: [drm] AST 2600 detected
[   60.029855] hid-generic 0003:1D6B:0104.0002: input,hidraw0: USB HID v1.01 Keyboard [OpenBMC virtual_input] on usb-0000:02:00.4-2.6/input0
[   60.031672] ast 0000:c2:00.0: [drm] Using ASPEED DisplayPort transmitter
[   60.034789] CPA self-test:
[   60.055973] ast 0000:c2:00.0: [drm] dram MCLK=396 Mhz type=1 bus_width=16
[   60.065951] ASTDEBUG poll init delayed work ffff8881eaae0998 timer ffff8881eaae09e8 drm_dev ffff8881eaae0000 timer flag 0x200000
[   60.083112] [drm] Initialized ast 0.1.0 20120228 for 0000:c2:00.0 on minor 0
[   60.092444] ASTDEBUG poll execute delayed_work ffff8881eaae0998, drm_dev ffff8881eaae0000
[   60.110956] fbcon: astdrmfb (fb0) is primary device
[   60.110962] fbcon: Deferring console take-over
[   60.121445] ast 0000:c2:00.0: [drm] fb0: astdrmfb frame buffer device
[   60.239700]  4k 16711104 large 0 gb 0 x 1303[ffff888000098000-ffff8880a7ffe000] miss 383488
[   60.239897] ASTDEBUG poll execute delayed_work ffff8881eaae0998, drm_dev ffff8881eaae0000
[   60.258764] ------------[ cut here ]------------
[   60.263973] CPA: called for zero pte. vaddr = 0 cpa->vaddr = ffff888125cf0000
[   60.263978] WARNING: CPU: 119 PID: 1258 at arch/x86/mm/pat/set_memory.c:1579 __cpa_process_fault+0xfe/0x670
[   60.263986] Modules linked in: dax_hmem ast(+) i2c_algo_bit drm_shmem_helper hid_generic(+) drm_kms_helper uas usbhid usb_storage nvme drm hid ahci(+) libahci i2c_piix4 nvme_core wmi aesni_intel crypto_simd cryptd
[   60.304089] CPU: 119 PID: 1258 Comm: pageattr-test Tainted: G        W          6.6.0+ #3
[   60.313225] Hardware name: AMD Corporation ONYX/ONYX, BIOS ROX100AB 09/14/2023
[   60.314767] input: OpenBMC virtual_input as /devices/pci0000:00/0000:00:07.1/0000:02:00.4/usb3/3-2/3-2.6/3-2.6:1.0/0003:1D6B:0104.0002/input/input5
[   60.321289] RIP: 0010:__cpa_process_fault+0xfe/0x670
[   60.341590] Code: ff ff ff 48 8d 84 01 00 00 a0 b2 48 c1 e8 0c 48 39 c2 73 9f 49 8b 45 00 4c 89 fe 48 c7 c7 a0 35 40 b4 48 8b 10 e8 f2 d4 01 00 <0f> 0b 41 bc f2 ff ff ff e9 7c ff ff ff 48 89 f2 48 8b 1d d3 a3 bb
[   60.362555] RSP: 0018:ffffc90005e37bb8 EFLAGS: 00010286
[   60.368392] RAX: 0000000000000000 RBX: ffffc90005e37d48 RCX: 0000000000000000
[   60.376360] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000001
[   60.384328] RBP: ffffc90005e37c28 R08: 0000000000000001 R09: 0000000000000001
[   60.392299] R10: 0000000000000001 R11: 0000000000000000 R12: 8000001025ab5363
[   60.396138] hid-generic 0003:1D6B:0104.0002: input,hidraw0: USB HID v1.01 Keyboard [OpenBMC virtual_input] on usb-0000:02:00.4-2.6/input0
[   60.400270] R13: ffffc90005e37d48 R14: ffffc90005e37d48 R15: 0000000000000000
[   60.400273] FS:  0000000000000000(0000) GS:ffff888ff3400000(0000) knlGS:0000000000000000
[   60.423137] input: OpenBMC virtual_input as /devices/pci0000:00/0000:00:07.1/0000:02:00.4/usb3/3-2/3-2.6/3-2.6:1.1/0003:1D6B:0104.0004/input/input6
[   60.431069] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   60.448426] hid-generic 0003:1D6B:0104.0004: input,hidraw1: USB HID v1.01 Mouse [OpenBMC virtual_input] on usb-0000:02:00.4-2.6/input1
[   60.452238] CR2: 00007f9ad2ac1ea0 CR3: 00000001e6392006 CR4: 0000000000770ef0
[   60.452241] PKRU: 55555554
[   60.476728] Call Trace:
[   60.479463]  <TASK>
[   60.481803]  ? show_regs+0x6e/0x80
[   60.485609]  ? __cpa_process_fault+0xfe/0x670
[   60.490485]  ? __warn+0x91/0x190
[   60.494096]  ? __cpa_process_fault+0xfe/0x670
[   60.498970]  ? report_bug+0x19d/0x1b0
[   60.503072]  ? handle_bug+0x46/0x80
[   60.506970]  ? exc_invalid_op+0x1d/0x80
[   60.511257]  ? asm_exc_invalid_op+0x1f/0x30
[   60.515946]  ? __cpa_process_fault+0xfe/0x670
[   60.520817]  ? __cpa_process_fault+0xfe/0x670
[   60.525696]  __change_page_attr_set_clr+0x28d/0x11c0
[   60.531253]  ? _vm_unmap_aliases+0x310/0x360
[   60.536042]  change_page_attr_set_clr+0x10b/0x1b0
[   60.541316]  pageattr_test+0x480/0x660
[   60.545513]  ? __pfx_do_pageattr_test+0x10/0x10
[   60.550585]  ? srso_alias_return_thunk+0x5/0xfbef5
[   60.555941]  ? schedule_timeout+0xd2/0x1c0
[   60.560532]  ? __pfx_do_pageattr_test+0x10/0x10
[   60.565589]  do_pageattr_test+0x1e/0x50
[   60.569879]  kthread+0x109/0x140
[   60.573494]  ? __pfx_kthread+0x10/0x10
[   60.577688]  ret_from_fork+0x3d/0x60
[   60.581683]  ? __pfx_kthread+0x10/0x10
[   60.585874]  ret_from_fork_asm+0x1b/0x30
[   60.590273]  </TASK>
[   60.592707] irq event stamp: 1477
[   60.596409] hardirqs last  enabled at (1489): [<ffffffffb2b87a48>] console_unlock+0x148/0x170
[   60.605937] hardirqs last disabled at (1506): [<ffffffffb2b87a2d>] console_unlock+0x12d/0x170
[   60.615460] softirqs last  enabled at (1504): [<ffffffffb2ad6e90>] __irq_exit_rcu+0x80/0xb0
[   60.624789] softirqs last disabled at (1499): [<ffffffffb2ad6e90>] __irq_exit_rcu+0x80/0xb0
[   60.634118] ---[ end trace 0000000000000000 ]---
[   60.639320] CPA 25 failed -14
[   60.643437] ------------[ cut here ]------------
[   60.648599] CPA: called for zero pte. vaddr = 0 cpa->vaddr = ffff888feb850000
[   60.656573] WARNING: CPU: 23 PID: 1258 at arch/x86/mm/pat/set_memory.c:1579 __cpa_process_fault+0xfe/0x670
[   60.667365] Modules linked in: crct10dif_pclmul(+) crc32_pclmul ghash_clmulni_intel sha512_ssse3 sha256_ssse3 sha1_ssse3 dax_hmem ast(+) i2c_algo_bit drm_shmem_helper hid_generic(+) drm_kms_helper uas usbhid usb_storage nvme drm hid ahci(+) libahci i2c_piix4 nvme_core wmi aesni_intel crypto_simd cryptd
[   60.697307] CPU: 23 PID: 1258 Comm: pageattr-test Tainted: G        W          6.6.0+ #3
[   60.706344] Hardware name: AMD Corporation ONYX/ONYX, BIOS ROX100AB 09/14/2023
[   60.714409] RIP: 0010:__cpa_process_fault+0xfe/0x670
[   60.719956] Code: ff ff ff 48 8d 84 01 00 00 a0 b2 48 c1 e8 0c 48 39 c2 73 9f 49 8b 45 00 4c 89 fe 48 c7 c7 a0 35 40 b4 48 8b 10 e8 f2 d4 01 00 <0f> 0b 41 bc f2 ff ff ff e9 7c ff ff ff 48 89 f2 48 8b 1d d3 a3 bb
[   60.740922] RSP: 0018:ffffc90005e37bb8 EFLAGS: 00010286
[   60.746751] RAX: 0000000000000000 RBX: ffffc90005e37d48 RCX: c0000000ffefffff
[   60.754724] RDX: 0000000000000000 RSI: 00000000004ffffb RDI: 0000000000000001
[   60.762681] RBP: ffffc90005e37c28 R08: 0000000000000000 R09: 00000000ffefffff
[   60.770639] R10: ffffc90005e37a20 R11: ffff888fd37fffe8 R12: 8000001025ab5363
[   60.778606] R13: ffffc90005e37d48 R14: ffffc90005e37d48 R15: 0000000000000000
[   60.786564] FS:  0000000000000000(0000) GS:ffff888fdb400000(0000) knlGS:0000000000000000
[   60.795598] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   60.802020] CR2: 00007f9ad2486986 CR3: 00000001e6392001 CR4: 0000000000770ef0
[   60.809990] PKRU: 55555554
[   60.813012] Call Trace:
[   60.815744]  <TASK>
[   60.818084]  ? show_regs+0x6e/0x80
[   60.821888]  ? __cpa_process_fault+0xfe/0x670
[   60.826763]  ? __warn+0x91/0x190
[   60.830369]  ? __cpa_process_fault+0xfe/0x670
[   60.835240]  ? report_bug+0x19d/0x1b0
[   60.839334]  ? srso_alias_return_thunk+0x5/0xfbef5
[   60.844686]  ? console_unlock+0x70/0x170
[   60.849075]  ? handle_bug+0x46/0x80
[   60.852974]  ? exc_invalid_op+0x1d/0x80
[   60.857261]  ? asm_exc_invalid_op+0x1f/0x30
[   60.861950]  ? __cpa_process_fault+0xfe/0x670
[   60.866821]  ? __cpa_process_fault+0xfe/0x670
[   60.871689]  ? srso_alias_return_thunk+0x5/0xfbef5
[   60.877041]  ? local_clock+0x19/0x40
[   60.881035]  ? srso_alias_return_thunk+0x5/0xfbef5
[   60.886396]  __change_page_attr_set_clr+0x28d/0x11c0
[   60.891955]  ? _vm_unmap_aliases+0x310/0x360
[   60.896730]  change_page_attr_set_clr+0x10b/0x1b0
[   60.902001]  pageattr_test+0x480/0x660
[   60.906197]  ? __pfx_do_pageattr_test+0x10/0x10
[   60.911261]  ? srso_alias_return_thunk+0x5/0xfbef5
[   60.916614]  ? schedule_timeout+0xd2/0x1c0
[   60.921207]  ? __pfx_do_pageattr_test+0x10/0x10
[   60.926267]  do_pageattr_test+0x1e/0x50
[   60.930551]  kthread+0x109/0x140
[   60.934157]  ? __pfx_kthread+0x10/0x10
[   60.938347]  ret_from_fork+0x3d/0x60
[   60.942342]  ? __pfx_kthread+0x10/0x10
[   60.946531]  ret_from_fork_asm+0x1b/0x30
[   60.950929]  </TASK>
[   60.953357] irq event stamp: 2439
[   60.957058] hardirqs last  enabled at (2449): [<ffffffffb2b87a48>] console_unlock+0x148/0x170
[   60.966579] hardirqs last disabled at (2458): [<ffffffffb2b87a2d>] console_unlock+0x12d/0x170
[   60.976102] softirqs last  enabled at (2358): [<ffffffffb2ad6e90>] __irq_exit_rcu+0x80/0xb0
[   60.985431] softirqs last disabled at (2477): [<ffffffffb2ad6e90>] __irq_exit_rcu+0x80/0xb0
[   60.994764] ---[ end trace 0000000000000000 ]---
[   60.999986] CPA 58 failed -14
[   61.048236] ast 0000:c2:00.0: vgaarb: deactivate vga console
[   61.109517] ast 0000:c2:00.0: [drm] Using default configuration
[   61.116135] ast 0000:c2:00.0: [drm] AST 2600 detected
[   61.121784] ast 0000:c2:00.0: [drm] Using ASPEED DisplayPort transmitter
[   61.129268] ast 0000:c2:00.0: [drm] dram MCLK=396 Mhz type=1 bus_width=16
[   61.139356] ASTDEBUG poll init delayed work ffff8881ec1a4998 timer ffff8881ec1a49e8 drm_dev ffff8881ec1a4000 timer flag 0x200000
[   61.158295] [drm] Initialized ast 0.1.0 20120228 for 0000:c2:00.0 on minor 0
[   61.169521] ASTDEBUG poll execute delayed_work ffff8881ec1a4998, drm_dev ffff8881ec1a4000
[   61.186684] fbcon: Deferring console take-over
[   61.191676] ast 0000:c2:00.0: [drm] fb0: astdrmfb frame buffer device
[   61.213804]  4k 16711104 large 0 gb 0 x 1303[ffff888000098000-ffff8880a7ffe000] miss 383488
[   61.308874] input: OpenBMC virtual_input as /devices/pci0000:00/0000:00:07.1/0000:02:00.4/usb3/3-2/3-2.6/3-2.6:1.1/0003:1D6B:0104.0004/input/input7
[   61.325991] hid-generic 0003:1D6B:0104.0004: input,hidraw1: USB HID v1.01 Mouse [OpenBMC virtual_input] on usb-0000:02:00.4-2.6/input1
[   61.409312] ASTDEBUG poll execute delayed_work ffff8881ec1a4998, drm_dev ffff8881ec1a4000
[   61.425854]  4k 16711104 large 0 gb 0 x 1303[ffff888000098000-ffff8880a7ffe000] miss 383488
[   61.435187] ------------[ cut here ]------------
[   61.440343] NOT PASSED. Please report.
[   61.444541] WARNING: CPU: 23 PID: 1258 at arch/x86/mm/pat/cpa-test.c:243 pageattr_test+0x636/0x660
[   61.454554] Modules linked in: crct10dif_pclmul crc32_pclmul ghash_clmulni_intel sha512_ssse3 sha256_ssse3 sha1_ssse3 dax_hmem ast i2c_algo_bit drm_shmem_helper hid_generic drm_kms_helper uas usbhid usb_storage nvme drm hid ahci(+) libahci i2c_piix4 nvme_core wmi aesni_intel crypto_simd cryptd
[   61.483628] CPU: 23 PID: 1258 Comm: pageattr-test Tainted: G        W          6.6.0+ #3
[   61.492666] Hardware name: AMD Corporation ONYX/ONYX, BIOS ROX100AB 09/14/2023
[   61.500733] RIP: 0010:pageattr_test+0x636/0x660
[   61.505796] Code: 40 25 0d 00 e9 23 fa ff ff 48 c7 c7 7d 39 37 b4 e8 2f 25 0d 00 31 c0 eb 82 e8 26 33 10 01 48 c7 c7 5f 39 37 b4 e8 7a a3 01 00 <0f> 0b b8 ea ff ff ff e9 65 ff ff ff 48 c7 c7 de 38 37 b4 e8 02 25
[   61.526759] RSP: 0018:ffffc90005e37dd8 EFLAGS: 00010282
[   61.532597] RAX: 0000000000000000 RBX: 000000000000012c RCX: c0000000ffefffff
[   61.540564] RDX: 0000000000000000 RSI: 00000000004ffffb RDI: 0000000000000001
[   61.548526] RBP: ffffc90005e37ed0 R08: 0000000000000000 R09: 00000000ffefffff
[   61.556495] R10: ffffc90005e37c40 R11: ffff888fd37fffe8 R12: 0000000000000002
[   61.564465] R13: 0000000000000000 R14: 000000000000012b R15: 000000000000012c
[   61.572436] FS:  0000000000000000(0000) GS:ffff888fdb400000(0000) knlGS:0000000000000000
[   61.581474] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   61.587893] CR2: 00007f9ad2486986 CR3: 00000001e6392001 CR4: 0000000000770ef0
[   61.595863] PKRU: 55555554
[   61.598884] Call Trace:
[   61.601602]  <TASK>
[   61.603948]  ? show_regs+0x6e/0x80
[   61.607745]  ? pageattr_test+0x636/0x660
[   61.612129]  ? __warn+0x91/0x190
[   61.615737]  ? pageattr_test+0x636/0x660
[   61.620122]  ? report_bug+0x19d/0x1b0
[   61.624216]  ? srso_alias_return_thunk+0x5/0xfbef5
[   61.629570]  ? console_unlock+0x70/0x170
[   61.633964]  ? handle_bug+0x46/0x80
[   61.637864]  ? exc_invalid_op+0x1d/0x80
[   61.642154]  ? asm_exc_invalid_op+0x1f/0x30
[   61.646843]  ? pageattr_test+0x636/0x660
[   61.651231]  ? pageattr_test+0x636/0x660
[   61.655636]  ? __pfx_do_pageattr_test+0x10/0x10
[   61.660699]  do_pageattr_test+0x1e/0x50
[   61.664986]  kthread+0x109/0x140
[   61.668599]  ? __pfx_kthread+0x10/0x10
[   61.672791]  ret_from_fork+0x3d/0x60
[   61.676786]  ? __pfx_kthread+0x10/0x10
[   61.680975]  ret_from_fork_asm+0x1b/0x30
[   61.685374]  </TASK>
[   61.687816] irq event stamp: 7163
[   61.691517] hardirqs last  enabled at (7173): [<ffffffffb2b87a48>] console_unlock+0x148/0x170
[   61.701039] hardirqs last disabled at (7182): [<ffffffffb2b87a2d>] console_unlock+0x12d/0x170
[   61.710559] softirqs last  enabled at (7110): [<ffffffffb2ad6e90>] __irq_exit_rcu+0x80/0xb0
[   61.719887] softirqs last disabled at (7105): [<ffffffffb2ad6e90>] __irq_exit_rcu+0x80/0xb0
[   61.729227] ---[ end trace 0000000000000000 ]---

...and further down, another timer user - not AST - gets the BUG:

[   61.796150] ahci 0000:c5:00.0: SSS flag set, parallel bus scan disabled
[   61.803606] ahci 0000:c5:00.0: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0xff impl SATA mode
[   61.812746] ahci 0000:c5:00.0: flags: 64bit ncq sntf ilck stag pm led clo only pmp fbs pio slum part sxs
[   61.841638] scsi host1: ahci
[   61.849378] scsi host2: ahci
[   61.856693] scsi host3: ahci
[   61.864536] scsi host4: ahci
[   61.872000] scsi host5: ahci
[   61.879461] scsi host6: ahci
[   61.887533] scsi host7: ahci
[   61.895793] scsi host8: ahci
[   61.901408] ata9: SATA max UDMA/133 abar m2048@0xc5201000 port 0xc5201100 irq 81 lpm-pol 4
[   61.910719] ata10: SATA max UDMA/133 abar m2048@0xc5201000 port 0xc5201180 irq 82 lpm-pol 4
[   61.920053] ata11: SATA max UDMA/133 abar m2048@0xc5201000 port 0xc5201200 irq 83 lpm-pol 4
[   61.929383] ata12: SATA max UDMA/133 abar m2048@0xc5201000 port 0xc5201280 irq 84 lpm-pol 4
[   61.938709] ata13: SATA max UDMA/133 abar m2048@0xc5201000 port 0xc5201300 irq 85 lpm-pol 4
[   61.948035] ata14: SATA max UDMA/133 abar m2048@0xc5201000 port 0xc5201380 irq 86 lpm-pol 4
[   61.957360] ata15: SATA max UDMA/133 abar m2048@0xc5201000 port 0xc5201400 irq 87 lpm-pol 4
[   61.966686] ata16: SATA max UDMA/133 abar m2048@0xc5201000 port 0xc5201480 irq 88 lpm-pol 4
[   61.996145] ahci 0000:c5:00.1: SSS flag set, parallel bus scan disabled
[   62.003601] ahci 0000:c5:00.1: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0xff impl SATA mode
[   62.012735] ahci 0000:c5:00.1: flags: 64bit ncq sntf ilck stag pm led clo only pmp fbs pio slum part sxs
[   62.040982] scsi host9: ahci
[   62.048522] scsi host10: ahci
[   62.055867] scsi host11: ahci
[   62.063120] scsi host12: ahci
[   62.070889] scsi host13: ahci
[   62.078083] scsi host14: ahci
[   62.086426] scsi host15: ahci
[   62.093654] scsi host16: ahci
[   62.099122] ata17: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200100 irq 132 lpm-pol 4
[   62.108551] ata18: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200180 irq 133 lpm-pol 4
[   62.117976] ata19: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200200 irq 134 lpm-pol 4
[   62.127398] ata20: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200280 irq 135 lpm-pol 4
[   62.136822] ata21: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200300 irq 136 lpm-pol 4
[   62.146247] ata22: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200380 irq 137 lpm-pol 4
[   62.155677] ata23: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200400 irq 138 lpm-pol 4
[   62.165096] ata24: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200480 irq 139 lpm-pol 4
[   62.289421] ata9: SATA link down (SStatus 0 SControl 300)
[   62.489399] ata17: SATA link down (SStatus 0 SControl 300)
[   62.609433] ata10: SATA link down (SStatus 0 SControl 300)
[   62.929431] ata11: SATA link down (SStatus 0 SControl 300)
[   63.249451] ata12: SATA link down (SStatus 0 SControl 300)
[   63.569474] ata13: SATA link down (SStatus 0 SControl 300)
[   63.889446] ata14: SATA link down (SStatus 0 SControl 300)
[   64.209444] ata15: SATA link down (SStatus 0 SControl 300)
[   64.529448] ata16: SATA link down (SStatus 0 SControl 300)
[   64.849453] ata18: SATA link down (SStatus 0 SControl 300)
[   65.169453] ata19: SATA link down (SStatus 0 SControl 300)
[   65.489426] ata20: SATA link down (SStatus 0 SControl 300)
[   65.809437] ata21: SATA link down (SStatus 0 SControl 300)
[   66.129446] ata22: SATA link down (SStatus 0 SControl 300)
[   66.449464] ata23: SATA link down (SStatus 0 SControl 300)
[   66.769451] ata24: SATA link down (SStatus 0 SControl 300)
[   67.071761] ahci 0000:c5:00.1: SSS flag set, parallel bus scan disabled
[   67.079284] ahci 0000:c5:00.1: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0xff impl SATA mode
[   67.088419] ahci 0000:c5:00.1: flags: 64bit ncq sntf ilck stag pm led clo only pmp fbs pio slum part sxs
[   67.116281] scsi host9: ahci
[   67.123667] scsi host10: ahci
[   67.131294] scsi host11: ahci
[   67.138478] scsi host12: ahci
[   67.145690] scsi host13: ahci
[   67.152947] scsi host14: ahci
[   67.160172] scsi host15: ahci
[   67.167480] scsi host16: ahci
[   67.172850] ata25: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200100 irq 132 lpm-pol 4
[   67.182333] ata26: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200180 irq 133 lpm-pol 4
[   67.191768] ata27: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200200 irq 134 lpm-pol 4
[   67.201193] ata28: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200280 irq 135 lpm-pol 4
[   67.210627] ata29: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200300 irq 136 lpm-pol 4
[   67.220052] ata30: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200380 irq 137 lpm-pol 4
[   67.229475] ata31: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200400 irq 138 lpm-pol 4
[   67.238899] ata32: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200480 irq 139 lpm-pol 4
[   67.267961] ahci 0000:03:00.0: SSS flag set, parallel bus scan disabled
[   67.275424] ahci 0000:03:00.0: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0xff impl SATA mode
[   67.284560] ahci 0000:03:00.0: flags: 64bit ncq sntf ilck stag pm led clo only pmp fbs pio slum part sxs
[   67.312681] scsi host17: ahci
[   67.320018] scsi host18: ahci
[   67.327362] scsi host19: ahci
[   67.334673] scsi host20: ahci
[   67.341960] scsi host21: ahci
[   67.349187] scsi host22: ahci
[   67.356487] scsi host23: ahci
[   67.363818] scsi host24: ahci
[   67.369242] ata33: SATA max UDMA/133 abar m2048@0xd6301000 port 0xd6301100 irq 149 lpm-pol 4
[   67.378680] ata34: SATA max UDMA/133 abar m2048@0xd6301000 port 0xd6301180 irq 150 lpm-pol 4
[   67.388104] ata35: SATA max UDMA/133 abar m2048@0xd6301000 port 0xd6301200 irq 151 lpm-pol 4
[   67.397529] ata36: SATA max UDMA/133 abar m2048@0xd6301000 port 0xd6301280 irq 152 lpm-pol 4
[   67.406951] ata37: SATA max UDMA/133 abar m2048@0xd6301000 port 0xd6301300 irq 153 lpm-pol 4
[   67.416372] ata38: SATA max UDMA/133 abar m2048@0xd6301000 port 0xd6301380 irq 154 lpm-pol 4
[   67.425795] ata39: SATA max UDMA/133 abar m2048@0xd6301000 port 0xd6301400 irq 155 lpm-pol 4
[   67.435219] ata40: SATA max UDMA/133 abar m2048@0xd6301000 port 0xd6301480 irq 156 lpm-pol 4
[   67.561434] ata25: SATA link down (SStatus 0 SControl 300)
[   67.757462] ata33: SATA link down (SStatus 0 SControl 300)
[   67.881422] ata26: SATA link down (SStatus 0 SControl 300)
[   68.201453] ata27: SATA link down (SStatus 0 SControl 300)
[   68.521442] ata28: SATA link down (SStatus 0 SControl 300)
[   68.841436] ata29: SATA link down (SStatus 0 SControl 300)
[   69.161454] ata30: SATA link down (SStatus 0 SControl 300)
[   69.481453] ata31: SATA link down (SStatus 0 SControl 300)
[   69.801454] ata32: SATA link down (SStatus 0 SControl 300)
[   70.121456] ata34: SATA link down (SStatus 0 SControl 300)
[   70.441416] ata35: SATA link down (SStatus 0 SControl 300)
[   70.761438] ata36: SATA link down (SStatus 0 SControl 300)
[   71.042796] BUG: unable to handle page fault for address: 00000000049f015b
[   71.050471] #PF: supervisor instruction fetch in kernel mode
[   71.056783] #PF: error_code(0x0010) - not-present page
[   71.062514] PGD 0 P4D 0
[   71.065335] Oops: 0010 [#1] PREEMPT SMP DEBUG_PAGEALLOC NOPTI
[   71.071746] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W          6.6.0+ #3
[   71.079999] Hardware name: AMD Corporation ONYX/ONYX, BIOS ROX100AB 09/14/2023
[   71.081403] ata37: SATA link down (SStatus 0 SControl 300)
[   71.088057] RIP: 0010:0x49f015b
[   71.088062] Code: Unable to access opcode bytes at 0x49f0131.
[   71.088063] RSP: 0018:ffffc90000003e68 EFLAGS: 00010202
[   71.088066] RAX: 0000000000000001 RBX: 0000000000000101 RCX: 0000000000000000
[   71.088067] RDX: ffffffffb2b71c32 RSI: ffffffffb2b71ca0 RDI: ffff8881eaae09e8
[   71.088068] RBP: ffffc90000003ec8 R08: 0000000000000000 R09: 0000000000000001
[   71.088069] R10: 0000000000000001 R11: 0000000000000000 R12: ffff8881eaae09e8
[   71.088070] R13: 00000000049f015b R14: 00000000ffff16c0 R15: ffff888fd59e2c40
[   71.088071] FS:  0000000000000000(0000) GS:ffff888fd5800000(0000) knlGS:0000000000000000
[   71.088073] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   71.165120] CR2: 00000000049f015b CR3: 00000001e4d96003 CR4: 0000000000770ef0
[   71.173082] PKRU: 55555554
[   71.176086] Call Trace:
[   71.178810]  <IRQ>
[   71.181050]  ? show_regs+0x6e/0x80
[   71.184845]  ? __die+0x29/0x70
[   71.188250]  ? page_fault_oops+0x160/0x470
[   71.192818]  ? sched_clock_noinstr+0xd/0x20
[   71.197486]  ? do_user_addr_fault+0x327/0x8c0
[   71.202346]  ? exc_page_fault+0x88/0x210
[   71.206720]  ? asm_exc_page_fault+0x2b/0x30
[   71.211387]  ? is_dynamic_key+0x52/0x180
[   71.215760]  ? is_dynamic_key+0xc0/0x180
[   71.220139]  ? srso_alias_return_thunk+0x5/0xfbef5
[   71.225485]  ? call_timer_fn+0xac/0x220
[   71.229764]  ? kobject_uevent_env+0xc8/0x7f0
[   71.234529]  ? __hid_register_driver+0x6a/0xa0 [hid]
[   71.240071]  ? do_one_initcall+0x61/0x380
[   71.244549]  __run_timers+0x210/0x2d0
[   71.248636]  ? srso_alias_return_thunk+0x5/0xfbef5
[   71.253979]  ? srso_alias_return_thunk+0x5/0xfbef5
[   71.259320]  ? native_apic_msr_write+0x34/0x40
[   71.264275]  ? srso_alias_return_thunk+0x5/0xfbef5
[   71.269617]  ? lapic_next_event+0x19/0x30
[   71.274088]  ? srso_alias_return_thunk+0x5/0xfbef5
[   71.279430]  ? clockevents_program_event+0x99/0x100
[   71.284871]  run_timer_softirq+0x21/0x40
[   71.289244]  __do_softirq+0xc6/0x3cf
[   71.293231]  __irq_exit_rcu+0x80/0xb0
[   71.297314]  irq_exit_rcu+0x12/0x20
[   71.301202]  sysvec_apic_timer_interrupt+0x84/0x90
[   71.306549]  </IRQ>
[   71.308887]  <TASK>
[   71.311224]  asm_sysvec_apic_timer_interrupt+0x1f/0x30
[   71.316957] RIP: 0010:cpuidle_enter_state+0x105/0x500
[   71.322590] Code: 48 0f a3 05 fd 09 0b 01 0f 82 ec 02 00 00 31 ff e8 d0 20 f9 fe 80 7d d7 00 0f 85 bb 02 00 00 e8 71 52 0c ff fb 0f 1f 44 00 00 <45> 85 ff 0f 88 da 01 00 00 49 63 d7 4c 89 f1 48 2b 4d c8 48 8d 04
[   71.343544] RSP: 0018:ffffffffb4603de0 EFLAGS: 00000206
[   71.349373] RAX: 0000000000256feb RBX: ffff88819f6b1000 RCX: 000000000000001f
[   71.357332] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffffb3bb62bf
[   71.365290] RBP: ffffffffb4603e18 R08: 0000000000000001 R09: 0000000000000001
[   71.373239] R10: 0000000000000001 R11: ffffffffb4b69b80 R12: 0000000000000001
[   71.381198] R13: ffffffffb4b69b80 R14: 000000108a7a5b87 R15: 0000000000000001
[   71.389164]  ? cpuidle_enter_state+0xff/0x500
[   71.394033]  cpuidle_enter+0x32/0x50
[   71.398022]  call_cpuidle+0x23/0x50
[   71.401913]  do_idle+0x1f7/0x250
[   71.405512]  cpu_startup_entry+0x31/0x40
[   71.409274] ata38: SATA link down (SStatus 0 SControl 300)
[   71.409887]  rest_init+0xfd/0x1a0
[   71.419701]  arch_call_rest_init+0x12/0x50
[   71.424270]  start_kernel+0x67e/0x7b0
[   71.428353]  x86_64_start_reservations+0x1c/0x30
[   71.433503]  x86_64_start_kernel+0x80/0x80
[   71.438069]  secondary_startup_64_no_verify+0x16b/0x16b
[   71.443904]  </TASK>
[   71.446335] Modules linked in: crct10dif_pclmul crc32_pclmul ghash_clmulni_intel sha512_ssse3 sha256_ssse3 sha1_ssse3 dax_hmem ast i2c_algo_bit drm_shmem_helper hid_generic drm_kms_helper uas usbhid usb_storage nvme drm hid ahci(+) libahci i2c_piix4 nvme_core wmi aesni_intel crypto_simd cryptd
[   71.475364] CR2: 00000000049f015b
[   71.479060] ---[ end trace 0000000000000000 ]---
[   71.484207] RIP: 0010:0x49f015b
[   71.487709] Code: Unable to access opcode bytes at 0x49f0131.
[   71.494118] RSP: 0018:ffffc90000003e68 EFLAGS: 00010202
[   71.499949] RAX: 0000000000000001 RBX: 0000000000000101 RCX: 0000000000000000
[   71.507908] RDX: ffffffffb2b71c32 RSI: ffffffffb2b71ca0 RDI: ffff8881eaae09e8
[   71.515857] RBP: ffffc90000003ec8 R08: 0000000000000000 R09: 0000000000000001
[   71.523815] R10: 0000000000000001 R11: 0000000000000000 R12: ffff8881eaae09e8
[   71.531765] R13: 00000000049f015b R14: 00000000ffff16c0 R15: ffff888fd59e2c40
[   71.539725] FS:  0000000000000000(0000) GS:ffff888fd5800000(0000) knlGS:0000000000000000
[   71.548750] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   71.555157] CR2: 00000000049f015b CR3: 00000001e4d96003 CR4: 0000000000770ef0
[   71.563118] PKRU: 55555554
[   71.566134] Kernel panic - not syncing: Fatal exception in interrupt
[   71.573325] Kernel Offset: disabled
[   71.577222] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---

I tried with CPA_DEBUG=n and page_poison=1, and get similar results,
this time with a search_bpf_extables timer:

[   57.022599] ------------[ cut here ]------------
[   57.027814] list_del corruption. prev->next should be ffff8881e9344a08, but was ffff8881a64c2c08. (prev=ffff8881a1d8d4a8)
[   57.040052] WARNING: CPU: 48 PID: 1205 at lib/list_debug.c:62 __list_del_entry_valid_or_report+0xc0/0xf0
[   57.050640] Modules linked in: nvme drm hid usb_storage ahci(+) libahci i2c_piix4 nvme_core wmi aesni_intel crypto_simd cryptd
[   57.063381] CPU: 48 PID: 1205 Comm: kworker/48:1 Not tainted 6.6.0+ #4
[   57.070666] Hardware name: AMD Corporation ONYX/ONYX, BIOS ROX100AB 09/14/2023
[   57.078725] Workqueue: events blkg_free_workfn
[   57.083686] RIP: 0010:__list_del_entry_valid_or_report+0xc0/0xf0
[   57.090390] Code: b1 00 48 89 ca 48 c7 c7 40 f7 04 92 e8 99 92 8d ff 0f 0b 31 c0 5d e9 7a 1c b1 00 4c 89 c2 48 c7 c7 78 f7 04 92 e8 80 92 8d ff <0f> 0b 31 c0 5d e9 61 1c b1 00 48 89 d1 4c 89 c6 4c 89 ca 48 c7 c7
[   57.111346] RSP: 0018:ffffc90005163dd8 EFLAGS: 00010082
[   57.117176] RAX: 0000000000000000 RBX: ffff8881e9344a08 RCX: c0000000ffefffff
[   57.125139] RDX: 0000000000000000 RSI: 00000000004ffffb RDI: 0000000000000001
[   57.133101] RBP: ffffc90005163dd8 R08: 0000000000000000 R09: 00000000ffefffff
[   57.141061] R10: ffffc90005163c40 R11: ffff888fd37fffe8 R12: ffff8881e9344b58
[   57.149023] R13: ffff8881a1d8d1e0 R14: ffff8881e9344a00 R15: ffff8881a1d8d4b8
[   57.156986] FS:  0000000000000000(0000) GS:ffff888fe1800000(0000) knlGS:0000000000000000
[   57.166015] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   57.172423] CR2: 0000000000000000 CR3: 00000001dbeb0002 CR4: 0000000000770ef0
[   57.180385] PKRU: 55555554
[   57.183400] Call Trace:
[   57.186124]  <TASK>
[   57.188463]  ? show_regs+0x6e/0x80
[   57.192260]  ? __list_del_entry_valid_or_report+0xc0/0xf0
[   57.198286]  ? __warn+0x91/0x190
[   57.201883]  ? __list_del_entry_valid_or_report+0xc0/0xf0
[   57.207912]  ? report_bug+0x19d/0x1b0
[   57.211999]  ? srso_alias_return_thunk+0x5/0xfbef5
[   57.217345]  ? console_unlock+0x70/0x170
[   57.221726]  ? handle_bug+0x46/0x80
[   57.225621]  ? exc_invalid_op+0x1d/0x80
[   57.229902]  ? asm_exc_invalid_op+0x1f/0x30
[   57.234584]  ? __list_del_entry_valid_or_report+0xc0/0xf0
[   57.240612]  ? __list_del_entry_valid_or_report+0xc0/0xf0
[   57.246636]  blkg_free_workfn+0x9e/0x120
[   57.251017]  process_one_work+0x229/0x530
[   57.255490]  ? process_one_work+0x1c9/0x530
[   57.260166]  worker_thread+0x1f0/0x3f0
[   57.264352]  ? __pfx_worker_thread+0x10/0x10
[   57.269114]  kthread+0x109/0x140
[   57.272714]  ? __pfx_kthread+0x10/0x10
[   57.276899]  ret_from_fork+0x3d/0x60
[   57.280887]  ? __pfx_kthread+0x10/0x10
[   57.285071]  ret_from_fork_asm+0x1b/0x30
[   57.289465]  </TASK>
[   57.291902] irq event stamp: 220
[   57.295501] hardirqs last  enabled at (219): [<ffffffff917cf9ac>] _raw_spin_unlock_irq+0x2c/0x60
[   57.305307] hardirqs last disabled at (220): [<ffffffff917cf60a>] _raw_spin_lock_irq+0x7a/0xa0
[   57.314920] softirqs last  enabled at (0): [<ffffffff906c8c93>] copy_process+0x993/0x2150
[   57.324049] softirqs last disabled at (0): [<0000000000000000>] 0x0
[   57.331042] ---[ end trace 0000000000000000 ]---
[   57.336966] sd 0:0:0:0: [sda] Attached SCSI removable disk
[   57.450729] nvme nvme0: pci function 0000:01:00.0
[   57.484158] nvme nvme0: missing or invalid SUBNQN field.
[   57.491162] nvme nvme0: Shutdown timeout set to 8 seconds
[   57.710887] nvme nvme0: 32/0/0 default/read/poll queues
[   58.023325]  nvme0n1: p1 p2 p3
[   58.357570] ata2: SATA link down (SStatus 0 SControl 300)
[   58.677585] ata3: SATA link down (SStatus 0 SControl 300)
[   58.997585] ata4: SATA link down (SStatus 0 SControl 300)
[   59.317587] ata5: SATA link down (SStatus 0 SControl 300)
[   59.641530] ata6: SATA link down (SStatus 0 SControl 300)
[   59.961532] ata7: SATA link down (SStatus 0 SControl 300)
[   60.281444] ata8: SATA link down (SStatus 0 SControl 300)
[   60.318183] usbcore: registered new interface driver uas
[   60.344026] usbcore: registered new interface driver usbhid
[   60.350257] usbhid: USB HID core driver
[   60.382719] ast 0000:c2:00.0: vgaarb: deactivate vga console
[   60.431023] ast 0000:c2:00.0: [drm] Using default configuration
[   60.437638] ast 0000:c2:00.0: [drm] AST 2600 detected
[   60.443284] ast 0000:c2:00.0: [drm] Using ASPEED DisplayPort transmitter
[   60.450767] ast 0000:c2:00.0: [drm] dram MCLK=396 Mhz type=1 bus_width=16
[   60.463222] ASTDEBUG poll init delayed work ffff8881e7c50998 timer ffff8881e7c509e8 drm_dev ffff8881e7c50000 timer flag 0x200000
[   60.485672] [drm] Initialized ast 0.1.0 20120228 for 0000:c2:00.0 on minor 0
[   60.503148] ASTDEBUG poll execute delayed_work ffff8881e7c50998, drm_dev ffff8881e7c50000
[   60.516208] fbcon: astdrmfb (fb0) is primary device
[   60.516213] fbcon: Deferring console take-over
[   60.530469] ast 0000:c2:00.0: [drm] fb0: astdrmfb frame buffer device
[   60.885460] ast 0000:c2:00.0: vgaarb: deactivate vga console
[   60.924095] ast 0000:c2:00.0: [drm] Using default configuration
[   60.930712] ast 0000:c2:00.0: [drm] AST 2600 detected
[   60.936357] ast 0000:c2:00.0: [drm] Using ASPEED DisplayPort transmitter
[   60.943844] ast 0000:c2:00.0: [drm] dram MCLK=396 Mhz type=1 bus_width=16
[   60.952695] ASTDEBUG poll init delayed work ffff8881e5bf0998 timer ffff8881e5bf09e8 drm_dev ffff8881e5bf0000 timer flag 0x200000
[   60.968842] [drm] Initialized ast 0.1.0 20120228 for 0000:c2:00.0 on minor 0
[   60.977201] ASTDEBUG poll execute delayed_work ffff8881e5bf0998, drm_dev ffff8881e5bf0000
[   60.981069] input: OpenBMC virtual_input as /devices/pci0000:00/0000:00:07.1/0000:02:00.4/usb3/3-2/3-2.6/3-2.6:1.0/0003:1D6B:0104.0002/input/input4
[   61.001141] fbcon: Deferring console take-over
[   61.006334] ast 0000:c2:00.0: [drm] fb0: astdrmfb frame buffer device
[   61.062541] hid-generic 0003:1D6B:0104.0002: input,hidraw0: USB HID v1.01 Keyboard [OpenBMC virtual_input] on usb-0000:02:00.4-2.6/input0
[   61.101190] ASTDEBUG poll execute delayed_work ffff8881e5bf0998, drm_dev ffff8881e5bf0000
[   61.210160] input: OpenBMC virtual_input as /devices/pci0000:00/0000:00:07.1/0000:02:00.4/usb3/3-2/3-2.6/3-2.6:1.0/0003:1D6B:0104.0002/input/input5
[   61.217194] ahci 0000:c5:00.0: SSS flag set, parallel bus scan disabled
[   61.232375] ahci 0000:c5:00.0: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0xff impl SATA mode
[   61.241518] ahci 0000:c5:00.0: flags: 64bit ncq sntf ilck stag pm led clo only pmp fbs pio slum part sxs
[   61.270718] scsi host1: ahci
[   61.278801] scsi host2: ahci
[   61.284291] hid-generic 0003:1D6B:0104.0002: input,hidraw0: USB HID v1.01 Keyboard [OpenBMC virtual_input] on usb-0000:02:00.4-2.6/input0
[   61.286090] scsi host3: ahci
[   61.302290] input: OpenBMC virtual_input as /devices/pci0000:00/0000:00:07.1/0000:02:00.4/usb3/3-2/3-2.6/3-2.6:1.1/0003:1D6B:0104.0004/input/input6
[   61.305911] scsi host4: ahci
[   61.318922] hid-generic 0003:1D6B:0104.0004: input,hidraw1: USB HID v1.01 Mouse [OpenBMC virtual_input] on usb-0000:02:00.4-2.6/input1
[   61.326353] scsi host5: ahci
[   61.341050] scsi host6: ahci
[   61.351426] scsi host7: ahci
[   61.358896] scsi host8: ahci
[   61.366483] ata9: SATA max UDMA/133 abar m2048@0xc5201000 port 0xc5201100 irq 81 lpm-pol 4
[   61.375775] ata10: SATA max UDMA/133 abar m2048@0xc5201000 port 0xc5201180 irq 82 lpm-pol 4
[   61.385102] ata11: SATA max UDMA/133 abar m2048@0xc5201000 port 0xc5201200 irq 83 lpm-pol 4
[   61.394529] ata12: SATA max UDMA/133 abar m2048@0xc5201000 port 0xc5201280 irq 84 lpm-pol 4
[   61.403856] ata13: SATA max UDMA/133 abar m2048@0xc5201000 port 0xc5201300 irq 85 lpm-pol 4
[   61.413282] ata14: SATA max UDMA/133 abar m2048@0xc5201000 port 0xc5201380 irq 86 lpm-pol 4
[   61.422610] ata15: SATA max UDMA/133 abar m2048@0xc5201000 port 0xc5201400 irq 87 lpm-pol 4
[   61.432029] ata16: SATA max UDMA/133 abar m2048@0xc5201000 port 0xc5201480 irq 88 lpm-pol 4
[   61.457636] input: OpenBMC virtual_input as /devices/pci0000:00/0000:00:07.1/0000:02:00.4/usb3/3-2/3-2.6/3-2.6:1.1/0003:1D6B:0104.0004/input/input7
[   61.463988] ahci 0000:c5:00.1: SSS flag set, parallel bus scan disabled
[   61.474018] hid-generic 0003:1D6B:0104.0004: input,hidraw1: USB HID v1.01 Mouse [OpenBMC virtual_input] on usb-0000:02:00.4-2.6/input1
[   61.479844] ahci 0000:c5:00.1: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0xff impl SATA mode
[   61.502421] ahci 0000:c5:00.1: flags: 64bit ncq sntf ilck stag pm led clo only pmp fbs pio slum part sxs
[   61.530718] scsi host9: ahci
[   61.537967] scsi host10: ahci
[   61.545114] scsi host11: ahci
[   61.552823] scsi host12: ahci
[   61.560240] scsi host13: ahci
[   61.567423] scsi host14: ahci
[   61.576228] scsi host15: ahci
[   61.583674] scsi host16: ahci
[   61.589052] ata17: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200100 irq 132 lpm-pol 4
[   61.598577] ata18: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200180 irq 133 lpm-pol 4
[   61.608001] ata19: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200200 irq 134 lpm-pol 4
[   61.617424] ata20: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200280 irq 135 lpm-pol 4
[   61.626847] ata21: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200300 irq 136 lpm-pol 4
[   61.636276] ata22: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200380 irq 137 lpm-pol 4
[   61.645701] ata23: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200400 irq 138 lpm-pol 4
[   61.655127] ata24: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200480 irq 139 lpm-pol 4
[   61.753545] ata9: SATA link down (SStatus 0 SControl 300)
[   61.977628] ata17: SATA link down (SStatus 0 SControl 300)
[   62.073595] ata10: SATA link down (SStatus 0 SControl 300)
[   62.393618] ata11: SATA link down (SStatus 0 SControl 300)
[   62.713609] ata12: SATA link down (SStatus 0 SControl 300)
[   63.033616] ata13: SATA link down (SStatus 0 SControl 300)
[   63.353634] ata14: SATA link down (SStatus 0 SControl 300)
[   63.673648] ata15: SATA link down (SStatus 0 SControl 300)
[   63.997404] ata16: SATA link down (SStatus 0 SControl 300)
[   64.317594] ata18: SATA link down (SStatus 0 SControl 300)
[   64.637626] ata19: SATA link down (SStatus 0 SControl 300)
[   64.957391] ata20: SATA link down (SStatus 0 SControl 300)
[   65.277639] ata21: SATA link down (SStatus 0 SControl 300)
[   65.597607] ata22: SATA link down (SStatus 0 SControl 300)
[   65.917636] ata23: SATA link down (SStatus 0 SControl 300)
[   66.237611] ata24: SATA link down (SStatus 0 SControl 300)
[   66.527698] ahci 0000:c5:00.1: SSS flag set, parallel bus scan disabled
[   66.535155] ahci 0000:c5:00.1: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0xff impl SATA mode
[   66.544282] ahci 0000:c5:00.1: flags: 64bit ncq sntf ilck stag pm led clo only pmp fbs pio slum part sxs
[   66.572309] scsi host9: ahci
[   66.579580] scsi host10: ahci
[   66.586726] scsi host11: ahci
[   66.593969] scsi host12: ahci
[   66.601191] scsi host13: ahci
[   66.608350] scsi host14: ahci
[   66.615512] scsi host15: ahci
[   66.623002] scsi host16: ahci
[   66.628507] ata25: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200100 irq 132 lpm-pol 4
[   66.637951] ata26: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200180 irq 133 lpm-pol 4
[   66.647462] ata27: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200200 irq 134 lpm-pol 4
[   66.656887] ata28: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200280 irq 135 lpm-pol 4
[   66.666310] ata29: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200300 irq 136 lpm-pol 4
[   66.675734] ata30: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200380 irq 137 lpm-pol 4
[   66.685158] ata31: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200400 irq 138 lpm-pol 4
[   66.694584] ata32: SATA max UDMA/133 abar m2048@0xc5200000 port 0xc5200480 irq 139 lpm-pol 4
[   66.723431] ahci 0000:03:00.0: SSS flag set, parallel bus scan disabled
[   66.730955] ahci 0000:03:00.0: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0xff impl SATA mode
[   66.740185] ahci 0000:03:00.0: flags: 64bit ncq sntf ilck stag pm led clo only pmp fbs pio slum part sxs
[   66.768564] scsi host17: ahci
[   66.775968] scsi host18: ahci
[   66.783314] scsi host19: ahci
[   66.790409] scsi host20: ahci
[   66.797716] scsi host21: ahci
[   66.804867] scsi host22: ahci
[   66.812181] scsi host23: ahci
[   66.819487] scsi host24: ahci
[   66.824870] ata33: SATA max UDMA/133 abar m2048@0xd6301000 port 0xd6301100 irq 149 lpm-pol 4
[   66.834351] ata34: SATA max UDMA/133 abar m2048@0xd6301000 port 0xd6301180 irq 150 lpm-pol 4
[   66.843776] ata35: SATA max UDMA/133 abar m2048@0xd6301000 port 0xd6301200 irq 151 lpm-pol 4
[   66.853201] ata36: SATA max UDMA/133 abar m2048@0xd6301000 port 0xd6301280 irq 152 lpm-pol 4
[   66.862628] ata37: SATA max UDMA/133 abar m2048@0xd6301000 port 0xd6301300 irq 153 lpm-pol 4
[   66.872060] ata38: SATA max UDMA/133 abar m2048@0xd6301000 port 0xd6301380 irq 154 lpm-pol 4
[   66.881492] ata39: SATA max UDMA/133 abar m2048@0xd6301000 port 0xd6301400 irq 155 lpm-pol 4
[   66.890924] ata40: SATA max UDMA/133 abar m2048@0xd6301000 port 0xd6301480 irq 156 lpm-pol 4
[   67.017618] ata25: SATA link down (SStatus 0 SControl 300)
[   67.213603] ata33: SATA link down (SStatus 0 SControl 300)
[   67.337572] ata26: SATA link down (SStatus 0 SControl 300)
[   67.657643] ata27: SATA link down (SStatus 0 SControl 300)
[   67.977637] ata28: SATA link down (SStatus 0 SControl 300)
[   68.297352] ata29: SATA link down (SStatus 0 SControl 300)
[   68.617644] ata30: SATA link down (SStatus 0 SControl 300)
[   68.937638] ata31: SATA link down (SStatus 0 SControl 300)
[   69.257623] ata32: SATA link down (SStatus 0 SControl 300)
[   69.577648] ata34: SATA link down (SStatus 0 SControl 300)
[   69.897639] ata35: SATA link down (SStatus 0 SControl 300)
[   70.217629] ata36: SATA link down (SStatus 0 SControl 300)
[   70.537599] ata37: SATA link down (SStatus 0 SControl 300)
[   70.786956] BUG: unable to handle page fault for address: ffff8881e7c509f0
[   70.794631] #PF: supervisor write access in kernel mode
[   70.800458] #PF: error_code(0x0002) - not-present page
[   70.806187] PGD b8f001067 P4D b8f001067 PUD 104c984067 PMD 104c845067 PTE 800ffffe183af060
[   70.815413] Oops: 0002 [#1] PREEMPT SMP DEBUG_PAGEALLOC NOPTI
[   70.821828] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W          6.6.0+ #4
[   70.830082] Hardware name: AMD Corporation ONYX/ONYX, BIOS ROX100AB 09/14/2023
[   70.838140] RIP: 0010:__run_timers+0xa4/0x2d0
[   70.843003] Code: 88 89 c1 83 e1 3f 01 d1 89 c9 49 0f b3 08 73 2c 48 8b 9d 78 ff ff ff 4c 8d 56 08 48 8d 3c cb 48 8b 0f 48 89 0e 48 85 c9 74 04 <48> 89 71 08 48 c7 07 00 00 00 00 41 83 c6 01 4c 89 d6 a8 07 75 0f
[   70.857498] ata38: SATA link down (SStatus 0 SControl 300)
[   70.863954] RSP: 0018:ffffc90000003ed8 EFLAGS: 00010086
[   70.863958] RAX: 0000000003fffc5a RBX: ffff888fd59e2cf0 RCX: ffff8881e7c509e8
[   70.863959] RDX: 0000000000000080 RSI: ffffc90000003ee8 RDI: ffff888fd59e31c0
[   70.863961] RBP: ffffc90000003f60 R08: ffff888fd59e2ca8 R09: 0000000000000001
[   70.863962] R10: ffffc90000003ef0 R11: 0000000000000000 R12: 0000000000000001
[   70.863963] R13: 0000000000000101 R14: 0000000000000000 R15: ffff888fd59e2c40
[   70.863964] FS:  0000000000000000(0000) GS:ffff888fd5800000(0000) knlGS:0000000000000000
[   70.863966] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   70.863967] CR2: ffff8881e7c509f0 CR3: 0000000b8923c003 CR4: 0000000000770ef0
[   70.939075] PKRU: 55555554
[   70.942090] Call Trace:
[   70.944814]  <IRQ>
[   70.947053]  ? show_regs+0x6e/0x80
[   70.950848]  ? __die+0x29/0x70
[   70.954252]  ? page_fault_oops+0x160/0x470
[   70.958821]  ? search_bpf_extables+0xb4/0x160
[   70.963679]  ? __run_timers+0xa4/0x2d0
[   70.967859]  ? srso_alias_return_thunk+0x5/0xfbef5
[   70.973202]  ? search_exception_tables+0x65/0x70
[   70.978351]  ? srso_alias_return_thunk+0x5/0xfbef5
[   70.983700]  ? kernelmode_fixup_or_oops+0xa2/0x120
[   70.989049]  ? __bad_area_nosemaphore+0x1a0/0x260
[   70.994299]  ? bad_area_nosemaphore+0x16/0x20
[   70.999156]  ? do_kern_addr_fault+0x7f/0xa0
[   71.003825]  ? exc_page_fault+0x13d/0x210
[   71.008299]  ? asm_exc_page_fault+0x2b/0x30
[   71.012962]  ? __run_timers+0xa4/0x2d0
[   71.017134]  ? __run_timers+0x37/0x2d0
[   71.021314]  ? seqcount_lockdep_reader_access.constprop.0+0x4d/0xc0
[   71.028306]  ? srso_alias_return_thunk+0x5/0xfbef5
[   71.033649]  ? srso_alias_return_thunk+0x5/0xfbef5
[   71.038991]  ? native_apic_msr_write+0x34/0x40
[   71.043947]  ? srso_alias_return_thunk+0x5/0xfbef5
[   71.049290]  ? lapic_next_event+0x19/0x30
[   71.053760]  ? srso_alias_return_thunk+0x5/0xfbef5
[   71.059101]  ? clockevents_program_event+0x99/0x100
[   71.064544]  run_timer_softirq+0x21/0x40
[   71.068915]  __do_softirq+0xc6/0x3cf
[   71.072898]  __irq_exit_rcu+0x80/0xb0
[   71.076982]  irq_exit_rcu+0x12/0x20
[   71.080869]  sysvec_apic_timer_interrupt+0x84/0x90
[   71.086212]  </IRQ>
[   71.088548]  <TASK>
[   71.090886]  asm_sysvec_apic_timer_interrupt+0x1f/0x30
[   71.096620] RIP: 0010:poll_idle+0x2d/0xb5
[   71.101090] Code: fa 55 48 89 e5 41 57 41 56 41 89 d6 41 55 49 89 f5 41 54 49 89 fc 53 e8 f1 d6 ff ff 41 80 24 24 fb 48 89 c3 fb 0f 1f 44 00 00 <65> 4c 8b 3c 25 80 55 1f 00 f0 41 80 4f 02 20 49 8b 07 a8 08 75 34
[   71.122042] RSP: 0018:ffffffff92203da8 EFLAGS: 00000206
[   71.127869] RAX: 000000107b3b08c3 RBX: 000000107b3b08c3 RCX: 000000000000001f
[   71.135828] RDX: 0000000000000000 RSI: 000000003b9fd717 RDI: fffffff46ab6fb55
[   71.143787] RBP: ffffffff92203dd0 R08: 000000107b3b08c3 R09: 0000000000000001
[   71.151746] R10: 0000000000000001 R11: 0000000000000000 R12: ffff88819e951c00
[   71.159707] R13: ffffffff92769b80 R14: 0000000000000000 R15: 0000000000000000
[   71.167674]  ? poll_idle+0x1f/0xb5
[   71.171471]  cpuidle_enter_state+0x9d/0x500
[   71.176139]  cpuidle_enter+0x32/0x50
[   71.180129]  call_cpuidle+0x23/0x50
[   71.184018]  do_idle+0x1f7/0x250
[   71.187617]  cpu_startup_entry+0x31/0x40
[   71.191990]  rest_init+0xfd/0x1a0
[   71.195685]  arch_call_rest_init+0x12/0x50
[   71.200255]  start_kernel+0x67e/0x7b0
[   71.204337]  x86_64_start_reservations+0x1c/0x30
[   71.209486]  x86_64_start_kernel+0x80/0x80
[   71.214053]  secondary_startup_64_no_verify+0x16b/0x16b
[   71.219887]  </TASK>
[   71.222318] Modules linked in: hid_generic ast i2c_algo_bit drm_shmem_helper drm_kms_helper usbhid uas crct10dif_pclmul crc32_pclmul ghash_clmulni_intel sha512_ssse3 sha256_ssse3 sha1_ssse3 dax_hmem nvme drm hid usb_storage ahci(+) libahci i2c_piix4 nvme_core wmi aesni_intel crypto_simd cryptd
[   71.251351] CR2: ffff8881e7c509f0
[   71.255048] ---[ end trace 0000000000000000 ]---
[   71.260197] RIP: 0010:__run_timers+0xa4/0x2d0
[   71.265058] Code: 88 89 c1 83 e1 3f 01 d1 89 c9 49 0f b3 08 73 2c 48 8b 9d 78 ff ff ff 4c 8d 56 08 48 8d 3c cb 48 8b 0f 48 89 0e 48 85 c9 74 04 <48> 89 71 08 48 c7 07 00 00 00 00 41 83 c6 01 4c 89 d6 a8 07 75 0f
[   71.286011] RSP: 0018:ffffc90000003ed8 EFLAGS: 00010086
[   71.291837] RAX: 0000000003fffc5a RBX: ffff888fd59e2cf0 RCX: ffff8881e7c509e8
[   71.299796] RDX: 0000000000000080 RSI: ffffc90000003ee8 RDI: ffff888fd59e31c0
[   71.307756] RBP: ffffc90000003f60 R08: ffff888fd59e2ca8 R09: 0000000000000001
[   71.315716] R10: ffffc90000003ef0 R11: 0000000000000000 R12: 0000000000000001
[   71.323678] R13: 0000000000000101 R14: 0000000000000000 R15: ffff888fd59e2c40
[   71.331638] FS:  0000000000000000(0000) GS:ffff888fd5800000(0000) knlGS:0000000000000000
[   71.340664] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   71.347075] CR2: ffff8881e7c509f0 CR3: 0000000b8923c003 CR4: 0000000000770ef0
[   71.355035] PKRU: 55555554
[   71.358049] Kernel panic - not syncing: Fatal exception in interrupt
[   71.365244] Kernel Offset: disabled
[   71.369141] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---

...so I think I need to dig deeper and bisect the original
blkg_free_workfn list_del corruption problem before assuming
drm/ast is the source of the BUG.

Thanks,

Kim
