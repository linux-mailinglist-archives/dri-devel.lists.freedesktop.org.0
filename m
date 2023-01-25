Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 025D967D704
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 21:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1508610E3BB;
	Thu, 26 Jan 2023 20:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EADE10E3AA
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 23:58:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8hasNhKTUtCefLJtVaJVYPAq3icQkTxYdOPlMBgTBjRDwxYHfIhq2HOskWi+WbGyuE/nb0elTwza8oq6GWPyofZthGVOdbSTFU2o2IYeUedGYN7EMpQAzr6rnDDTJE1mnir3F96C6pXRERH+3s5XQ0dBis+Vjn5FWBO8hDT9VnmatkS1tuqoEKdIsOFS+RgnU1yUpOmGUs095lDHYuZeot4+7P/nExNHFaPLJyKQfQKuLjt3cqbdiDARE5UNOphjO1yfkcW9OJvUsh52TNdAxl64D2/A61JnpHdEGfObJnROyyGvKEPoJI85zYiiRXuqc7e4Gfl/eARZKw47/AvrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Je56C5Dyfef28qYTwARu5wl8Rawoe+pld5MKAHkqW3c=;
 b=Bv4A97U1zR4Drn9GNEMEAV2o2e5ZpxlnGbgDYOJ71KcwsGcF/ryDaMxB9Gsqy4iUoduxaXpf3VC6IUhrTLXoEEE6tews7cJKzASHcHRKa6bSGSxG5mbZtlHo89nJ+isrAKy3DMnSh2QEN4dtfM2qw7wLyfql9I9SoqXDFP0hyYQ4VlqFIdegVY1Ae18G172H60IBzvznp7ySYwGI/Fnq964RLZZtDboIAfmBYO2FSoY0/6jll+PMNGDrQdDLgBNjkWXdoWk33ddw/oqB/RPN6VGpEpRBhP5tSagiu2mlLuyA4VGKZpBiNdk6f5PGjlg4At62i8UrUX5UhPCrNSYzGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=knights.ucf.edu; dmarc=pass action=none
 header.from=knights.ucf.edu; dkim=pass header.d=knights.ucf.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=knightsucfedu39751.onmicrosoft.com;
 s=selector2-knightsucfedu39751-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Je56C5Dyfef28qYTwARu5wl8Rawoe+pld5MKAHkqW3c=;
 b=AJpPmEZ6Y/73NdIAGbK/6LgsFZpq7NNZRZzMfVQUMA5YJ+5fqRXQH4dVW4ldlNl48O8OF9b8elBxMahR/ig4bnbUFGo+FuYFVb1cstdcffeA57miVZAoXpgEYrpf3VlesCV80ovNCdHveqSV/1/8M6NQ0lZd46LNNFvXoP/jGsM=
