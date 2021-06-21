Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8FB3AE7E2
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 13:06:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6A489BE8;
	Mon, 21 Jun 2021 11:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300108.outbound.protection.outlook.com [40.107.130.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DD489E5B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 11:06:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nyv9UlckgBJu2vHaYRvqwvJmD1knOCG8z7U+YjAPnkAij3k6WYT70BQMb2w9JuWo7QkcaEYtQB4sD027ltVOI8L9jpuRbaws0t9oeD3mIwsIHxeZ+7cx50BVXofEWL6lMV2np4W1lHrkCs+9GEWfq5CXT0FCjLUr38HyNRErxDEZrxUeyHvoEB2YSDJkU4AEq7590a0EVqHL0JUsnMg3389Z/vRUwWltHJR5vv9XC8ocoguMf7U5VT+/DQlT/9I4lygR7S6M1Ks9kg4OQRx5jpbXXmh07Mxe/WBmTdl1qZAm2ZBCboM6dw4/572zZDeUS0HwXnzJ375HeVJZLhukCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G43rMo08T7LLFXQT4Hd0IfxxvNkM871nOX+oJi5DvQw=;
 b=h8RRGNTu4RBQfuh67z+IpRpQX9TY3ANd+NSButKMnOvqR8qM9K4QRc7YELc8TNqWopUwR/D9j0r2pS9d+EM7Ok3xjhNSRKKyQs7kPInDiwt8J7n8krrnNFSeZGpK5yrXeB2xSQv/EGLlD72/bhpLJmJXN25k44ovP1A7GqBivYW1M/U4Ko1PK++i4fyMrQSJB5QFWQNlacoVPgchDLrPGCBLqUNoIiQsL7pW5utaZj15Qbt58JHiBNw1cU96udMe2W+ugCFgtpr+0SotYAH0tLaynR/Pf/IM4JA0MEHKqtYbnYROTdv967bqQJxnkS02OX6mOYIiOOTrCIszPOzkYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G43rMo08T7LLFXQT4Hd0IfxxvNkM871nOX+oJi5DvQw=;
 b=AJkrhn9zMHEES1lwTV840WHK654wr7i7BkELNSPNDNaTz0SHwyCog5UhZIUrgOr3nAA3T4NRe5fPImr5Nn3pfl8w7OGk4cMORSck9FasVhGww9BJZP28BaqA3r2KE7UyOmNWZwcopu3xkgfTmE4+Oil75MAmQ2/bUpf1DNUfG7FJg01pEsY1Bw3MT7CqzqeDAbvjJPgh16G11pP0kZTR3m80f4WSLL6EUBUgn5iM/U7t7eOSC67v3lT3xHe0Kr+gLOJ7bh5ia11UBSF/c4LuWyzAwhqmEBZcuoTZ01aCHMhwS3J7IIzvtdQec9RuqeQQ89SXUv8im5pmJwnOd1rYng==
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com (2603:1096:202:34::18)
 by HK0PR06MB2228.apcprd06.prod.outlook.com (2603:1096:203:4c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Mon, 21 Jun
 2021 11:06:02 +0000
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::2952:8470:b8c0:c53c]) by HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::2952:8470:b8c0:c53c%6]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 11:06:02 +0000
From: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>
To: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4] drm/ast: Disable fast reset after DRAM initial
Thread-Topic: [PATCH v4] drm/ast: Disable fast reset after DRAM initial
Thread-Index: AQHXQyMsjwUdIFIvXU2rGyYFr6xp2ar1jDMggCkAVcA=
Date: Mon, 21 Jun 2021 11:06:02 +0000
Message-ID: <HK2PR06MB3300CDB7ADFA9108EEAE6FD08C0A9@HK2PR06MB3300.apcprd06.prod.outlook.com>
References: <bbe8ccfd-7e73-e1e6-32a5-f08f71c4ed3f@suse.de>
 <20210507092708.39552-1-kuohsiang_chou@aspeedtech.com>
 <HK2PR06MB33004A57DA1F99AC77E8F2CD8C249@HK2PR06MB3300.apcprd06.prod.outlook.com>
