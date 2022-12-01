Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C19640515
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 11:48:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9012010E6C9;
	Fri,  2 Dec 2022 10:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD2710E5E6
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 14:00:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHL8UsPkvfFqQhdm4eeETr7k9zy76xgvDBN7QCnzXaG2a4x3+bnNljCpePlS0MbVcfhbjVZS+Mlu/aTZ8MyDHyy1cMpJX/2o96T9Td3u5nwJrZQyGhRCwTKKYHDMsqpdEuFi1TFjOpBZIV81YMV97rHJglv3gp/hQ9pZIkI2oXeGu5Lx0R/jr9xITp6NUnZy1bCsIGSK21mk0WiOKvd/vsseIhlzm3qGqAbosoYHUxMewaLtDpmt6ywy0q3eXKFUvagWmROpafk5ItKBJBk73JmWy3hzcR3qMyZB4EnDrI+3NVeu0sl9hpmyi22N+sgwHrLUW0GklZDLVHyAEBIKzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1uHt/BjsdwtUgYMAy9s07cMucb66t8VYub3NDbd3M0=;
 b=IaAgZWxA0q5CfyXNzeQIkY6iJmQRabwTGn034CsnX1mhZAv02mZFA6+NbmFImIQGNH2WajduVkJawZy3qweFuCHb6WOR5UawJN+6vfEaTP9O3/zhd5dbWcnKkjkg/fNK64Nxf40wJGMgDApljDhKgP86YXeojDgpjDoySsRzBqm+cEixrA9cnFoVWCm7Wx0rgFayEnb2s7olB4xCa0ElHiJz1nHWpJOl+1gfGcyC1i7W00VIn9sl93RkBeZR4uq8L937ZQv9atdg0AXk4g220U71wofQtk0qhvlL6Q6JhM7+KS1/agr2eVYK+NfQ954mKcD+Fnyu+XQrh3VPujaGhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1uHt/BjsdwtUgYMAy9s07cMucb66t8VYub3NDbd3M0=;
 b=G83pv0q0UvfLV5ucBF6buByoP2xDjV3UsMGWQfMIp7KbxzoLcKaZbqk0iTB7GF5GpJwfcpB1Br+J/q4e/4mVg7M1LmNK7NjjbazY5lSFMYSy09udjDYDrBJWI/hlFR6yQAKF+ycTIqdJtQMniFWuLaZRS0TgR6Pc9arP/iWMCME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by SA0PR03MB5593.namprd03.prod.outlook.com (2603:10b6:806:b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 14:00:03 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1%5]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 14:00:03 +0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 1/2] drm/fourcc: Add Synaptics VideoSmart tiled
 modifiers