Received: from IA1PR07MB9830.namprd07.prod.outlook.com (2603:10b6:208:44b::14)
 by MW4PR07MB8713.namprd07.prod.outlook.com (2603:10b6:303:106::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 23:58:53 +0000
Received: from IA1PR07MB9830.namprd07.prod.outlook.com
 ([fe80::670b:627c:6340:583]) by IA1PR07MB9830.namprd07.prod.outlook.com
 ([fe80::670b:627c:6340:583%3]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 23:58:53 +0000
From: Sanan Hasanov <sanan.hasanov@Knights.ucf.edu>
To: "deller@gmx.de" <deller@gmx.de>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "geert+renesas@glider.be"
 <geert+renesas@glider.be>, "samuel.thibault@ens-lyon.org"
 <samuel.thibault@ens-lyon.org>, "penguin-kernel@I-love.SAKURA.ne.jp"
 <penguin-kernel@I-love.SAKURA.ne.jp>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: UBSAN: shift-out-of-bounds in fbcon_set_font
Thread-Topic: UBSAN: shift-out-of-bounds in fbcon_set_font
Thread-Index: AQHZMQ++fDo6Sk0bVE2+seINfv7JGw==
Date: Wed, 25 Jan 2023 23:58:53 +0000
Message-ID: <IA1PR07MB98308653E259A6F2CE94A4AFABCE9@IA1PR07MB9830.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Knights.ucf.edu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR07MB9830:EE_|MW4PR07MB8713:EE_
x-ms-office365-filtering-correlation-id: 6f4dd484-8ca2-4d41-471f-08daff301cdb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iD2ujMq4dLDTrwd0oIf0mLRlay+tcONRvIDlaG52DtG7oHbc6bJ0pxubRKbc5Xee0FiiDDfEba09eIZ80t+jCI6R3ZBxWzOYUa0uWjq0fLQlX9xKvpvbDywdZMzKYtAB5BPb2mMUfD1ZSiFCmoHOKr8eZsK55g7dKPJdtAyRYcJ3te7L9MU45fHAIe3rjHwtP6uxWunt3iSSMwY9lANsQBVWBOXGlLUkcs1jhlieBnL8qjORmSJBMQSeNR3MudNz+7xk6Z25gJVqYSdZxbs2U4k6MBRlB2kaDxqUv17rpFE3Nr9sT52mrdMUAmVkQAjifDKXgZayCiCF1aGnAEuHAlYB3gkHwCGAer5pXUSVo9N6RaBtNN+LG+jB1tCszYJO8GA6M168Wbogdaa/gbMJMnZiHVWqGgxcx0vPWeHe2+43qmKi4/rmdR6o5KKLAsOvaJBgqxPZuEdpQGv1PQAXWpkw34fgaOhsfMN/8Eu3wECPVG7HODxr7cXJK0RRjEhwiGlc0uKmPHBN7Z32H6848D/P76izy/jQfUP86VD+qCfBTWLuwHZKOqkFHOptLZjVgSjKdx8Nfe1OgHvw2VoRVeidLNq/WTWuhiRtDziYzny/stjvQWzqNV+Z4ZMlVgSzC2/JDyXz02LkTAasNERTax57a0nzNGQZPim1hnzL64ph8qJiBuv4mz3xREMvaDR459DmQxYNUTzHUVZAromDYsjXyLg3WX5OIKxiVIroym9CBiLVH47BdfkHXg7I24MCU221J8gL8j/Gwgzz9WVjL1vvPvtOaZdxsJaxupUFrc4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR07MB9830.namprd07.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(451199018)(5930299012)(76116006)(66556008)(64756008)(86362001)(41320700001)(83380400001)(66446008)(38070700005)(5660300002)(52536014)(122000001)(38100700002)(41300700001)(66476007)(7416002)(66946007)(2906002)(44832011)(8936002)(786003)(9686003)(54906003)(4326008)(33656002)(8676002)(71200400001)(6506007)(7696005)(316002)(186003)(26005)(75432002)(478600001)(55016003)(110136005)(966005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?CyAmmC7K1fnw1CW45qAgQyz/JowPpkVmLLX9/oVD7HCgfl2GbbWKV7NRQi?=
 =?iso-8859-1?Q?NemnxFwQ4gfAShnUH/7hUQ3ubsMaTbw2tD8lNI00e6IY2RZ/2Ff9mn2GP1?=
 =?iso-8859-1?Q?OizdAPPUuZ4xZpoEBjiRckSEavY+Ejg7IblUc8Wk1uSOMB2svDWwZKc5gp?=
 =?iso-8859-1?Q?flPLzkxbOt7aE271NditlgPcAvY1KXvbPMAYiSGG0/cNsjj4mtc2KicGVH?=
 =?iso-8859-1?Q?HLbdJJmkj41cgqxOkojwZ5ybzOA+u5uO0IcUUKHKEuuqAlA8N6dw0c8pQ2?=
 =?iso-8859-1?Q?fgyr54QwxcG9owbGnos9PTmufaGgRTTeHl1eTD9/AYS3VYAAv1FH0Oz1XZ?=
 =?iso-8859-1?Q?vR+XU1klpB34zN3ThdZZjC62dOObjX45Dy62CAEAlarZt4nCUEL9Q6Z99I?=
 =?iso-8859-1?Q?MweVWRV/WHbW6NkJdCTGIngE4qB7DeC5F5YhIO7s/CxcO1hxA3f8d67Tq1?=
 =?iso-8859-1?Q?Z1JE8RP0dg41YvpEjrRu62OTcPXQ1VhvbEwGTQAiA0+Fj6BB0In0cruui2?=
 =?iso-8859-1?Q?cVNLLJbOc5OChQk1z8GBuAI6EAsFMaC8DCpJbaw4WgigH7zZ8v90lT51LV?=
 =?iso-8859-1?Q?L5ixV9Fdw20LNxJ9VBCZ686z4MX59RaDengFv3bGDW8GWhXXoSaoXsnT36?=
 =?iso-8859-1?Q?fZIJ/Gcd8PgurnT8rePd0zadv2pifuAlhBRi09nQ6CXi1kh/XzPWOFyJFW?=
 =?iso-8859-1?Q?tB/kze4Z8LrOlpKTRtQvsKsex+tCQVIgt3YBaqPuH6s+jr2RAwNrOR84TC?=
 =?iso-8859-1?Q?HalIGD9f4Kd+4az7OhqhDDSLxyAoy6gUbEqM+U5r5rJ7DHa4CKMZu1jYW8?=
 =?iso-8859-1?Q?+4h83WniIJ1BO6dOHVmZekzZPBYvQllEH+8ak+jhF5QSUi1QGSEcw+ZW6R?=
 =?iso-8859-1?Q?KzCWRfYhCB2fLf//4900luv64K4th1wLPEnrFYOUAEvdcCO7YUAdAdphyN?=
 =?iso-8859-1?Q?cIhva4R/qtTE6FlIwURjxtwxoIJkwloTJEoVKVSZvGVFfa0VTIoj+9ogsO?=
 =?iso-8859-1?Q?MrTmEvar25T9mGex1/VkMecgr+SKKvB0CAQDb47MLfOQ6LRKXlXVPP/dVr?=
 =?iso-8859-1?Q?9aWSIsyGOqjfLxsRQEi6m2eJmj94lbrwO2zX8eriI2msOZmG62jrCg2yaR?=
 =?iso-8859-1?Q?5vfkUUQ+qdgtxGAVs1NnsKqYtemhLUMXc9fVCFE5G12hjcqCvt4WC+3RDz?=
 =?iso-8859-1?Q?poO8YoVbQuTDAqxeZlO46W40evFqehzZ17UTBumtQ4EUcd8QC6qTJilPc3?=
 =?iso-8859-1?Q?iEe9Uo7mlUwBztYkHIgyGcxZfNhc3jskLNUc73zivzOMqv5ZeB4O7Bcl7M?=
 =?iso-8859-1?Q?E4hgABfXWDIQlpiWTi4faZONioXqYTl9z7Y0d5n8xaHM6qLR9SKeJu8xlN?=
 =?iso-8859-1?Q?PfgtXnxsTsQoMcDDqcDUC8AtaMxKqA4xxuMlMx+Vt13lFYbMobTkhiSKBH?=
 =?iso-8859-1?Q?elgQVSMhw1/9tLYHxZnRgGvrKocUK0YmGiLWALjlf6trHui3YlohgVz28R?=
 =?iso-8859-1?Q?EMUwQN0ZvWZq+fEqazX8rBrKQSrokuMlMkl0yzWzMWL2Eytqh08qnAQuOz?=
 =?iso-8859-1?Q?g9eLorPbW1EsPwz/hxAYIas0Efl1F+dQS3klIOxaoAhXFMlPL27Hu+18aH?=
 =?iso-8859-1?Q?fyrqmgDJo2ilo4jDK6iaj6hpBxIm4DTZMybXvbpU6gQ5ZfzY5X1M1WAg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: knights.ucf.edu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR07MB9830.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f4dd484-8ca2-4d41-471f-08daff301cdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2023 23:58:53.3835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5b16e182-78b3-412c-9196-68342689eeb7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: woXl6c6xp7A7hKEq9rxsEsYcU9MlrC2N4GruyJlu/tE+lXtYbN/67sqr+PLrbXb+FpAVEJ54lPmUGhimi0NdUELkRxBcDCTThrn800CYSWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR07MB8713
X-Mailman-Approved-At: Thu, 26 Jan 2023 20:58:31 +0000
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
Cc: "syzkaller@googlegroups.com" <syzkaller@googlegroups.com>,
 "contact@pgazz.com" <contact@pgazz.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Good day, dear maintainers,=0A=
=0A=
We found a bug using a modified kernel configuration file used by syzbot.=
=0A=
=0A=
We enhanced the coverage of the configuration file using our tool, klocaliz=
er.=0A=
=0A=
Kernel Branch:=A06.2.0-rc5-next-20230124=0A=
Kernel config:=A0https://drive.google.com/file/d/1F-LszDAizEEH0ZX0HcSR06v5q=
8FPl2Uv/view?usp=3Dsharing=0A=
Reproducer:=A0https://drive.google.com/file/d/1mP1jcLBY7vWCNM60OMf-ogw-urQR=
jNrm/view?usp=3Dsharing=0A=
=0A=
Thank you!=0A=
=0A=
Best regards,=0A=
Sanan Hasanov=0A=
=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=0A=
UBSAN: shift-out-of-bounds in drivers/video/fbdev/core/fbcon.c:2489:33=0A=
shift exponent 35 is too large for 32-bit type 'int'=0A=
CPU: 1 PID: 25156 Comm: syz-executor.6 Not tainted 6.2.0-rc5-next-20230124 =
#1=0A=
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/=
2014=0A=
Call Trace:=0A=
 <TASK>=0A=
 __dump_stack lib/dump_stack.c:88 [inline]=0A=
 dump_stack_lvl+0xd1/0x138 lib/dump_stack.c:106=0A=
 ubsan_epilogue+0xa/0x31 lib/ubsan.c:151=0A=
 __ubsan_handle_shift_out_of_bounds.cold+0xb1/0x18d lib/ubsan.c:321=0A=
 fbcon_set_font.cold+0x19/0x3c drivers/video/fbdev/core/fbcon.c:2489=0A=
 con_font_set drivers/tty/vt/vt.c:4624 [inline]=0A=
 con_font_op+0xb4d/0xf10 drivers/tty/vt/vt.c:4671=0A=
 vt_k_ioctl drivers/tty/vt/vt_ioctl.c:474 [inline]=0A=
 vt_ioctl+0x632/0x2ec0 drivers/tty/vt/vt_ioctl.c:752=0A=
 tty_ioctl+0x6fd/0x1520 drivers/tty/tty_io.c:2777=0A=
 vfs_ioctl fs/ioctl.c:51 [inline]=0A=
 __do_sys_ioctl fs/ioctl.c:870 [inline]=0A=
 __se_sys_ioctl fs/ioctl.c:856 [inline]=0A=
 __x64_sys_ioctl+0x197/0x210 fs/ioctl.c:856=0A=
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]=0A=
 do_syscall_64+0x39/0x80 arch/x86/entry/common.c:80=0A=
 entry_SYSCALL_64_after_hwframe+0x63/0xcd=0A=
RIP: 0033:0x7f044068edcd=0A=
Code: 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa 48 89 f8 48 89 f7 =
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff f=
f 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48=0A=
RSP: 002b:00007f0441810bf8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010=0A=
RAX: ffffffffffffffda RBX: 00007f04407bbf80 RCX: 00007f044068edcd=0A=
RDX: 0000000020000a40 RSI: 0000000000004b72 RDI: 0000000000000003=0A=
RBP: 00007f04406fc59c R08: 0000000000000000 R09: 0000000000000000=0A=
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000=0A=
R13: 00007ffc5e6a424f R14: 00007ffc5e6a43f0 R15: 00007f0441810d80=0A=
 </TASK>=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=0A=