In-Reply-To: <HK2PR06MB33004A57DA1F99AC77E8F2CD8C249@HK2PR06MB3300.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aspeedtech.com; dkim=none (message not signed)
 header.d=none;aspeedtech.com; dmarc=none action=none
 header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe958de1-c7f8-43a0-d9a1-08d934a48e9f
x-ms-traffictypediagnostic: HK0PR06MB2228:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB2228DDD3D5460B489FC568F58C0A9@HK0PR06MB2228.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bhw2txa1ppDO68I0qITLAsYMOnSoAnjjVBbucVASsvVcpo/ZFy157lvSG8un9anSXox+OXoIqhaWRmVpcvJxJix2O8xVewZ6NejfMHlf2o+BcNjC0fGROh18rGlnGtBYBaKvdPLAae+yhaTBBoAqhDce0t9XIDUNvPg4LRowO5rXLAOcFTAVdKRixP/IeK/cpDwEPbOziuyeavA04NBZmCyMa6gM/UmzC86ng1/fDbxfcHpjojNar40xQQOV3kM3BY7qlJlwSVMq/wjurbTVqOsYMm9w2gwd88HkeVImniLP9wAIFPgJMSXdgeTRxTPp+SlM1WoBcr1cVuEhWOrFZ1vCkfaqUGDP0YIYdlYaLw/E3RVVW5TRsQNoQtT8Lf+XuetbDg/minJk02eCTLZtP4MCc+9PG1b3ldHmIQo+af0UmSHMq1dGnNFZLKLnvBcgGUzLBPGw9XLozIq+ojfrwbjz3bPzQNvxs+FW26qqDeXKi+wSVgmv+dr96evNifpB/HxolCsORVZXgU7daAu+ZcNR8WgyXSMckkJDhDkeFDsGLmOJTM5pEDW6vycFuyS3K/sLYI6NlMgUpooqqcaZ5+pNY/RdTjEg1uEEqtqzMDc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3300.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(396003)(346002)(366004)(136003)(376002)(107886003)(83380400001)(478600001)(33656002)(8676002)(8936002)(55236004)(6506007)(53546011)(52536014)(86362001)(4326008)(186003)(26005)(55016002)(316002)(122000001)(66946007)(7696005)(71200400001)(66476007)(66556008)(66446008)(5660300002)(38100700002)(2906002)(64756008)(9686003)(110136005)(76116006)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?L87rvQtyOoYjcZXWcnxRFybP5El+2ywmMcXD4J+6Nvs3tjDUp4bopfMqMx1Z?=
 =?us-ascii?Q?P/mJ3I498wUOPeJZRdFlkfGDcIk/GsH8nevVai41f7lVHWEvpm2V0pJS9nch?=
 =?us-ascii?Q?vo4z1uyiBcf67ij2jM8CimTmMG6skS5zJHvW1fVM+bqnIadD7xnrJuwC1hLq?=
 =?us-ascii?Q?UMCMyruTSOJgliTeDF1fpDdHAKywBzw098C0wm+3l+N78vFzI7SW85oKJmw2?=
 =?us-ascii?Q?srtCwj7S4Y1pyrKcIBjSvlyiT/UjhQAFvx9PZ7M+OKeYwEHBBftL3QsoAB6T?=
 =?us-ascii?Q?9JnIt/u1B96R44O34sWfFLt+guE8tERcsY2mZq672b2T54gRLEd2gTsJZ8ta?=
 =?us-ascii?Q?jPyitH3NW58CheSkdbY8IZL1MSQ4XYIYRuUjf+eXefAtuQCm7Buv74Ils9P9?=
 =?us-ascii?Q?bPdlIZ8Mo+OYxOnfZpaMtBK/HFEzF/sJXMAeqvBB4yebVW6hDxOGGAm9XT6T?=
 =?us-ascii?Q?F5hpeZsVQMmGb0+X7ce0DOIohr26Vl6c2uuazadG4EdpDHuXKg0XN6cyc4Hk?=
 =?us-ascii?Q?hh3gl9VE6iP0hMJZB8NEqQI53TGtI5zk4IzmvxIJmZ4nIOD1GcxX8yixT+u7?=
 =?us-ascii?Q?C/qgGt84OuCcTQA99V08wTcDrkBAjlQ64NUleJdtctpofwTtHAnJZnCwwkcT?=
 =?us-ascii?Q?CdPP/Lgy0nRoGPMQ1D8uC9RAnTxmZdhPnpDYdzKC79U6gZNvzFAVvyZ58PDz?=
 =?us-ascii?Q?PdDHmszMY4BlppWTwtmNHZc2Z82CHw4tuxYNllOnvs9izdrQYFNrYvOhzENN?=
 =?us-ascii?Q?C0XUaVn3v3FCB5z0Gdgu15jLiNO4d0X+HgUTl8dQaBJABGl6Ml8+Vwklqv8y?=
 =?us-ascii?Q?5GnJ7CKIPglc9GDs0JRk87j0t35S/E7KA+DGyLbxiKvYrkrZy0PN1SkO4lif?=
 =?us-ascii?Q?0YwqU1aAIitrGhRy3y5vt4OOt8saMd6ci1PO7y7M5ndjyc32iF97PrWoXEpe?=
 =?us-ascii?Q?MNJA/cM9UdmweS9Qqo5wsW+Sz+s17FQfPSUvR2VCRFYoTEeJrPk2yH2pPRUn?=
 =?us-ascii?Q?gibQOpYV9hrjeipaHsKHxdUzSnxiQD2OcO+r2vSlNK8DMfosmYnMngO/4pve?=
 =?us-ascii?Q?m0fjh6xPZv0K0ZnazxN+kMceTyOdUxkQUkEKtyKadtD6AZp1Z2dE83mCamZT?=
 =?us-ascii?Q?ns56GQUYqx1JOyjhFO8PWI7+CKfC+68MTvSidyQnBEu/AfclmjrKvJzU/SB8?=
 =?us-ascii?Q?ES9inEetTNGzmk/U8NwbQzI2EDzB4QPEmVm18rpXlAKmu4VqqT8trQJ9gGm7?=
 =?us-ascii?Q?BBTkzuKwd3RqNrTY2Xp6ZRrHHFeKZRwVN1XMxXLkGDjYaH2nThU2RWyrgZsx?=
 =?us-ascii?Q?yoHjxiuMHKemGw8DQk5PUGfu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3300.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe958de1-c7f8-43a0-d9a1-08d934a48e9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2021 11:06:02.0598 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ge2e9E+yDV2pFvAlUxfNXXC4hcfysiOJ8b6Z+R+5SDINJeGO20KX4J9xBHlLszQrAP3l6TClK8RDYGOuCeVG7+fRgZANDd2KTs+mXqM8tc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2228
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "airlied@redhat.com" <airlied@redhat.com>,
 Jenmin Yuan <jenmin_yuan@aspeedtech.com>, Arc Sung <arc_sung@aspeedtech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,=20

