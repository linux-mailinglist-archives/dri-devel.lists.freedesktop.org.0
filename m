Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7E57D9866
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 14:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983E310E99F;
	Fri, 27 Oct 2023 12:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2132.outbound.protection.outlook.com [40.107.105.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D409B10E99E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 12:35:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q5qR4OudBOSil0A7D/qm3QGfHd+srwbLOpPzZccAyCoAAZRjLfUw1vKlo18fElApsw5GOSjtBZZYMdEQC0bKEz8Yh9TNpqC5fOZfyv5Fv9sRTdlrh8AOZW9+Whl74mOroEPBHzJN4o7zHbPVQc0qC1Mr4Xkgl+d2bpybHNMTVMTDQHZ8VODUeEs8iFwbQvfMhzXGdFBBhECeu32K6J2q6aD2rId/37uUTR/Ni4bg14PShDuqJSd1lkVS/NXQEqNLDrDqjh0ixrfpnilbbmyufBFXorWG+p0TWpuAKpeQdi51VtqDNwsUq2RhNJg6Mh6x3gFrEy9m9I+5Toxf0D0bwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVL19blso6bJg2bsM1T1VkbSzp4twr/ThdAIW0pAuCQ=;
 b=VVamnnjAjxMX3vBpmMLqKz92+8IY1MjGQU9ZbCaqfT9h45ey1M5ue5r7XC0sg7VmdYhVILRXjZHAKYgXBVDNo8JV2DJgEjoJZFi28NFZdNgaGnozYJy6JyRA/TR8Fi12Zs4Anuwd0WaSGlfwgcUNGj6upvL0Ad6aNM1oDQAoHK1UOnRFoZ9T3aOZqzPK3Wm5kQFJtKgvNF12i/PJX0PEQZpuhQFid+mBuSjNM+LHPo9DsPzo05lXhH8cs9ZVZbdbNJ7UDKE3Q9DlMf8jtOpH4QhFqEs3KYZcBP+6UaynFnZRM+SXFTqdndZ73tl/TyKVaA3JDVK5A+zaUXBgF6PxjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVL19blso6bJg2bsM1T1VkbSzp4twr/ThdAIW0pAuCQ=;
 b=FHWfaLIj4zUt8PZOkO8rMX0htDzn+kbIs7pVTb3Gl2WIN/7bmItuRVlCUFebAcLTdbV/FkjFWPwkzEsOtfDUubnpp2ueNaMYHS6uvplr+qc8fkjcW8GXV3rGXk2GSIjP+b71JRdFZ+gfGB+xvZx85CUIOWUZ/jfxC16wbzzzfs0=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by DU0PR03MB9708.eurprd03.prod.outlook.com (2603:10a6:10:44c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Fri, 27 Oct
 2023 12:35:21 +0000
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35]) by VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35%7]) with mapi id 15.20.6933.024; Fri, 27 Oct 2023
 12:35:21 +0000
From: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm: bridge: adv7511: fix reading edid segments
Thread-Topic: [PATCH] drm: bridge: adv7511: fix reading edid segments
Thread-Index: AQHaB//Vr2lGoiWaYEqV/lAWTsFsCLBdZjaAgAAt2AA=
Date: Fri, 27 Oct 2023 12:35:20 +0000
Message-ID: <ZTuugGjEQLTsCihE@emil-HP-ZBook-Studio-G5>
References: <20231026113029.575846-1-emas@bang-olufsen.dk>
 <87y1fo5r78.fsf@intel.com>
