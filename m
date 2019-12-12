Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE95A11D07D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 16:07:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791EA6E18E;
	Thu, 12 Dec 2019 15:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522C56E180;
 Thu, 12 Dec 2019 15:07:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxcrA4DPnj3R0raVYvlOxTXTzbm6JwQe9WaPIxjRwAvI5UwqvPDICIRBfGBSWoP+JBrBIIAWgAzofI9SZHokvCEGRd4cQS20/k5O1NAICOzFpIhcFFKbKQR2+Ie/UXzdA9/Efco/lfjhzdylT5EZ7KpyOtWfQwP4ypIYsgBne3RWmSjyK+GgTiICxvB/f44/FCX4+hEM0BKO6HL+XdIl6wAuxvVlo5u5H47KcdycDvwD0oDJgmKqTfv4NAiso6qz+FtidVnKdrXCfynsoo4pQFgGPqhemgl1OpDec1tNzWYJusdHT76nEX70RJbyAxb8k5ZRSxYV7NAHjJG5NSYvBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmgUjU/xtTcdfONRvEhFvTt1gY744k/RKA+gYEbGUiE=;
 b=G1Gt9T0p5f7xo0KhRvyVRQMC26nPXUxu7teWPSoko2VbNO7a/ZQM1knFdunP1E8egs5RwgLxQqoBK9g1akhq9KAazdNk2HR7t1kDfJeoGbOTV4FmUu7tCQXxzA+A+PybHgNu6Gnm6qllETQL1mnERjrl49IKGw7e30KO02L1KcLMujSOs0Ml+DCNcPXcFDtahWgd5OMAeUTuiiGi0LO9bSGpZFRwaI+C0HL0LxMIUHhh1solLfa6Z5iYq+My4v/8irZUP17Z4ZFVxXpN8iunlN74ycKFu1k/ibipOa8AZK5B17S80jUUvKO00ujvNQmAQmdk1KNNgzYVtsqCmtbuhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wmgUjU/xtTcdfONRvEhFvTt1gY744k/RKA+gYEbGUiE=;
 b=vTY5CROO1qzbr/NfQHy0RtBpjPY4ecpzZy5er/oWjJVwIrc7+5Or9lHu5e+Pi0uQWZ2WYck6DuanQX3y09kNTywc2jnXHRKYSb+/i0tPCwWfcMXxQgmnt+++swsZt7DJdR47EncDQus3qSc7cezZBWqawxCkorn5Juc4Er4q8vM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1341.namprd12.prod.outlook.com (10.169.205.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.17; Thu, 12 Dec 2019 15:07:23 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::514b:dbf8:d19f:a80]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::514b:dbf8:d19f:a80%12]) with mapi id 15.20.2538.016; Thu, 12 Dec 2019
 15:07:23 +0000
Subject: Re: [RESEND PATCH 2/5] drm: Add Reusable task barrier.
To: "Ma, Le" <Le.Ma@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1576096732-3596-1-git-send-email-andrey.grodzovsky@amd.com>
 <1576096732-3596-2-git-send-email-andrey.grodzovsky@amd.com>
 <MN2PR12MB4285F713BEE4E4BC2E3F3F39F6550@MN2PR12MB4285.namprd12.prod.outlook.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <a45930cd-f021-ee63-c44d-8bef569e3f9f@amd.com>