May I know if I need to port this patch to the latest drm-misc-next again, =
because the patch has send to review for a while.
If the porting or any other thing can reduce your review effort, please ins=
truct me. Thanks!

Best Regards,
	Kuo-Hsiang Chou

-----Original Message-----
From: dri-devel [mailto:dri-devel-bounces@lists.freedesktop.org] On Behalf =
Of Kuo-Hsiang Chou
Sent: Wednesday, May 26, 2021 6:24 PM
To: tzimmermann@suse.de; dri-devel@lists.freedesktop.org; linux-kernel@vger=
.kernel.org
Subject: RE: [PATCH v4] drm/ast: Disable fast reset after DRAM initial



-----Original Message-----
From: Kuo-Hsiang Chou=20
Sent: Friday, May 07, 2021 5:27 PM
To: tzimmermann@suse.de; dri-devel@lists.freedesktop.org; linux-kernel@vger=
.kernel.org
Cc: airlied@redhat.com; airlied@linux.ie; daniel@ffwll.ch; Jenmin Yuan <jen=
min_yuan@aspeedtech.com>; Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>; =
Arc Sung <arc_sung@aspeedtech.com>
Subject: [PATCH v4] drm/ast: Disable fast reset after DRAM initial

Hi Thomas,

May I know if this patch has sth wrong. Or something I need to improve on i=
t, I can fix it right now. Thanks!

