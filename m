Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1461E1589
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 23:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D615589993;
	Mon, 25 May 2020 21:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C1489993
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 21:18:24 +0000 (UTC)
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 570A1C03C8;
 Mon, 25 May 2020 21:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1590441504; bh=7h1b+4GqhqndfAppxIvq31HdPsp9VSmSX3Qc1XMF7X8=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=kjtcYzd8kjFbgtEMi+oPbV+EWwp0ZrKprTxcDD5cYWDNCgQ5uEmmpd4ua+46kPwb4
 75DoWHR1u62n+7mJI4ABwSpjo6ObF6ZFe9DDkUuX/c6wYqwP+4ZkUFzIKIyCqrcVei
 2BJhLg9tskuzdR/TmGlGQQ9625QuhEOKpjkleW5o0Wks1N0PQYNnrfwNJqNJDcYp11
 NLKQmVsikZWjuXZCTWF014a+Y8yIRyorEZzVr1GNMuiI2Boax+FjtV0MXMbGsYdBiw
 AqWZs8dup63+pwgcyO3kJXiSBa7Uptbhzaz0yPSACDyUlSAwhmxBTY5thXzL9JOba2
 6Mg8eN5D6xu/Q==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id C6F29A0083;
 Mon, 25 May 2020 21:18:18 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 25 May 2020 14:18:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.487.0; Mon, 25 May 2020 14:18:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlvxJmrmcQiZzjOD/41gy+3xqBlyzQXFeJ0DyJzq3ugEyyJuKrjfY0YX9l/fvJmP+Uvbru/OrrHlNryJ4deQL/p2Nx8QLBWNpLqiCPrY0HdT5D52JKBGPte1XPEG9+9bzOYkrlGVk7a355Lq943FBqymDvAa136RMO3JpgyHQW9lF2/wTVtNmfNbc5tK2z0pUI/wJyUGbxP8n4h0ZlOcnds5F9N3CXBJ+noaeD7LlFqE+wYbDSHKZfGBsL5S+m/v3a/qUx96NN+BPVpq3NkqrDdiB8gcKzmcUDPoOlZyTYAGKPPFG0ligxgUlDq+YFbwLlogsClkkKf3yNCwnjk+IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbuiccRBEgmFxLMeiWlqkAx1DrN+UZJkR+Pcl2n9wa0=;
 b=dCPofMvfcKmZWDSVQT299eBaFEDBNoiKwEn6v/s4yPFzbhpwzR/PvdKaAI9Odyza+CZrHMgFrc2HAGNMLpjijOiWdvYbG7tv3OnnEZP+p6/hQwvHEu/gRXZxYF4Du+/lvJUx0sbe6miZYnjgEQZDrfnHhFsLJMNT8/X0q1Rt498IQYvGkwAg7QQPalVzib0J+UMeW6aV1CjluGPqyNJDxDz94CZ9h8aj9ri/Luo0DFsWBd/nuf3q8JyB2OkxCviAH2iGcoOGarbTxBSsVS8XPgBMMt0UpqeQ7w+qrE2QdE9wKcVXRpo1QOGKr2enCtLHUqC4fcw6m+wi/ALwAHTjvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbuiccRBEgmFxLMeiWlqkAx1DrN+UZJkR+Pcl2n9wa0=;
 b=Z8jJ8SqlKAe3iJwwWIXOlAPzGSFu/UxzkNL5wGFRZGgSSk81Y2DYnaUO/2hSqtnPw3TP53+L4ZyUJp+PZkJ5QVzgLV3XL0UyuDSoBC9kkYO2Rh+Pwoy0BcIJB3Q7E75iRD/qYn83Zwsfkvu55NdKDpDmexj/4nADFWV172yynbI=
Received: from CY4PR1201MB0136.namprd12.prod.outlook.com
 (2603:10b6:910:1a::19) by CY4PR1201MB0103.namprd12.prod.outlook.com
 (2603:10b6:910:17::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Mon, 25 May
 2020 21:18:14 +0000
Received: from CY4PR1201MB0136.namprd12.prod.outlook.com
 ([fe80::8d22:7d25:8892:a09]) by CY4PR1201MB0136.namprd12.prod.outlook.com
 ([fe80::8d22:7d25:8892:a09%8]) with mapi id 15.20.3021.029; Mon, 25 May 2020
 21:18:14 +0000
X-SNPS-Relay: synopsys.com
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 53/59] drm/arc: Move to drm/tiny
Thread-Topic: [PATCH 53/59] drm/arc: Move to drm/tiny
Thread-Index: AQHWMrJhv3+nTVmvX0mWiibsTolZFKi5DfCAgAA9TYc=
Date: Mon, 25 May 2020 21:18:14 +0000
Message-ID: <CY4PR1201MB013642CA3BE313EE143A13C0DEB30@CY4PR1201MB0136.namprd12.prod.outlook.com>
References: <CY4PR1201MB013664B33FE72449DB0A6F65DEB30@CY4PR1201MB0136.namprd12.prod.outlook.com>,
 <CAKMK7uE6DK903YdqBRjYcvZKxB48-5ZhPzEngtL8URScM_Scyw@mail.gmail.com>