From: Randy Li <ranl@synaptics.com>
In-Reply-To: <Y4h2LFfDLZjC+JVc@phenom.ffwll.local>
Date: Thu, 1 Dec 2022 21:59:56 +0800
Message-Id: <B7EA66D1-1454-4612-BA68-59D4875506AD@synaptics.com>
References: <Y4h2LFfDLZjC+JVc@phenom.ffwll.local>
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailer: iPad Mail (18D61)
X-ClientProxiedBy: SJ0PR13CA0113.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::28) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|SA0PR03MB5593:EE_
X-MS-Office365-Filtering-Correlation-Id: 51f8d779-2067-4d5f-23d3-08dad3a45808
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mURDvBX2NcU2StsSNCWLMrwyVONALoJERGIRsJC8Q17+yTSMifJtq4ZLoWCxxuS9SWD2jjzSQRJVwqQIxTf6LxQfZpMADBAJXon2CuvJuaaE8bD2T+6tESEZ4vVzY/i5O1OnSR5WBJ+PBnru3+eLwEm45bapz/CvMxbpXJVdOtBeCYHw4Bd0j6UdgTtX6H+k8IlECJI9zzEdUWkFN+M6EJ7d3UHO49UhgXTZ0yQ7C5TIfebABSUH1lg8HqM36tDzV9ocM2hJTl7lgTrm03fAC0cqe+N9V2ymyveNefGBFiWSxzUcoW6lWXCfixsob+q5fLVTjTwzlNmnY98xLwrg/PX83/gM7p0oKquRgAYZGo7O8bKcUfNPIodP5LglOb0ftcSKpsoAfLzvlTfBOJBeQehYRap4f3s0/NH4KaLU+S+3wpLZ0niXTBmiGw2uPGBnneYOShCkVDjPXjfQF34kOePFQffkaknYcyv0ylCLtln4WKNxDkLY6WDjhiz/nkWgak9RG6M6ids968JC3CG5nHXKRNYPTYFNNmkRAW3F2vK+ckV+ox16nL5Ppy7m1xA+uqt25O5+QHDqjX22+q5Q7YMCYR26WL4it39VeQQURO2K9VzQpodSH5Y2WQ3vZ1xdShj2YRc1zoyT1GTePFtGfSouvs86jukMLoPFOp8GbFv9GySWAcOzegSAk6eLifQRWgDKIxwgN463kQDdD+pPqZN00FcOzf8Ynp4yuNR/ckrXOTnEyufNSMtXnw5CaThv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(39860400002)(376002)(396003)(346002)(366004)(451199015)(36756003)(66556008)(7416002)(6666004)(38350700002)(38100700002)(6916009)(5660300002)(6512007)(316002)(26005)(186003)(33656002)(41300700001)(6506007)(8936002)(66476007)(8676002)(2616005)(4326008)(66946007)(966005)(6486002)(478600001)(83380400001)(2906002)(52116002)(53546011)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0VVYzlLWXlFamw2VGdNU0svMFhlMkJ4aHJYSHAwUmJKSHlTTlhrRFhaK21J?=
 =?utf-8?B?Nlh3MXNkbnlVK1lKRFp3ZTQyNnpKV1N4eUsyK0xoUGRKckcwVUd0R0RYcjNo?=
 =?utf-8?B?bklkZit6MUtTK3l2ZG53cWNTSGJnTWlMdXdNVzhGM3VOTzRYVUtERWJ0eGFz?=
 =?utf-8?B?QXhvdCtUSzJCOUpPOXNBTHdTWm9qNmNwY0ZSU05NVDE0V3NoQU9MckNQL2hz?=
 =?utf-8?B?anVLMFBkbXA2eStHYkh3bWxBSWtuTGlSOTlrNUFjb2M4cEEyOThiSFRZS3Y3?=
 =?utf-8?B?OGxkUDBmSUpNWDNKdXYvVEtuV1VXcHFUV3lHZmQweTAxT2FZaVNWVlRHTklm?=
 =?utf-8?B?MWp1M1VhdVR6ek9zS1dtVkowajVicFpxc1V0UUIrRFBDMW01dXF0SGxaMmxx?=
 =?utf-8?B?eXA0U3Z5ZFpHc2pnME5TK29pUFlNVnhQdGFMd0lPT3RlLzVQZG00S3VDSTI3?=
 =?utf-8?B?VFhRczlrNTZjdi84WHVrdHBRbVVjb0kxS3BmOGlaT243SlZHRXlVeG9wc0RO?=
 =?utf-8?B?VklCZFNmQjlWaFU0WFVFcnIxc3JKZVFiRVVGMDBuVGVXT3k0TEd5R0thNDFP?=
 =?utf-8?B?NHJSWnRqMlJHRWc3NklKdEtNMnNSR0wzZElzTzlEV1FZOFJiVTROSFk5VFJr?=
 =?utf-8?B?djczNzZQcnlKV25NbWxoU0NaZ2ZrQ1FOWDJUSnFTODJ4TXhrZENub0NVbFMx?=
 =?utf-8?B?ZWtySUc3VlFhQkx6MzAybUs5K0JZVWM1WWVHUE1Wb0NXcGRMN1d5UVozVkZW?=
 =?utf-8?B?ZkltVkhzb29yK25nSlVvcEdIQTdENjJNcm5pU3ZLMHpIbVFCSEVVQzBWeGxP?=
 =?utf-8?B?dTE0RFIzdndKRmYzWW0zbWJCcW00WnRrVmxUS2cwMnY5Qmgwb2hGL0xSOVFm?=
 =?utf-8?B?ZFZoV25Uc3l5MGdiK09ldzAvTS9NSlpFWWx4VmxGcVB1S0o3cTdpMlRVajVy?=
 =?utf-8?B?ZHRkZmQ1a29hczJJTUZSNnhZWXBGSkxaUFlYNU9pTzRHckhkWUcyYzc0cXRs?=
 =?utf-8?B?R3ROcmp5TjYyRGhBSTlZN09xaHdqZjZ2ZElNNEM3VzJnMnluK25TYUR4QndE?=
 =?utf-8?B?em5aaG0ybW5RRThJSlFrWHNRYzZoQ3pkdUQvRzRuL0RLaUZQN1hhdkJ3NE5p?=
 =?utf-8?B?VmUzOU9tUnJndTV4Y3dlcFZpUU01R1BXTWdtWWVpa1pkb1NqQ09uL1ZoRHFO?=
 =?utf-8?B?LzNJelJsSDU1cHdKVzgxL0JOdnBuRE55S3hndCtxZkNLYkVUd3hNU3pIZkp6?=
 =?utf-8?B?bWVZaWNBdkE1aWY3WExMeWl6cFFqdTdZVkMyc2NMNHhQVlZLejk5VFJaNmJq?=
 =?utf-8?B?azhyQWR2MlV3OGtobkRVdlBkNi9pR0hiVGltU2tWTjV0UDdPK2ZNdUZhMTNG?=
 =?utf-8?B?V1BLaUVrdGZERVB4dDhOdzcwMHgzS1dKRjRINHlFYVA0Z1FCeUFDdWFpZlYz?=
 =?utf-8?B?V3g3MGt4THhNZGNlUk9wb3ZCc1IzZDFOanpKYnYydFlwRTZ3dFE5UTJ0S1Jy?=
 =?utf-8?B?T2RpVVpLRzFtUGRQd2h3SnZ0bDlpeFpPcnVoc1FQbGgyaW5hRmZNZzFzL0xs?=
 =?utf-8?B?Zm02MkhWRkNrNTBlOW52K2Q2TTN5WjR0TFZxRkthZTZRU1ZsS1RvSGkzZHhH?=
 =?utf-8?B?WE1tZWpZRzRPWE5UK1o0OWxZbUg0R2ptWUJ5K2tzVjY2TU9hS1d5V3cxM2VV?=
 =?utf-8?B?V1kwdkx1aW5LM1AxYTBYc1l0S0Y4ZXVFSXZsM2pOa2RDa21RRlZBWSs4c3Zq?=
 =?utf-8?B?Unl1ek9jL2Njc0lodGZEVDZxVnZPM0tGMUdUUDBsazR5ZjhzZlVyaytVU2o2?=
 =?utf-8?B?Mit3RngrZHZ3RjF5UTMzd0ZHWFliQnQ3bzVqaUtSYTZKWlNsTE9ERCtFN1ZO?=
 =?utf-8?B?Wm1zem52T3duUHVacWNEMmR4MGZSUnA1cTFlcXI2b2xTVmxucXJ1Q3hXcVpp?=
 =?utf-8?B?NWtSSWFpSXFQb2Y2YWVMOC9QZTNVNUtKQUJPMURuZWQ5a3VwV0lxRjFnSWlj?=
 =?utf-8?B?eE1nVDJ2bk4wOTBFSzFQUy9GUnIydTRKUTVyMTVGNDdHT2JEcGFsaUtiZXRz?=
 =?utf-8?B?WmhEekoyRUgzVit6NjV1Y1o5TTkyTGV2SVVxTkN6dTBIMkt1UHhkWHJNSnVB?=
 =?utf-8?Q?+985qHzxt+pE34u1Ciu8Tz5+Y?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f8d779-2067-4d5f-23d3-08dad3a45808
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 14:00:03.2622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sDmI1yfxaQqbWcV3so3T6SuVSL0l/2ZM9VEVYeU+sIeFQ7WWTga1HaiSPg2XJrR98637fP1MEngLigeyfxiBxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5593
X-Mailman-Approved-At: Fri, 02 Dec 2022 10:48:00 +0000
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
Cc: mchehab@kernel.org, laurent.pinchart@ideasonboard.com, tzimmermann@suse.de,
 airlied@linux.ie, ayaka@soulik.info, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca,
 Hsia-Jun Li <randy.li@synaptics.com>, helen.koike@collabora.com,
 ezequiel@vanguardiasur.com.ar, sakari.ailus@linux.intel.com,
 ribalda@chromium.org, sebastian.hesselbarth@gmail.com, tfiga@chromium.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Sent from my iPad