Regards,
	Kuo-Hsiang Chou

[Bug][AST2500]

V1:
When AST2500 acts as stand-alone VGA so that DRAM and DVO initialization ha=
ve to be achieved by VGA driver with P2A (PCI to AHB) enabling.
However, HW suggests disable Fast reset mode after DRAM initializaton, beca=
use fast reset mode is mainly designed for ARM ICE debugger.
Once Fast reset is checked as enabling, WDT (Watch Dog Timer) should be fir=
st enabled to avoid system deadlock before disable fast reset mode.

V2:
Use to_pci_dev() to get revision of PCI configuration.

V3:
If SCU00 is not unlocked, just enter its password again.
It is unnecessary to clear AHB lock condition and restore WDT default setti=
ng again, before Fast-reset clearing.

V4:
repatch after "error : could not build fake ancestor" resolved.

Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
---
 drivers/gpu/drm/ast/ast_drv.h  |  1 +
 drivers/gpu/drm/ast/ast_main.c |  4 ++
 drivers/gpu/drm/ast/ast_post.c | 68 +++++++++++++++++++++-------------
 3 files changed, 47 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h =
index 911f9f414..5ebb5905d 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -346,6 +346,7 @@ bool ast_is_vga_enabled(struct drm_device *dev);  void =
ast_post_gpu(struct drm_device *dev);
 u32 ast_mindwm(struct ast_private *ast, u32 r);  void ast_moutdwm(struct a=
st_private *ast, u32 r, u32 v);
+void ast_patch_ahb_2500(struct ast_private *ast);
 /* ast dp501 */
 void ast_set_dp501_video_output(struct drm_device *dev, u8 mode);  bool as=