In-Reply-To: <CAKMK7uE6DK903YdqBRjYcvZKxB48-5ZhPzEngtL8URScM_Scyw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=synopsys.com;
x-originating-ip: [198.182.37.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ae4ef4e-3611-46e7-30e6-08d800f122d8
x-ms-traffictypediagnostic: CY4PR1201MB0103:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB0103539318A9CC59AC3B6D37DEB30@CY4PR1201MB0103.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EKa7Oxl9Pd2viCK4ZR2zDnfuSfuhhXa1qSpFaa84I2fXOl+izLsCYZhI/pghTdopR8JNxfouxOhIgCDBOnToTXdu+QACbbsOmfwDWK/2xFli8neJfKgLCbjcg71IULnifln8x4c0FRUxXGYH5QC95QpwITyUEkSCVfjMTSFcLvmieoF2l8OCdBLXE4ZmWBCOqj1kQ5X+NgGXXRT4/T02ThYzgKN9XFasWlUHjOMTNRSxHWcY453Acwi1uYoJiDxmxOWQpUGVE6qODjfdo77uFwGK9KOelit7zrSuD7TzkgPkqL/SmEA7cppc30YmRC9X1z20Br/vi7UM6U3MZ20DYsfVzZ5B76pTCyWBM2twZlj4nZhVjWBH4FztfAjLonKNO8CcO/lP3xVIBG9kWQT/KA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1201MB0136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(136003)(346002)(39860400002)(366004)(396003)(478600001)(64756008)(76116006)(91956017)(66556008)(66446008)(966005)(66946007)(6916009)(9686003)(55016002)(66476007)(4326008)(54906003)(7696005)(186003)(26005)(53546011)(6506007)(316002)(71200400001)(52536014)(8676002)(8936002)(33656002)(86362001)(5660300002)(2906002)(83080400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: RJLtazGeL/hJzNryKY0s6d5hFv8oMoTH3rDqX4vCvUlonEPi0z08kxD8UoVcu7WSUh95fRbKCjrCnxWuG1zaN30MyVodkkdL1XeByxvvPDW0HHqFozNA1qzVfPNwI0ZzOjB/1/JjUIrqtTL+M2bkWRSbIIAn5D5JSMfTKoXH9Qo5o+1Dv0hvxGN+2GasoPaqTToUyaJk5kAAYbdwoeuWcpwfPv/7QCCTbUWpxTtpLiOCZre3S9O35W8BWw0VSyA4kcHKBvtgu4z/98rI+VzOQEAL2VzZzTimUVHrwNQkrl8sR/PE/1+ceQC87nFWZertYivNTETdfU61rK8/ho8l9UYu8JqzLLiZc3oxKhRbtllJYPfkN6+RpK8ePVvQx92iHDL6NoZlIaXLZ52RjzrJ76drj09i4WAASw7+BtTPEJnFSgypY1YaADlKonekqh9Qc5JUFDheYyWTtK+Qj8kECIzsdPS14DDYEE5KkFD3klHANmn8P3mkjLHSO1TaX+3G
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae4ef4e-3611-46e7-30e6-08d800f122d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 21:18:14.3257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9acktemofgluDv2UYwz9rGcmX11BrSe3Kz4xMFUEXA7Ee0VVRe1Q5GfUFV5rIuQFzXKFwaxRDa9kp6LTwvN+9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0103
X-OriginatorOrg: synopsys.com
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
Cc: linux-snps-arc <linux-snps-arc@lists.infradead.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

So, I've smoke tested it. Though it is working, it's really unstable and causes kernel crash in many cases.

I.e:
This kernel crash (due to invalid read in kernel mode by 0x0000007c address) happens
on HDMI cable disconnection:
----------------------------------->8-------------------------------------------
Oops
Path: (null)
CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.7.0-rc6-03007-g4ceda91a4176 #5
Workqueue: events adv7511_hpd_work
Invalid Read @ 0x0000007c by insn @ drm_gem_fb_get_obj+0xa/0x10
ECR: 0x00050100 EFA: 0x0000007c ERET: 0x813b954a
STAT32: 0x80080442 [IE K DE   ]  BTA: 0x813eef62
BLK: arc_pgu_update+0x1a/0x30
 SP: 0x9f055dd0  FP: 0x00000000
LPS: 0x8135603c LPE: 0x81356044 LPC: 0x00000000
r00: 0x00000000 r01: 0x00000000 r02: 0x9f6bc000
r03: 0x9f0d8000 r04: 0x9f0d8388 r05: 0x00000000
r06: 0x00000000 r07: 0x00000000 r08: 0x00000000
r09: 0x00000000 r10: 0x00000000 r11: 0x00000000
r12: 0x813eef62

Stack Trace:
  drm_gem_fb_get_obj+0xa/0x10
  arc_pgu_update+0x1a/0x30
  drm_atomic_helper_commit_planes.constprop.35+0xc8/0x23c
  commit_tail+0x164/0x274
  drm_atomic_helper_commit+0x36a/0x398
  drm_client_modeset_commit_atomic+0x136/0x1a4
  drm_client_modeset_commit_locked+0x3a/0x118
  drm_client_modeset_commit+0x18/0x34
  drm_fb_helper_set_par+0x54/0xb0
  drm_fb_helper_hotplug_event.part.16+0x70/0x8c
  drm_client_dev_hotplug+0x4a/0x74
  adv7511_hpd_work+0x6c/0x124
  process_one_work+0x19a/0x358
  worker_thread+0x108/0x494
  kthread+0xec/0x100
  ret_from_fork+0x18/0x1c
----------------------------------->8-------------------------------------------


This kernel crash (due to invalid read in kernel mode by 0x0 address) happens
on weston stop:
----------------------------------->8-------------------------------------------
Oops
Path: (null)
CPU: 0 PID: 158 Comm: weston Not tainted 5.7.0-rc6-03007-g4ceda91a4176 #5
Invalid Read @ 0x00000000 by insn @ drm_gem_fb_destroy+0x32/0x130
ECR: 0x00050100 EFA: 0x00000000 ERET: 0x813b9a76
STAT32: 0x80080002 [IE K     ]  BTA: 0x81345c66
BLK: drm_fb_release+0x66/0xb0
 SP: 0x9f5c7db8  FP: 0x5fa4fa7c
LPS: 0x813560ec LPE: 0x813560f0 LPC: 0x00000000
r00: 0x00000000 r01: 0x9e864392 r02: 0x00000002
r03: 0x00000001 r04: 0x00000026 r05: 0x00000000
r06: 0x00000114 r07: 0x00000001 r08: 0x9f0d8140
r09: 0xfffffe20 r10: 0x30405c00 r11: 0x00000039
r12: 0x813d6c16 r13: 0x00022cc8 r14: 0xffffffff
r15: 0x00023ef0 r16: 0x5fa4f874 r17: 0x00022c58
r18: 0x5fa4fde4 r19: 0x00000000 r20: 0x000203c0
r21: 0x00000000 r22: 0x00022d40 r23: 0xffffffff
r24: 0x5fa4fa80 r25: 0x2000b808



Stack Trace:
  drm_gem_fb_destroy+0x32/0x130
  drm_fb_release+0x66/0xb0
  drm_file_free.part.11+0x112/0x1bc
  drm_release+0x80/0x120
  __fput+0x98/0x1bc
  task_work_run+0x6e/0xa8
  do_exit+0x2b4/0x7fc
  do_group_exit+0x2a/0x8c
  get_signal+0x9a/0x5f0
  do_signal+0x86/0x23c
  resume_user_mode_begin+0x88/0xd0

----------------------------------->8-------------------------------------------

It was tested on AXS103 board with ARC PGU + adv7511 HDMI bridge.

Probably you have some ideas about how to fix it?
Thanks.



> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Monday, May 25, 2020 20:26
> To: Eugeniy Paltsev
> Cc: dri-devel
> Subject: Re: [PATCH 53/59] drm/arc: Move to drm/tiny
> 
> On Mon, May 25, 2020 at 6:36 PM Eugeniy Paltsev
> <Eugeniy.Paltsev@synopsys.com> wrote:
> >
> > Hi Daniel,
> >
> > looks like I'll finally have some time for review of "drm/arc: Move to drm/tiny".
> > So, is it possible to find all these changes in any public git repo?
> 
> I have a horrible pile with everything here:
> 
> https://urldefense.com/v3/__https://cgit.freedesktop.org/*danvet/drm/log/__;fg!!A4F2R9G_pg!KUgdCRZoVj_85WhtTr0NUhsLhDgVTN_7s2aNdS4mMmRDfstvp4JbIYdip4J0P3Hg1NQLG2E$
> 
> I can also give you a cherry-picked branch with just the arc patches,
> on drm-tip (maybe also linux-next, not sure everything is there
> because of the merge window freeze we're in already).
> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - https://urldefense.com/v3/__http://blog.ffwll.ch__;!!A4F2R9G_pg!KUgdCRZoVj_85WhtTr0NUhsLhDgVTN_7s2aNdS4mMmRDfstvp4JbIYdip4J0P3HgteJOwjA$
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