Date: Thu, 12 Dec 2019 10:07:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <MN2PR12MB4285F713BEE4E4BC2E3F3F39F6550@MN2PR12MB4285.namprd12.prod.outlook.com>
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0058.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::35) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
MIME-Version: 1.0
X-Originating-IP: [2607:fea8:3edf:e127:3a1e:65e:fc37:38e9]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7da40e1d-46d1-4e9f-0872-08d77f14fdc3
X-MS-TrafficTypeDiagnostic: MWHPR12MB1341:|MWHPR12MB1341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1341FE501AAA471C0082957CEA550@MWHPR12MB1341.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0249EFCB0B
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39830400003)(346002)(376002)(396003)(366004)(199004)(189003)(13464003)(53546011)(52116002)(6506007)(186003)(36756003)(6512007)(2616005)(450100002)(54906003)(4326008)(508600001)(110136005)(31686004)(33964004)(31696002)(2906002)(8936002)(66556008)(81166006)(86362001)(66946007)(5660300002)(8676002)(6486002)(66476007)(81156014)(30864003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1341;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1X0KCUvCGCChqTBsFTQTL8bPKSM73K0/fdWQve9eblobFpwCrSsp2aIHiQBsy2lPMwmJc+Fo4CBDbD2SLDvSTlBHGSfFQvCHXccrKm8LoZYFHDX88vnjcbVhdl+QmZ0MWRAfUhBuh1kgTz+nleFFGABHF9lbek+UM64t0TgNEjBMR3UwAgm5xsG+4xbBy7G3rgNDBiXmEtyjB2M1DcoVDRVsgENio+mVuIF8HCEvyrwlnfcAnsJ4NXAQOsQCBsD58r7kBJda1yKLXXb5yDY3lD9TK834lZZK1ZvbJjHLGs19L2cQiivSykpH4qPX1RA0X4B5oOvX6LGKkGjujW/HA+J8ayzE1Ou2Ewk3eHZMkPiNJxViCbQFKnUunl/iY65VRMDxM/l9QM2jL3NqQTSdQwoX4LLKmywgr3t9oBTnbXWhMIF/bLEGeKFcp2YAHmzBS1Mv2qqXvEjNtKFE6zD51WGP6EuxB9cXpt+ZIA5uymYraqHIAU+R1gBPDJPyVn5H
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da40e1d-46d1-4e9f-0872-08d77f14fdc3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2019 15:07:23.3073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: momw83947izgZxccbG0kFzoMdY7Lgwir4rHnRq7Nn3azIrgaf92MYB4UndQ6F8pwAL5dhBK5Z0epcunZH/5Ufw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1341
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============2050937910=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2050937910==
Content-Type: multipart/alternative;
 boundary="------------9884471CDF8D2917872047BE"
Content-Language: en-US

--------------9884471CDF8D2917872047BE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/11/19 11:04 PM, Ma, Le wrote:
>
> [AMD Official Use Only - Internal Distribution Only]
>
> -----Original Message-----
> From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Sent: Thursday, December 12, 2019 4:39 AM
> To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Ma, Le 
> <Le.Ma@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>; Quan, Evan 
> <Evan.Quan@amd.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> Subject: [RESEND PATCH 2/5] drm: Add Reusable task barrier.
>
> It is used to synchronize N threads at a rendevouz point before 
> execution of critical code that has to be started by all the threads 
> at approximatly the same time.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com 
> <mailto:andrey.grodzovsky@amd.com>>
>
> ---
>
> include/drm/task_barrier.h | 106 
> +++++++++++++++++++++++++++++++++++++++++++++
>
> 1 file changed, 106 insertions(+)
>
> create mode 100644 include/drm/task_barrier.h
>
> diff --git a/include/drm/task_barrier.h b/include/drm/task_barrier.h 
> new file mode 100644 index 0000000..81fb0f7
>
> --- /dev/null
>
> +++ b/include/drm/task_barrier.h
>
> @@ -0,0 +1,106 @@
>
> +/*
>
> + * Copyright 2019 Advanced Micro Devices, Inc.
>
> + *
>
> + * Permission is hereby granted, free of charge, to any person
>
> +obtaining a
>
> + * copy of this software and associated documentation files (the
>
> +"Software"),
>
> + * to deal in the Software without restriction, including without
>
> +limitation
>
> + * the rights to use, copy, modify, merge, publish, distribute,
>
> +sublicense,
>
> + * and/or sell copies of the Software, and to permit persons to whom
>
> +the
>
> + * Software is furnished to do so, subject to the following conditions:
>
> + *
>
> + * The above copyright notice and this permission notice shall be
>
> +included in
>
> + * all copies or substantial portions of the Software.
>
> + *
>
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>
> +EXPRESS OR
>
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
>
> +MERCHANTABILITY,
>
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT
>
> +SHALL
>
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM,
>
> +DAMAGES OR
>
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
>
> +OTHERWISE,
>
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
>
> +OR
>
> + * OTHER DEALINGS IN THE SOFTWARE.
>
> + *
>
> + */
>
> +#include <linux/semaphore.h>
>
> +#include <linux/atomic.h>
>
> +
>
> +/*
>
> + * Reusable 2 PHASE task barrier (randevouz point) implementation for 
> N tasks.
>
> + * Based on the Little book of sempahores -
>
> +https://greenteapress.com/wp/semaphores/
>
> + */
>
> +
>
> +
>
> +
>
> +#ifndef DRM_TASK_BARRIER_H_
>
> +#define DRM_TASK_BARRIER_H_
>
> +
>
> [Le]: It might be better to prefix “drm_” to the functions and 
> structure below, even this header file name.
>

I am not sure about this - see the example of spsc_queue we added for 
GPU scheduler use. I just followed it as an example of where to place 
the structure. There is nothing DRM specific about spsc_queue or 
task_barrier, they are generic constructs that we place in DRM subsystem 
for common use.


> +/*
>
> + * Represents an instance of a task barrier.
>
> + */
>
> +struct task_barrier {
>
> +          unsigned int n;
>
> [Le]: We can define it as signed type here for more common use.
>

This is a counter of number of tasks/threads to synchronize in the 
barrier it cannot go bellow 0

Andrey


> +          atomic_t count;
>
> +          struct semaphore enter_turnstile;
>
> +          struct semaphore exit_turnstile;
>
> +};
>
> +
>
> +static inline void task_barrier_signal_turnstile(struct semaphore 
> *turnstile,
>
> + unsigned int n)
>
> +{
>
> +          int i;
>
> +
>
> +          for (i = 0 ; i < n; i++)
>
> +                      up(turnstile);
>
> +}
>
> +
>
> +static inline void task_barrier_init(struct task_barrier *tb) {
>
> +          tb->n = 0;
>
> +          atomic_set(&tb->count, 0);
>
> + sema_init(&tb->enter_turnstile, 0);
>
> + sema_init(&tb->exit_turnstile, 0);
>
> +}
>
> +
>
> +static inline void task_barrier_add_task(struct task_barrier *tb) {
>
> +          tb->n++;
>
> +}
>
> +
>
> +static inline void task_barrier_rem_task(struct task_barrier *tb) {
>
> +          tb->n--;
>
> +}
>
> +
>
> +/*
>
> + * Lines up all the threads BEFORE the critical point.
>
> + *
>
> + * When all thread passed this code the entry barrier is back to 
> locked state.
>
> + */
>
> +static inline void task_barrier_enter(struct task_barrier *tb) {
>
> +          if (atomic_inc_return(&tb->count) == tb->n)
>
> + task_barrier_signal_turnstile(&tb->enter_turnstile, tb->n);
>
> +
>
> + down(&tb->enter_turnstile);
>
> +}
>
> +
>
> +/*
>
> + * Lines up all the threads AFTER the critical point.
>
> + *
>
> + * This function is used to avoid any one thread running ahead of the
>
> +reset if
>
> [Le]: No need to mention “reset” here.
>
> With the above addressed, Acked-by: Le Ma Le.Ma@amd.com 
> <mailto:Le.Ma@amd.com>
>
> Regards,
>
> Ma Le
>
> + * the barrier is used in a loop (repeatedly) .
>
> + */
>
> +static inline void task_barrier_exit(struct task_barrier *tb) {
>
> +          if (atomic_dec_return(&tb->count) == 0)
>
> + task_barrier_signal_turnstile(&tb->exit_turnstile, tb->n);
>
> +
>
> + down(&tb->exit_turnstile);
>
> +}
>
> +
>
> +static inline void task_barrier_full(struct task_barrier *tb) {
>
> +          task_barrier_enter(tb);
>
> +          task_barrier_exit(tb);
>
> +}
>
> +
>
> +#endif
>
> --
>
> 2.7.4
>

--------------9884471CDF8D2917872047BE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/11/19 11:04 PM, Ma, Le wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:MN2PR12MB4285F713BEE4E4BC2E3F3F39F6550@MN2PR12MB4285.namprd12.prod.outlook.com">
      
      <meta name="Generator" content="Microsoft Word 15 (filtered
        medium)">
      <style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:14.0pt;
	font-family:"Calibri",sans-serif;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
