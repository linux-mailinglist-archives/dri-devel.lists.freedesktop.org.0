Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA1283F976
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 20:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E4710E751;
	Sun, 28 Jan 2024 19:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF62110E737
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 19:34:50 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-323-SOw5q3D0MG6-hLHIb3ORig-1; Sun, 28 Jan 2024 19:34:47 +0000
X-MC-Unique: SOw5q3D0MG6-hLHIb3ORig-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 28 Jan
 2024 19:34:23 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 28 Jan 2024 19:34:23 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>, "'Linus
 Torvalds'" <torvalds@linux-foundation.org>, 'Netdev'
 <netdev@vger.kernel.org>, "'dri-devel@lists.freedesktop.org'"
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH next 09/11] tree-wide: minmax: Replace all the uses of max()
 for array sizes with max_const()
Thread-Topic: [PATCH next 09/11] tree-wide: minmax: Replace all the uses of
 max() for array sizes with max_const()
Thread-Index: AdpSIQx7w4lMNPy/TmCWjt5UFKRyKA==
Date: Sun, 28 Jan 2024 19:34:23 +0000
Message-ID: <10638249b13c43cab9a5522271aa99e2@AcuMS.aculab.com>
References: <0ca26166dd2a4ff5a674b84704ff1517@AcuMS.aculab.com>
In-Reply-To: <0ca26166dd2a4ff5a674b84704ff1517@AcuMS.aculab.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: 'Jens Axboe' <axboe@kernel.dk>,
 "'Matthew Wilcox \(Oracle\)'" <willy@infradead.org>,
 'Christoph Hellwig' <hch@infradead.org>,
 "'linux-btrfs@vger.kernel.org'" <linux-btrfs@vger.kernel.org>,
 'Andrew Morton' <akpm@linux-foundation.org>,
 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>,
 "'David S . Miller'" <davem@davemloft.net>, 'Dan
 Carpenter' <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are the only uses of max() that require a constant value
from constant parameters.
There don't seem to be any similar uses of min().

Replacing the max() by max_const() lets min()/max() be simplified
speeding up compilation.

max_const() will convert enums to int (or unsigned int) so that the
casts added by max_t() are no longer needed.

Signed-off-by: David Laight <david.laight@aculab.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c         | 2 +-
 drivers/gpu/drm/drm_color_mgmt.c               | 4 ++--
 drivers/input/touchscreen/cyttsp4_core.c       | 2 +-
 drivers/net/can/usb/etas_es58x/es58x_devlink.c | 2 +-
 fs/btrfs/tree-checker.c                        | 2 +-
 lib/vsprintf.c                                 | 4 ++--
 net/ipv4/proc.c                                | 2 +-
 net/ipv6/proc.c                                | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c b/drivers/gpu/drm/amd/p=