In-Reply-To: <87y1fo5r78.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|DU0PR03MB9708:EE_
x-ms-office365-filtering-correlation-id: b8c55913-15a8-4a49-0a69-08dbd6e92f30
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8nhN21hY+eiGjTkkxuV5hwfrt4xao9I+X9u0vCqpkNz8GfEnwsT7gMdnSLpHptRio8LVGAjb6dwgU/i6+6S+t0O0yHIgp7xFFEOEHpuxIa1yVWHx/kKfmX2Vb5+cVzbIaBBF6xJg+JUX8XrRWyZCQ0XarXg1HtOOQAASaTkQAgQqZJdngqDHYX1qe6qicMXLmJHMUkSU1GRj+/995eepxsN1nyDx4ONMEn3g04QlfM/AX6pd4WHDe2977pREKETrbXk92FtyZt0vs3diksPv8ooJLDBx4o7BqDXS13xjSnp3sbY+vG+uTYYYV5SfCpasXI2Pxe1bKKK9BGseiQynKZ5oF0iJ8qsFeCNyD6dM+C7AsJ8Ay/mJ5DPdR84nvHDLdBsMRFVZQprS4lBnOscGSRXix1RAUVOrzN4/RKMvvbGQf4CtdhBLsw8+abBiOlvGiqUCuGzL9M/XMtE3qXsT0nYc21jfm/5CnhQfbwZu0B7n6hEsOBJkJRRNL/qegvGUwK22K0Sw/MKArc0gdGQsKxXVq6X0MjpwJNzRr7kHqjyFeUUGbEpHPjw1XtHDrm0iRyWRS51n537xVAzePhLQevM0q/25IoPou8Y7hvslrO0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB4942.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(366004)(39860400002)(376002)(346002)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(38070700009)(33716001)(26005)(2906002)(5660300002)(38100700002)(6916009)(41300700001)(86362001)(8936002)(66476007)(4326008)(7416002)(8676002)(6506007)(54906003)(91956017)(478600001)(66446008)(9686003)(66556008)(71200400001)(122000001)(64756008)(76116006)(316002)(66946007)(6486002)(83380400001)(6512007)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fjF0fXTMrQWlkN2K0Bn0z0kP/64QgXYrotJxhvmc1qKS2rRCx6XlFZ0Ig57M?=
 =?us-ascii?Q?P+WItWsYztlo6CP2uB4NyzywUHgyC8r18us5njnxDnoHTSIXgfdC3yekop2r?=
 =?us-ascii?Q?chnTzP8pm3P0D1mRVkR+9zBXOH8CL0drnsQXGgkhauct/rd1wN4UOa0eTxW+?=
 =?us-ascii?Q?I0HDkSI6MV7ubgOrGXrzZoBNRbd2Po+mmv9UYJeQ/PETYXhW6k8n1D5qY9p8?=
 =?us-ascii?Q?VlVp4t3Y8I+qe8LYxojnSVxhyG3Vln1SIbxqLvihlag87NmxYu7upYBQhMYR?=
 =?us-ascii?Q?3ffei+Fabx1ykO5FEb6wNvVYkjXicSki1mf/4EBhaohzFFV3bFAHwSkMrfq+?=
 =?us-ascii?Q?DdnWWl200Wwh1RhfoR5kIiAWw76ok7jFdzVmk5eqd4SXOht9/6epR+jz5VYG?=
 =?us-ascii?Q?E6KaocPxSwz2RhNbmN0Wgw7yZ2H1+JMn/5YT5QOTgqws6KAAftHLi/WjAjUL?=
 =?us-ascii?Q?ot6hD6wzV7X32C/+Is6E5YvuFUD0+R6KZmt81/JFWnW0gn21lfpKM6l0gbVu?=
 =?us-ascii?Q?3eVNH38Krr8ry4KrU6TJd/UzmoOO/mMwG7JkTu5LJD88wvDTUZvPAWrbQ0q0?=
 =?us-ascii?Q?l8U1sMfriHWOLXWVX+F3OXRGdDOwHPb6Sg6vUPCItDn+Z1Pi16wALd8UFfT2?=
 =?us-ascii?Q?UzeGBeyMDGTmb78c1T8Y+XMnWmxVgRSe4AerlQPN2CBa1qAustDHyGM/jSeV?=
 =?us-ascii?Q?xNSHtMuyPtE1MQvfnX8XP5xIGrzAxAf7QT0cm7S1/0c684p8ptrogfOZcwTS?=
 =?us-ascii?Q?/zJ2uXfVIS1fHhNMMvyj6Tx75JhnJQtzzO2Fkb6udVb7VBbj5iHJ8gAPZ7wY?=
 =?us-ascii?Q?IYw3y6CYWO8MlHLeHzuxkJC/89WmxpKegtNRNTHCaLZ2PPXLuA2Al7nnd2Fh?=
 =?us-ascii?Q?c/MKPnfSO+5T1mwJYzmdZetSqhfJnrj//94AHdXkZAnfwdA8hyf/f/RFy3um?=
 =?us-ascii?Q?34dvvqvvsGu58iXocuzFCdaegVgC+dl+MPfUOwb85chEKepL3qqOieTubYvD?=
 =?us-ascii?Q?BKZJgiGZhXyRba4Vy9OgarIUQfpVGCcmJCjsvLDHNkEQyb1wIoYM6Pz+Qprv?=
 =?us-ascii?Q?HqaK91AihkzSJ4FWRqH9dy7/PmYQGY7wg00MfI/ymv2qH3QO/U7GwhZMBFWt?=
 =?us-ascii?Q?fHCLEs8Mu+n1u/woecpoM114v6Bi6dot4Hg6fgpglHLTlA3iWYb8d1hyclVm?=
 =?us-ascii?Q?/jEgo+moiRxaoVQ66x2S9VmLzOGX04lzsJAH4sh2flzBMcPfxa9bCKozUdG1?=
 =?us-ascii?Q?eXfsXCzSuA9P6nygz8k2n4rxEKcBFJdFf3rQBnf2NQBCGGHs0fif6O4Y3P+q?=
 =?us-ascii?Q?KyJijIDnQv61jqsMYy4lnTYtKvocR5Au4A6LXWYIok6OUPgzVr89T+P6N5HT?=
 =?us-ascii?Q?InDpUnl6UlAxDuDUh4x6tNkoNcGAJKXzxEQftwRZF2YrtIYrFz59RTi/BADy?=
 =?us-ascii?Q?W4LdrtyTiu02ONCL6FbE4kLMKyIj8i80yvDD96BVANh3lcO6GixB4fsrTIxX?=
 =?us-ascii?Q?JKIoG24vUmu8yV/6OI6UuwN9s+MCIFPTFvylxCJYtCol7S1ZfuM0sKO7gLq+?=
 =?us-ascii?Q?2Zg1Er83hbpbJi33M2x+zdieSiDJCgZjlZ74YvkK9ri3pcKJk2CkRZKMq78v?=
 =?us-ascii?Q?iw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C0320FA52ED58745BBD49E371C25BA55@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c55913-15a8-4a49-0a69-08dbd6e92f30
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 12:35:21.0275 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HlxYhV9O9OoJbwzsKptbHkIqtBr3q0Xz5UJh+4SsPR8enuJzGxwU7IjZqYeReUSBCWAXtduxCzHUfU6Hik1Ugw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9708
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 27, 2023 at 12:51:07PM +0300, Jani Nikula wrote:
> On Thu, 26 Oct 2023, Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk> wrot=
e:
> > Currently reading EDID only works because usually only two EDID blocks
> > of 128 bytes is used. Where an EDID segment holds 256 bytes or two EDID
> > blocks. And the first EDID segment read works fine but E-EDID specifies
> > up to 128 segments.
> >
> > The logic is broken so change EDID segment index to multiple of 256
> > bytes and not 128 (block size).
> >
> > Also change check of DDC status. Instead of silently not reading EDID
> > when in "IDLE" state [1]. Check if the DDC controller is in reset
> > instead (no HPD).
>=20
> "Also" in a commit message is often a good indication that the patch
> should be split to do the "also" in a separate patch. One "thing" per
> patch. Here, it'll be useful for debugging [1], too, to figure out which
> part broken things. (I suspect it's the status handling.)

Thank you for the tip! I have now split it into two [1]. Yes, I believe
you're correct, it's the status handling.

[1] https://lore.kernel.org/all/20231027122214.599067-1-emas@bang-olufsen.d=
k/
>=20
>=20
> BR,
> Jani.
>=20
>=20
> [1] https://lore.kernel.org/r/5aa375f1-07cd-4e28-8cd5-7e10b4b05c6a@kontro=
n.de
>=20
>=20
> >
> > [1]
> > ADV7511 Programming Guide: Table 11: DDCController Status:
> >
> >   0xC8 [3:0]  DDC Controller State
> >
> >   0000        In Reset (No Hot Plug Detected)
> >   0001        Reading EDID
> >   0010        IDLE (Waiting for HDCP Requested)
> >   0011        Initializing HDCP
> >   0100        HDCP Enabled
> >   0101        Initializing HDCP Repeater
> >
> > Signed-off-by: Emil Svendsen <emas@bang-olufsen.dk>
> > ---
> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 24 ++++++++++++--------
> >  1 file changed, 15 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu=
/drm/bridge/adv7511/adv7511_drv.c
> > index 8be235144f6d..c641c2ccd412 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > @@ -537,6 +537,8 @@ static int adv7511_get_edid_block(void *data, u8 *b=
uf, unsigned int block,
> >                                 size_t len)
> >  {
> >       struct adv7511 *adv7511 =3D data;
> > +     struct device* dev =3D &adv7511->i2c_edid->dev;
> > +     int edid_segment =3D block / 2;
> >       struct i2c_msg xfer[2];
> >       uint8_t offset;
> >       unsigned int i;
> > @@ -545,7 +547,7 @@ static int adv7511_get_edid_block(void *data, u8 *b=
uf, unsigned int block,
> >       if (len > 128)
> >               return -EINVAL;
> >
> > -     if (adv7511->current_edid_segment !=3D block / 2) {
> > +     if (adv7511->current_edid_segment !=3D edid_segment) {
> >               unsigned int status;
> >
> >               ret =3D regmap_read(adv7511->regmap, ADV7511_REG_DDC_STAT=
US,
> > @@ -553,15 +555,19 @@ static int adv7511_get_edid_block(void *data, u8 =
*buf, unsigned int block,
> >               if (ret < 0)
> >                       return ret;
> >
> > -             if (status !=3D 2) {
> > -                     adv7511->edid_read =3D false;
> > -                     regmap_write(adv7511->regmap, ADV7511_REG_EDID_SE=
GMENT,
> > -                                  block);
> > -                     ret =3D adv7511_wait_for_edid(adv7511, 200);
> > -                     if (ret < 0)
> > -                             return ret;
> > +             if (!(status & 0x0F)) {
> > +                     dev_dbg(dev, "DDC in reset no hot plug detected %=
x\n",
> > +                              status);
> > +                     return -EIO;
> >               }
> >
> > +             adv7511->edid_read =3D false;
> > +             regmap_write(adv7511->regmap, ADV7511_REG_EDID_SEGMENT,
> > +                          edid_segment);
> > +             ret =3D adv7511_wait_for_edid(adv7511, 200);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> >               /* Break this apart, hopefully more I2C controllers will
> >                * support 64 byte transfers than 256 byte transfers
> >                */
> > @@ -589,7 +595,7 @@ static int adv7511_get_edid_block(void *data, u8 *b=
uf, unsigned int block,
> >                       offset +=3D 64;
> >               }
> >
> > -             adv7511->current_edid_segment =3D block / 2;
> > +             adv7511->current_edid_segment =3D edid_segment;
> >       }
> >
> >       if (block % 2 =3D=3D 0)
>=20
> --
> Jani Nikula, Intel=