p.msipheadera92e061b, li.msipheadera92e061b, div.msipheadera92e061b
	{mso-style-name:msipheadera92e061b;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle21
	{mso-style-type:personal-compose;
	font-family:"Arial",sans-serif;
	color:#0078D7;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]-->
      <div class="WordSection1">
        <p class="msipheadera92e061b" style="margin:0in;margin-bottom:.0001pt"><span style="font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#0078D7">[AMD
            Official Use Only - Internal Distribution Only]</span><o:p></o:p></p>
        <p class="MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
        <p class="MsoPlainText">-----Original Message-----<br>
          From: Andrey Grodzovsky <a class="moz-txt-link-rfc2396E" href="mailto:andrey.grodzovsky@amd.com">&lt;andrey.grodzovsky@amd.com&gt;</a> <br>
          Sent: Thursday, December 12, 2019 4:39 AM<br>
          To: <a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.org</a>;
          <a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a><br>
          Cc: Deucher, Alexander <a class="moz-txt-link-rfc2396E" href="mailto:Alexander.Deucher@amd.com">&lt;Alexander.Deucher@amd.com&gt;</a>; Ma,
          Le <a class="moz-txt-link-rfc2396E" href="mailto:Le.Ma@amd.com">&lt;Le.Ma@amd.com&gt;</a>; Zhang, Hawking
          <a class="moz-txt-link-rfc2396E" href="mailto:Hawking.Zhang@amd.com">&lt;Hawking.Zhang@amd.com&gt;</a>; Quan, Evan
          <a class="moz-txt-link-rfc2396E" href="mailto:Evan.Quan@amd.com">&lt;Evan.Quan@amd.com&gt;</a>; Grodzovsky, Andrey
          <a class="moz-txt-link-rfc2396E" href="mailto:Andrey.Grodzovsky@amd.com">&lt;Andrey.Grodzovsky@amd.com&gt;</a><br>
          Subject: [RESEND PATCH 2/5] drm: Add Reusable task barrier.<o:p></o:p></p>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
        <p class="MsoPlainText">It is used to synchronize N threads at a
          rendevouz point before execution of critical code that has to
          be started by all the threads at approximatly the same time.<o:p></o:p></p>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
        <p class="MsoPlainText">Signed-off-by: Andrey Grodzovsky &lt;<a href="mailto:andrey.grodzovsky@amd.com" moz-do-not-send="true"><span style="color:windowtext;text-decoration:none">andrey.grodzovsky@amd.com</span></a>&gt;<o:p></o:p></p>
        <p class="MsoPlainText">---<o:p></o:p></p>
        <p class="MsoPlainText">include/drm/task_barrier.h | 106
          &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></p>
        <p class="MsoPlainText">1 file changed, 106 insertions(&#43;)<o:p></o:p></p>
        <p class="MsoPlainText">create mode 100644
          include/drm/task_barrier.h<o:p></o:p></p>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
        <p class="MsoPlainText">diff --git a/include/drm/task_barrier.h
          b/include/drm/task_barrier.h new file mode 100644 index
          0000000..81fb0f7<o:p></o:p></p>
        <p class="MsoPlainText">--- /dev/null<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&#43;&#43; b/include/drm/task_barrier.h<o:p></o:p></p>
        <p class="MsoPlainText">@@ -0,0 &#43;1,106 @@<o:p></o:p></p>
        <p class="MsoPlainText">&#43;/*<o:p></o:p></p>
        <p class="MsoPlainText">&#43; * Copyright 2019 Advanced Micro
          Devices, Inc.<o:p></o:p></p>
        <p class="MsoPlainText">&#43; *<o:p></o:p></p>
        <p class="MsoPlainText">&#43; * Permission is hereby granted, free
          of charge, to any person
          <o:p></o:p></p>
        <p class="MsoPlainText">&#43;obtaining a<o:p></o:p></p>
        <p class="MsoPlainText">&#43; * copy of this software and associated
          documentation files (the
          <o:p></o:p></p>
        <p class="MsoPlainText">&#43;&quot;Software&quot;),<o:p></o:p></p>
        <p class="MsoPlainText">&#43; * to deal in the Software without
          restriction, including without
          <o:p></o:p></p>
        <p class="MsoPlainText">&#43;limitation<o:p></o:p></p>
        <p class="MsoPlainText">&#43; * the rights to use, copy, modify,
          merge, publish, distribute,
          <o:p></o:p></p>
        <p class="MsoPlainText">&#43;sublicense,<o:p></o:p></p>
        <p class="MsoPlainText">&#43; * and/or sell copies of the Software,
          and to permit persons to whom
          <o:p></o:p></p>
        <p class="MsoPlainText">&#43;the<o:p></o:p></p>
        <p class="MsoPlainText">&#43; * Software is furnished to do so,
          subject to the following conditions:<o:p></o:p></p>
        <p class="MsoPlainText">&#43; *<o:p></o:p></p>
        <p class="MsoPlainText">&#43; * The above copyright notice and this
          permission notice shall be
          <o:p></o:p></p>
        <p class="MsoPlainText">&#43;included in<o:p></o:p></p>
        <p class="MsoPlainText">&#43; * all copies or substantial portions
          of the Software.<o:p></o:p></p>
        <p class="MsoPlainText">&#43; *<o:p></o:p></p>
        <p class="MsoPlainText">&#43; * THE SOFTWARE IS PROVIDED &quot;AS IS&quot;,
          WITHOUT WARRANTY OF ANY KIND,
          <o:p></o:p></p>
        <p class="MsoPlainText">&#43;EXPRESS OR<o:p></o:p></p>
        <p class="MsoPlainText">&#43; * IMPLIED, INCLUDING BUT NOT LIMITED
          TO THE WARRANTIES OF
          <o:p></o:p></p>
        <p class="MsoPlainText">&#43;MERCHANTABILITY,<o:p></o:p></p>
        <p class="MsoPlainText">&#43; * FITNESS FOR A PARTICULAR PURPOSE AND
          NONINFRINGEMENT.&nbsp; IN NO EVENT
          <o:p></o:p></p>
        <p class="MsoPlainText">&#43;SHALL<o:p></o:p></p>
        <p class="MsoPlainText">&#43; * THE COPYRIGHT HOLDER(S) OR AUTHOR(S)
          BE LIABLE FOR ANY CLAIM,
          <o:p></o:p></p>
        <p class="MsoPlainText">&#43;DAMAGES OR<o:p></o:p></p>
        <p class="MsoPlainText">&#43; * OTHER LIABILITY, WHETHER IN AN
          ACTION OF CONTRACT, TORT OR
          <o:p></o:p></p>
        <p class="MsoPlainText">&#43;OTHERWISE,<o:p></o:p></p>
        <p class="MsoPlainText">&#43; * ARISING FROM, OUT OF OR IN
          CONNECTION WITH THE SOFTWARE OR THE USE
          <o:p></o:p></p>
        <p class="MsoPlainText">&#43;OR<o:p></o:p></p>
        <p class="MsoPlainText">&#43; * OTHER DEALINGS IN THE SOFTWARE.<o:p></o:p></p>
        <p class="MsoPlainText">&#43; *<o:p></o:p></p>
        <p class="MsoPlainText">&#43; */<o:p></o:p></p>
        <p class="MsoPlainText">&#43;#include &lt;linux/semaphore.h&gt;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;#include &lt;linux/atomic.h&gt;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;/*<o:p></o:p></p>
        <p class="MsoPlainText">&#43; * Reusable 2 PHASE task barrier
          (randevouz point) implementation for N tasks.<o:p></o:p></p>
        <p class="MsoPlainText">&#43; * Based on the Little book of
          sempahores - <o:p></o:p></p>
        <p class="MsoPlainText">&#43;https://greenteapress.com/wp/semaphores/<o:p></o:p></p>
        <p class="MsoPlainText">&#43; */<o:p></o:p></p>
        <p class="MsoPlainText">&#43;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;#ifndef DRM_TASK_BARRIER_H_<o:p></o:p></p>
        <p class="MsoPlainText">&#43;#define DRM_TASK_BARRIER_H_<o:p></o:p></p>
        <p class="MsoPlainText">&#43;<o:p></o:p></p>
        <p class="MsoPlainText"><span style="color:black"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoPlainText"><span style="color:#203864">[Le]: It
            might be better to prefix “drm_” to the functions and
            structure below, even this header file name.
          </span></p>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>I am not sure about this - see the example of spsc_queue we added
      for GPU scheduler use. I just followed it as an example of where
      to place the structure. There is nothing DRM specific about&nbsp;
      spsc_queue or task_barrier, they are generic constructs that we
      place in DRM subsystem for common use.</p>
    <p> <br>
    </p>
    <blockquote type="cite" cite="mid:MN2PR12MB4285F713BEE4E4BC2E3F3F39F6550@MN2PR12MB4285.namprd12.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoPlainText"><span style="color:#203864"><o:p></o:p></span></p>
        <p class="MsoPlainText"><span style="color:black"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoPlainText">&#43;/*<o:p></o:p></p>
        <p class="MsoPlainText">&#43; * Represents an instance of a task
          barrier.<o:p></o:p></p>
        <p class="MsoPlainText">&#43; */<o:p></o:p></p>
        <p class="MsoPlainText">&#43;struct task_barrier {<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int n;<o:p></o:p></p>
        <p class="MsoPlainText"><span style="color:#203864">[Le]: We can
            define it as signed type here for more common use.</span></p>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>This is a counter of number of tasks/threads to synchronize in
      the barrier it cannot go bellow 0</p>
    <p>Andrey</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:MN2PR12MB4285F713BEE4E4BC2E3F3F39F6550@MN2PR12MB4285.namprd12.prod.outlook.com">
      <div class="WordSection1">
        <p class="MsoPlainText"><span style="color:#203864"><o:p></o:p></span></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; atomic_t count;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct semaphore
          enter_turnstile;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct semaphore
          exit_turnstile;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;};<o:p></o:p></p>
        <p class="MsoPlainText">&#43;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;static inline void
          task_barrier_signal_turnstile(struct semaphore *turnstile,<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          unsigned int n)<o:p></o:p></p>
        <p class="MsoPlainText">&#43;{<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i = 0 ; i &lt; n; i&#43;&#43;)<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; up(turnstile);<o:p></o:p></p>
        <p class="MsoPlainText">&#43;}<o:p></o:p></p>
        <p class="MsoPlainText">&#43;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;static inline void
          task_barrier_init(struct task_barrier *tb) {<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tb-&gt;n = 0;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; atomic_set(&amp;tb-&gt;count,
          0);<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          sema_init(&amp;tb-&gt;enter_turnstile, 0);<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          sema_init(&amp;tb-&gt;exit_turnstile, 0);<o:p></o:p></p>
        <p class="MsoPlainText">&#43;}<o:p></o:p></p>
        <p class="MsoPlainText">&#43;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;static inline void
          task_barrier_add_task(struct task_barrier *tb) {<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tb-&gt;n&#43;&#43;;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;}<o:p></o:p></p>
        <p class="MsoPlainText">&#43;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;static inline void
          task_barrier_rem_task(struct task_barrier *tb) {<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tb-&gt;n--;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;}<o:p></o:p></p>
        <p class="MsoPlainText">&#43;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;/*<o:p></o:p></p>
        <p class="MsoPlainText">&#43; * Lines up all the threads BEFORE the
          critical point.<o:p></o:p></p>
        <p class="MsoPlainText">&#43; *<o:p></o:p></p>
        <p class="MsoPlainText">&#43; * When all thread passed this code the
          entry barrier is back to locked state.<o:p></o:p></p>
        <p class="MsoPlainText">&#43; */<o:p></o:p></p>
        <p class="MsoPlainText">&#43;static inline void
          task_barrier_enter(struct task_barrier *tb) {<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if
          (atomic_inc_return(&amp;tb-&gt;count) == tb-&gt;n)<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          task_barrier_signal_turnstile(&amp;tb-&gt;enter_turnstile,
          tb-&gt;n);<o:p></o:p></p>
        <p class="MsoPlainText">&#43;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          down(&amp;tb-&gt;enter_turnstile);<o:p></o:p></p>
        <p class="MsoPlainText">&#43;}<o:p></o:p></p>
        <p class="MsoPlainText">&#43;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;/*<o:p></o:p></p>
        <p class="MsoPlainText">&#43; * Lines up all the threads AFTER the
          critical point.<o:p></o:p></p>
        <p class="MsoPlainText">&#43; *<o:p></o:p></p>
        <p class="MsoPlainText">&#43; * This function is used to avoid any
          one thread running ahead of the
          <o:p></o:p></p>
        <p class="MsoPlainText">&#43;reset if<o:p></o:p></p>
        <p class="MsoPlainText"><span style="color:#203864">[Le]: No
            need to mention “reset” here.<o:p></o:p></span></p>
        <p class="MsoPlainText"><span style="color:#203864"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoPlainText"><span style="color:#203864">With the
            above addressed, Acked-by: Le Ma
            <a href="mailto:Le.Ma@amd.com" moz-do-not-send="true"><span style="color:#033160">Le.Ma@amd.com</span></a><o:p></o:p></span></p>
        <p class="MsoPlainText"><span style="color:#203864"><o:p>&nbsp;</o:p></span></p>
        <p class="MsoPlainText"><span style="color:#203864">Regards,<o:p></o:p></span></p>
        <p class="MsoPlainText"><span style="color:#203864">Ma Le<o:p></o:p></span></p>
        <p class="MsoPlainText">&#43; * the barrier is used in a loop
          (repeatedly) .<o:p></o:p></p>
        <p class="MsoPlainText">&#43; */<o:p></o:p></p>
        <p class="MsoPlainText">&#43;static inline void
          task_barrier_exit(struct task_barrier *tb) {<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if
          (atomic_dec_return(&amp;tb-&gt;count) == 0)<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          task_barrier_signal_turnstile(&amp;tb-&gt;exit_turnstile,
          tb-&gt;n);<o:p></o:p></p>
        <p class="MsoPlainText">&#43;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          down(&amp;tb-&gt;exit_turnstile);<o:p></o:p></p>
        <p class="MsoPlainText">&#43;}<o:p></o:p></p>
        <p class="MsoPlainText">&#43;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;static inline void
          task_barrier_full(struct task_barrier *tb) {<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; task_barrier_enter(tb);<o:p></o:p></p>
        <p class="MsoPlainText">&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; task_barrier_exit(tb);<o:p></o:p></p>
        <p class="MsoPlainText">&#43;}<o:p></o:p></p>
        <p class="MsoPlainText">&#43;<o:p></o:p></p>
        <p class="MsoPlainText">&#43;#endif<o:p></o:p></p>
        <p class="MsoPlainText">--<o:p></o:p></p>
        <p class="MsoPlainText">2.7.4<o:p></o:p></p>
        <p class="MsoPlainText"><o:p>&nbsp;</o:p></p>
      </div>
    </blockquote>
  </body>
</html>

--------------9884471CDF8D2917872047BE--

--===============2050937910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2050937910==--