> On Dec 1, 2022, at 5:39 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
> =EF=BB=BFCAUTION: Email originated externally, do not click links or open=
 attachments unless you recognize the sender and know the content is safe.
>=20
>=20
>> On Thu, Dec 01, 2022 at 12:49:16AM +0800, Randy Li wrote:
>>=20
>>=20
>> Sent from my iPad
>>=20
>>>> On Nov 30, 2022, at 7:30 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
>>> =EF=BB=BFCAUTION: Email originated externally, do not click links or op=
en attachments unless you recognize the sender and know the content is safe=
.
>>>> On Wed, Nov 30, 2022 at 05:21:48PM +0800, Hsia-Jun Li wrote:
>>>> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
>>>> Those modifiers only record the parameters would effort pixel
>>>> layout or memory layout. Whether physical memory page mapping
>>>> is used is not a part of format.
>>>> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
>>>> ---
>>>> include/uapi/drm/drm_fourcc.h | 76 +++++++++++++++++++++++++++++++++++
>>>> 1 file changed, 76 insertions(+)
>>>> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_four=
cc.h
>>>> index bc056f2d537d..e0905f573f43 100644
>>>> --- a/include/uapi/drm/drm_fourcc.h
>>>> +++ b/include/uapi/drm/drm_fourcc.h
>>>> @@ -407,6 +407,7 @@ extern "C" {
>>>> #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>>>> #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
>>>> #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
>>>> +#define DRM_FORMAT_MOD_VENDOR_SYNAPTICS 0x0b
>>>> /* add more to the end as needed */
>>>> @@ -1507,6 +1508,81 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64=
 modifier)