m/swsmu/smu_cmn.c
index 00cd615bbcdc..935fb4014f7c 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
@@ -708,7 +708,7 @@ static const char *smu_get_feature_name(struct smu_cont=
ext *smu,
 size_t smu_cmn_get_pp_feature_mask(struct smu_context *smu,
 =09=09=09=09   char *buf)
 {
-=09int8_t sort_feature[max(SMU_FEATURE_COUNT, SMU_FEATURE_MAX)];
+=09int8_t sort_feature[max_const(SMU_FEATURE_COUNT, SMU_FEATURE_MAX)];
 =09uint64_t feature_mask;
 =09int i, feature_index;
 =09uint32_t count =3D 0;
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_m=
gmt.c
index d021497841b8..43a6bd0ca960 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -532,8 +532,8 @@ int drm_plane_create_color_properties(struct drm_plane =
*plane,
 {
 =09struct drm_device *dev =3D plane->dev;
 =09struct drm_property *prop;
-=09struct drm_prop_enum_list enum_list[max_t(int, DRM_COLOR_ENCODING_MAX,
-=09=09=09=09=09=09       DRM_COLOR_RANGE_MAX)];
+=09struct drm_prop_enum_list enum_list[max_const(DRM_COLOR_ENCODING_MAX,
+=09=09=09=09=09=09      DRM_COLOR_RANGE_MAX)];
 =09int i, len;
=20
 =09if (WARN_ON(supported_encodings =3D=3D 0 ||
diff --git a/drivers/input/touchscreen/cyttsp4_core.c b/drivers/input/touch=
screen/cyttsp4_core.c
index 7cb26929dc73..c6884c3c3fca 100644
--- a/drivers/input/touchscreen/cyttsp4_core.c
+++ b/drivers/input/touchscreen/cyttsp4_core.c
@@ -871,7 +871,7 @@ static void cyttsp4_get_mt_touches(struct cyttsp4_mt_da=
ta *md, int num_cur_tch)
 =09struct cyttsp4_touch tch;
 =09int sig;
 =09int i, j, t =3D 0;
-=09int ids[max(CY_TMA1036_MAX_TCH, CY_TMA4XX_MAX_TCH)];
+=09int ids[max_const(CY_TMA1036_MAX_TCH, CY_TMA4XX_MAX_TCH)];
=20
 =09memset(ids, 0, si->si_ofs.tch_abs[CY_TCH_T].max * sizeof(int));
 =09for (i =3D 0; i < num_cur_tch; i++) {
diff --git a/drivers/net/can/usb/etas_es58x/es58x_devlink.c b/drivers/net/c=
an/usb/etas_es58x/es58x_devlink.c
index 635edeb8f68c..28fa87668bf8 100644
--- a/drivers/net/can/usb/etas_es58x/es58x_devlink.c
+++ b/drivers/net/can/usb/etas_es58x/es58x_devlink.c
@@ -215,7 +215,7 @@ static int es58x_devlink_info_get(struct devlink *devli=
nk,
 =09struct es58x_sw_version *fw_ver =3D &es58x_dev->firmware_version;
 =09struct es58x_sw_version *bl_ver =3D &es58x_dev->bootloader_version;
 =09struct es58x_hw_revision *hw_rev =3D &es58x_dev->hardware_revision;
-=09char buf[max(sizeof("xx.xx.xx"), sizeof("axxx/xxx"))];
+=09char buf[max_const(sizeof("xx.xx.xx"), sizeof("axxx/xxx"))];
 =09int ret =3D 0;
=20
 =09if (es58x_sw_version_is_valid(fw_ver)) {
diff --git a/fs/btrfs/tree-checker.c b/fs/btrfs/tree-checker.c
index 6eccf8496486..aec4729a9a82 100644
--- a/fs/btrfs/tree-checker.c
+++ b/fs/btrfs/tree-checker.c
@@ -615,7 +615,7 @@ static int check_dir_item(struct extent_buffer *leaf,
 =09=09 */
 =09=09if (key->type =3D=3D BTRFS_DIR_ITEM_KEY ||
 =09=09    key->type =3D=3D BTRFS_XATTR_ITEM_KEY) {
-=09=09=09char namebuf[max(BTRFS_NAME_LEN, XATTR_NAME_MAX)];
+=09=09=09char namebuf[max_const(BTRFS_NAME_LEN, XATTR_NAME_MAX)];
=20
 =09=09=09read_extent_buffer(leaf, namebuf,
 =09=09=09=09=09(unsigned long)(di + 1), name_len);
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 552738f14275..6c3c319afd86 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1080,8 +1080,8 @@ char *resource_string(char *buf, char *end, struct re=
source *res,
 #define FLAG_BUF_SIZE=09=09(2 * sizeof(res->flags))
 #define DECODED_BUF_SIZE=09sizeof("[mem - 64bit pref window disabled]")
 #define RAW_BUF_SIZE=09=09sizeof("[mem - flags 0x]")
-=09char sym[max(2*RSRC_BUF_SIZE + DECODED_BUF_SIZE,
-=09=09     2*RSRC_BUF_SIZE + FLAG_BUF_SIZE + RAW_BUF_SIZE)];
+=09char sym[max_const(2*RSRC_BUF_SIZE + DECODED_BUF_SIZE,
+=09=09=09   2*RSRC_BUF_SIZE + FLAG_BUF_SIZE + RAW_BUF_SIZE)];
=20
 =09char *p =3D sym, *pend =3D sym + sizeof(sym);
 =09int decode =3D (fmt[0] =3D=3D 'R') ? 1 : 0;
diff --git a/net/ipv4/proc.c b/net/ipv4/proc.c
index 5f4654ebff48..a4aff27f949b 100644
--- a/net/ipv4/proc.c
+++ b/net/ipv4/proc.c
@@ -43,7 +43,7 @@
 #include <net/sock.h>
 #include <net/raw.h>
=20
-#define TCPUDP_MIB_MAX max_t(u32, UDP_MIB_MAX, TCP_MIB_MAX)
+#define TCPUDP_MIB_MAX max_const(UDP_MIB_MAX, TCP_MIB_MAX)
=20
 /*
  *=09Report socket allocation statistics [mea@utu.fi]
diff --git a/net/ipv6/proc.c b/net/ipv6/proc.c
index 6d1d9221649d..7fedb60aaeac 100644
--- a/net/ipv6/proc.c
+++ b/net/ipv6/proc.c
@@ -27,7 +27,7 @@
 #include <net/ipv6.h>
=20
 #define MAX4(a, b, c, d) \
-=09max_t(u32, max_t(u32, a, b), max_t(u32, c, d))
+=09max_const(max_const(a, b), max_const(c, d))
 #define SNMP_MIB_MAX MAX4(UDP_MIB_MAX, TCP_MIB_MAX, \
 =09=09=09IPSTATS_MIB_MAX, ICMP_MIB_MAX)
=20
--=20
2.17.1

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