t_backup_fw(struct drm_device *dev, u8 *addr, u32 size); diff --git a/drive=
rs/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c index 2aff2e6cf.=
.cfb56ea3a 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -97,6 +97,10 @@ static void ast_detect_config_mode(struct drm_device *de=
v, u32 *scu_rev)
 	jregd0 =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff);
 	jregd1 =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd1, 0xff);
 	if (!(jregd0 & 0x80) || !(jregd1 & 0x10)) {
+		/* Patch AST2500 */
+		if (((pdev->revision & 0xF0) =3D=3D 0x40) && ((jregd0 & 0xC0) =3D=3D 0))
+			ast_patch_ahb_2500(ast);
+
 		/* Double check it's actually working */
 		data =3D ast_read32(ast, 0xf004);
 		if ((data !=3D 0xFFFFFFFF) && (data !=3D 0x00)) { diff --git a/drivers/g=
pu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c index 0607658dd..564=
28798a 100644
--- a/drivers/gpu/drm/ast/ast_post.c
+++ b/drivers/gpu/drm/ast/ast_post.c
@@ -2028,6 +2028,30 @@ static bool ast_dram_init_2500(struct ast_private *a=
st)
 	return true;
 }

+void ast_patch_ahb_2500(struct ast_private *ast) {
+	u32	data;
+
+	/* Clear bus lock condition */
+	ast_moutdwm(ast, 0x1e600000, 0xAEED1A03);
+	ast_moutdwm(ast, 0x1e600084, 0x00010000);
+	ast_moutdwm(ast, 0x1e600088, 0x00000000);
+	ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
+	data =3D ast_mindwm(ast, 0x1e6e2070);
+	if (data & 0x08000000) {					/* check fast reset */
+
+		ast_moutdwm(ast, 0x1E785004, 0x00000010);
+		ast_moutdwm(ast, 0x1E785008, 0x00004755);
+		ast_moutdwm(ast, 0x1E78500c, 0x00000033);
+		udelay(1000);
+	}
+	do {
+		ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
+		data =3D ast_mindwm(ast, 0x1e6e2000);
+	}	while (data !=3D 1);
+	ast_moutdwm(ast, 0x1e6e207c, 0x08000000);	/* clear fast reset */
+}
+
 void ast_post_chip_2500(struct drm_device *dev)  {
 	struct ast_private *ast =3D to_ast_private(dev); @@ -2035,39 +2059,31 @@ =
void ast_post_chip_2500(struct drm_device *dev)
 	u8 reg;

 	reg =3D ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xd0, 0xff);
-	if ((reg & 0x80) =3D=3D 0) {/* vga only */
+	if ((reg & 0xC0) =3D=3D 0) {/* vga only */
 		/* Clear bus lock condition */
-		ast_moutdwm(ast, 0x1e600000, 0xAEED1A03);
-		ast_moutdwm(ast, 0x1e600084, 0x00010000);
-		ast_moutdwm(ast, 0x1e600088, 0x00000000);
-		ast_moutdwm(ast, 0x1e6e2000, 0x1688A8A8);
-		ast_write32(ast, 0xf004, 0x1e6e0000);
-		ast_write32(ast, 0xf000, 0x1);
-		ast_write32(ast, 0x12000, 0x1688a8a8);
-		while (ast_read32(ast, 0x12000) !=3D 0x1)
-			;
-
-		ast_write32(ast, 0x10000, 0xfc600309);
-		while (ast_read32(ast, 0x10000) !=3D 0x1)
-			;
+		ast_patch_ahb_2500(ast);
+
+		/* Disable watchdog */
+		ast_moutdwm(ast, 0x1E78502C, 0x00000000);
+		ast_moutdwm(ast, 0x1E78504C, 0x00000000);
+		/* Reset USB port */
+		ast_moutdwm(ast, 0x1E6E2090, 0x20000000);
+		ast_moutdwm(ast, 0x1E6E2094, 0x00004000);
+		if (ast_mindwm(ast, 0x1E6E2070) & 0x00800000) {
+			ast_moutdwm(ast, 0x1E6E207C, 0x00800000);
+			mdelay(100);
+			ast_moutdwm(ast, 0x1E6E2070, 0x00800000);
+		}
+		/* Modify eSPI reset pin */
+		temp =3D ast_mindwm(ast, 0x1E6E2070);
+		if (temp & 0x02000000)
+			ast_moutdwm(ast, 0x1E6E207C, 0x00004000);

 		/* Slow down CPU/AHB CLK in VGA only mode */
 		temp =3D ast_read32(ast, 0x12008);
 		temp |=3D 0x73;
 		ast_write32(ast, 0x12008, temp);

-		/* Reset USB port to patch USB unknown device issue */
-		ast_moutdwm(ast, 0x1e6e2090, 0x20000000);
-		temp  =3D ast_mindwm(ast, 0x1e6e2094);
-		temp |=3D 0x00004000;
-		ast_moutdwm(ast, 0x1e6e2094, temp);
-		temp  =3D ast_mindwm(ast, 0x1e6e2070);
-		if (temp & 0x00800000) {
-			ast_moutdwm(ast, 0x1e6e207c, 0x00800000);
-			mdelay(100);
-			ast_moutdwm(ast, 0x1e6e2070, 0x00800000);
-		}
-
 		if (!ast_dram_init_2500(ast))
 			drm_err(dev, "DRAM init failed !\n");

--
2.18.4