>>>> #define AMD_FMT_MOD_CLEAR(field) \
>>>>     (~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIF=
T))
>>>> +/*
>>>> + * Synaptics VideoSmart modifiers
>>>> + *
>>>> + * Tiles could be arranged in Groups of Tiles (GOTs), it is a small t=
ile
>>>> + * within a tile. GOT size and layout varies based on platform and
>>>> + * performance concern.
>>>> + *
>>>> + * Besides, an 8 length 4 bytes arrary (32 bytes) would be need to st=
ore
>>>> + * some compression parameters for a compression metadata plane.
>>>> + *
>>>> + * Further information can be found in
>>>> + * Documentation/gpu/synaptics.rst
>>>> + *
>>>> + *       Macro
>>>> + * Bits  Param Description
>>>> + * ----  ----- ------------------------------------------------------=
-----------
>>>> + *
>>>> + *  7:0  f     Scan direction description.
>>>> + *
>>>> + *               0 =3D Invalid
>>>> + *               1 =3D V4, the scan would always start from vertical =
for 4 pixel
>>>> + *                   then move back to the start pixel of the next ho=
rizontal
>>>> + *                   direction.
>>>> + *               2 =3D Reserved for future use.
>>>> + *
>>>> + * 15:8  m     The times of pattern repeat in the right angle directi=
on from
>>>> + *             the first scan direction.
>>>> + *
>>>> + * 19:16 p     The padding bits after the whole scan, could be zero.
>>>> + *
>>>> + * 20:20 g     GOT packing flag.
>>>> + *
>>>> + * 23:21 -     Reserved for future use.  Must be zero.
>>> Can you pls fold all the future use reservations into the top end?
>> You see we could put more related flag in each of reserved area.
>> Here is for the group of tiles flag.
>> Bit 35 to 32 could be used for describing the dimension of the group of =
tiles.
>=20
> Oh also on the dimension thing, this is the tile size and has nothing to
> do with the overall buffer size, right?
I don=E2=80=99t think you could have a insufficient tile, that applies to t=
he group of tile.
> Because the overall buffer size is
> meant to be carried in separate metadata (like the drm_framebuffer
> structure or ADDFB2 ioctl data). drm fourcc/modifier assume that height,
> width, offset and stride are specified per plane already (unless the
> auxiary plane has a fixed layout and is not tracked as a separate plane
> for this format).
One thing I noticed here, there is no way to tell the buffer size that user=
 should request/allocate from the drm API. It needs to be calculated in the=
 userspace unless you would use the custom ioctl.
>=20
>>> Also I
>>> think it'd be good to at least reserve maybe the top 8 bits or so for a
>>> synaptics specific format indicator, so that it's easier to extend this=
 in
>>> the future ...
>> I think the  bit 56 to 63 are used for storing the vendor id. That is wh=
y I didn=E2=80=99t include them below. Or you mean the bit 7 to 0?
>> Do yo
>=20
> Yeah there's 8 bit vendor id, but you could reserve another 8 bit at the
> top (so 48:55 or something like that) to enumerate within the synaptics
> space. Just to future proof the schema, because experience says that hw
> engineers absolutely do love to change this stuff eventually.
I left the whole 37:55.
> -Daniel
>=20
>>> -Daniel
>>>> + *
>>>> + * 27:24 h     log2(horizontal) of pixels, in GOTs.
>>>> + *
>>>> + * 31:28 v     log2(vertical) of pixels, in GOTs.
>>>> + *
>>>> + * 35:32 -     Reserved for future use.  Must be zero.
>>>> + *
>>>> + * 36:36 c     Compression flag.
>>>> + *
>>>> + * 55:37 -     Reserved for future use.  Must be zero.
>>>> + *
>>>> + */
>>>> +
>>>> +#define DRM_FORMAT_MOD_SYNA_V4_TILED         fourcc_mod_code(SYNAPTIC=
S, 1)
>>>> +
>>>> +#define DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(f, m, p, g, h, v, c) \
>>>> +     fourcc_mod_code(SYNAPTICS, ((__u64)((f) & 0xff) | \
>>>> +                              ((__u64)((m) & 0xff) << 8) | \
>>>> +                              ((__u64)((p) & 0xf) << 16) | \
>>>> +                              ((__u64)((g) & 0x1) << 20) | \
>>>> +                              ((__u64)((h) & 0xf) << 24) | \
>>>> +                              ((__u64)((v) & 0xf) << 28) | \
>>>> +                              ((__u64)((c) & 0x1) << 36)))
>>>> +
>>>> +#define DRM_FORMAT_MOD_SYNA_V4H1 \
>>>> +     DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 0, 0, 0, 0)
>>>> +
>>>> +#define DRM_FORMAT_MOD_SYNA_V4H3P8 \
>>>> +     DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 0, 0, 0, 0)
>>>> +
>>>> +#define DRM_FORMAT_MOD_SYNA_V4H1_64L4_COMPRESSED \
>>>> +     DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 6, 2, 1)
>>>> +
>>>> +#define DRM_FORMAT_MOD_SYNA_V4H3P8_64L4_COMPRESSED \
>>>> +     DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 6, 2, 1)
>>>> +
>>>> +#define DRM_FORMAT_MOD_SYNA_V4H1_128L128_COMPRESSED \
>>>> +     DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 7, 7, 1)
>>>> +
>>>> +#define DRM_FORMAT_MOD_SYNA_V4H3P8_128L128_COMPRESSED \
>>>> +     DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 7, 7, 1)
>>>> +
>>>> #if defined(__cplusplus)
>>>> }
>>>> #endif
>>>> --
>>>> 2.37.3
>>> --
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__blog.ffwll.ch&d=
=3DDwIBAg&c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=3DP4xb2_7biqBxD=
4LGGPrSV6j-jf3C3xlR7PXU-mLTeZE&m=3Dd1mgHWc-ItDXK9dSnz0WGYs9xoXTTk9LqbifMtn2=
LOxmaHHsc4ieCoE78BFkHI1i&s=3D8ptqPzTUwb3X3fBSyQA6nVAA6DchubUUsMRgmLIp1lY&e=
=3D
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__blog.ffwll.ch&d=3DD=
wIDaQ&c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=3DreqwguHMk9_Krd2xy=
ybLKUi7qRQg3FIHG-6xLimUZv8&m=3DtmN4FcUbfHQ74lDlCJfhwkr5WqNNCY6CzNFzTM6X_i1H=
Sp9Nt2WlyXv-Wu-yNI9y&s=3DyEyPRethHiPbmj0QHoJMsmb1Pj2IN7B0J8_vlBvy0wk&e=3D
