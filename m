Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD0C6373EA
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 09:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED15910E6A3;
	Thu, 24 Nov 2022 08:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E7E88C11
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 17:14:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSaT4e9Ptiju8Yn6xmsbO55ZgAPNW88UbZmhan+wUd0tvW2ccr1kxaw+D7hp65DYn5MCCUPmTXcwv9T3QVQq9zGLgWHn7kOSb/PjzmcqBCW7XDxrOTJjfvrmMgrCbIOjbWAFWroe+a13WgYH+5bTbkpeEXG9Khz+iNdHw4LxesF8oSDrgVwTGI1ttWyJcImOrWfUynUbWBtWr9B6dsNHWUmP55CbRJsQkWabHyT5y2ULiSbFzDLHO0IPYs7sVhENQBlvIU42CEngrRBnwFXjUMbfzHl43Z51UmDk6on+iUbakgPNJfSCkL6679Ysy+fTHaMj21ApoNC3JMrmGQlTMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPX+vr9Oo95Uo8g8NFJOi+cXzvX3hcTk6UP8nd7nzGw=;
 b=eRno22ovKZ4cRWYfsyewY/aJI7BnX1DixgPN7Ki+oegKHwYGHunZKAqTcjDjly8tcRUWWaMkHEd1Fi0uSblWlmh7DDlTmBhJZCNvp+0vHLZOskKh15h1dojYSF6G+zdIlkyNj04E2gRAbRNpz6lODNu1/ArqP/66tjY4gQCKvOI0aKhjnrfApZ441zEjBvZwKnU8gxuC6T/R/yIQU9BYgZ1Ph0b1CEIfbVsp9KhdYRWzW7C9yGZyIYGH+omV7DvkCqgiJmbK4Xgy/szlf3RWAKqldFlKxW18/WsXWXJOBUgJpEj1Epob1bWJM1A3lYKbQd+el4/JZ9LJumVIU1ivug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPX+vr9Oo95Uo8g8NFJOi+cXzvX3hcTk6UP8nd7nzGw=;
 b=i1NmyqVQjDjOrGUYHgbV4q/jlyAMHcrU66sFsstNEx3Y4GPROJVa3opUAR/QiWLkMy7DJTLY5MHzfSaOkJyY4r/pNiVt3xf5ylZjTcitk9U7L233R29+pfW0k3LNuS9cNI5y8CfcMeC9bH5C7HjsBvb69qR8AT0TnJMexVWtNHc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by BY5PR03MB4982.namprd03.prod.outlook.com (2603:10b6:a03:1f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 17:14:55 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1%6]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 17:14:54 +0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4] drm/fourcc: Add Synaptics VideoSmart tiled modifiers
From: Randy Li <ranl@synaptics.com>
In-Reply-To: <Y35Nbhd/fhESOFeU@phenom.ffwll.local>
Date: Thu, 24 Nov 2022 01:14:48 +0800
Message-Id: <48867317-C751-4339-ADA6-6AF88A7FB9AC@synaptics.com>
References: <Y35Nbhd/fhESOFeU@phenom.ffwll.local>
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailer: iPad Mail (18D61)
X-ClientProxiedBy: BYAPR01CA0043.prod.exchangelabs.com (2603:10b6:a03:94::20)
 To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|BY5PR03MB4982:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b4c0c71-a94f-460b-2554-08dacd763d7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xF4Hf9jYHXzL0eQo6SNqNyrO7KWcYBc1ltOWE+C7BvXTAgc/QtufD2FRzds8Z82hTkPNjn8jQh63MAVYQZkppsgj0J/Fi5ZFbNXy44cqLV4UvoDngBx6G4On0MfF3Ewoy7KgP+KogckAchN6dS/Droiq/12q69TjntHE+rzDfQjHtyGhzuLRhb7Yt5zrIj933vpYzHJDg4Oa3+d4ta1V3dP3eMkTLS8yegMqb5KMFida+laradwrn92P39Rc5attRgTlgyMzrYqt2HasBWOFKd9TPMUny9PRa4Lygrsbvntik8waHUkshaundfJoQ/nQXyWoUVN2Vtb1rmAo4k2b0Ajx1ZUK0ZVUbTXZ4Ys7ttOYffM7QIjkfy9cslbvnSZMZfHzr0sKkRa4MJ3ektSYofxzheUxSs+EDHHoZbTD/3FND/rZr0P7TB1G8rUem+RYc1aC0m6bufNeZWweBbXX844g+1cRG0pHg+BIm3p+mqZNYKMvdH4OMt7FzzyCABDP8SEySmNzkMDiZi0XsB4Z1ZkGnnhh4dRd2td/Cf+vnzU8VYDp0k+9R9r4/xO6ykjOBinlRkuBTp5FSFJfx1u+rzz3qqsiG5PpPSdTmFYCtrb3IKLGap8jkVH5iZAHbg9cD5vhghIYYX3+6ENuvfclsQffB0SWF/jS/z/aMIcUYdbRJCXkCSCl1+PeRzYm57aD/5i174xHGS71M+gXYMoymlyEEE8pT7el3kjoVh6Ava2NMskFepj047Oqik0lQqgp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(346002)(366004)(39850400004)(396003)(451199015)(36756003)(83380400001)(38350700002)(7416002)(5660300002)(2906002)(38100700002)(33656002)(316002)(2616005)(6916009)(54906003)(6486002)(6666004)(186003)(966005)(478600001)(8676002)(66556008)(66476007)(41300700001)(4326008)(8936002)(26005)(52116002)(66946007)(53546011)(6512007)(6506007)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnQxOEhCU0NCaSsvRWJzbFlSdTFMZ2xkTDNpRktDRW5FUVRRN0s3SnRqRVF5?=
 =?utf-8?B?T2VJTktUVEhPVk5qQU50cHJiUElYS1Fsb3QvU1l1ZnJHV3ZscmswR24xbDVa?=
 =?utf-8?B?Sm1OeStRYlFuNEtneHV4UmlrY2VnMU1ESFpaREtiQXhCWExtVUVheW94TXlC?=
 =?utf-8?B?OU1MWEQ3c2Z5SUh3VnhpVUJyT2Qva0R6U1djbk13YzBJNXZCTW5FdGVpdjFr?=
 =?utf-8?B?dDk4d2pRVXFNRGtxNzhHMkkwMlBpcXVsTFlEcmVsdmpFVTlIZTN0VXkzRC9U?=
 =?utf-8?B?MjJvTWVzbHR3N3p1a2R5VUQ3OE8xTHZiVE1YVjVQSHFFQ1VWSk1JSjBvTUVN?=
 =?utf-8?B?SEVTZllKUVcxKzZmYTBuckg2WGNRR2dab0NtNzBicEhETHpvY3pjSGRZSStx?=
 =?utf-8?B?N3RZZXZPUVNadTNISFIvNUdaVkJZWGcxV1o2Ulgzejg1ajBQV3J1cVpkNVFD?=
 =?utf-8?B?SnJNcmUrVHZibGVIODExaFZ2blBkUitsd01Bdkx4UUhmbnNLV1RDN254MEQz?=
 =?utf-8?B?U21MU3VXc0RzeHdwV0taZEpuTkRyMk1ucjRnV0xVSG5tNE81amVXeXoyWEZm?=
 =?utf-8?B?SExUdzBpZkVTMllPbTVVNCt0UURSNkMxTTNoeW14OUtLN3l3L2NNVXlSY0J4?=
 =?utf-8?B?a29PZ1hpMDhYVzVhZnlHNUpZRDU2ejI5QXViSmtwUlhMUVh1N2FYTFRlQ2dS?=
 =?utf-8?B?RlpSSTFCVHkwNU5scXpKczdld0YxaWxnMnJqQjNtMDRMUnZ6L2xTTXhlTGZX?=
 =?utf-8?B?SUM4ZUlNT2VkZmhjRStOOVBhNUNnN1l5WjlLV1BTYmRZb2pNaGlzeHFmWXc5?=
 =?utf-8?B?aGYxcmxYc3FjUDhDNTNaQ2Q1Z3NDTjl2TUkwSUE5TjV5N01rWXdtN2hZd2lk?=
 =?utf-8?B?UllpMXQ4TUMxTklHTHlZM1NKVmtNRDRlTDJCaHFERzU0aDFUOVNYMk9nYk5h?=
 =?utf-8?B?eXo0aGNrajUxRURWU0R4Y3ZTV2hwVVRWRDFRait4bTZXWXpUSWl0WnpmVm1E?=
 =?utf-8?B?YzFJU3dYRSt3QmhVRHd2Y1UzTmVDSzZxU0ZQbllrKzJicDVrVUJsNCtSaXNw?=
 =?utf-8?B?V0UvaFNxOTdZMjgyNEMyRFRpTmFnVFVWRlpRY3hRUUlrdUlVc2t3ODU1SW5Q?=
 =?utf-8?B?eVNZOU10QkdISWhiemEwTUMrckJzeC9paGxnaXk5R2ZxWmpZMnpNdWVoQVZr?=
 =?utf-8?B?MXltZHQ4em9VSlZIRnM1dGJDcnJtQ2w0NUVabGduWVNEYldOQ2VjeWJaSkxN?=
 =?utf-8?B?ZGtmdm40VEFXT29lY1FNd3h6K1pxNm1vWnJFUjFHa0xxK3BtYXRoNXc2VGIv?=
 =?utf-8?B?UmRsNDJ6NlUyMmxyeld4c2sxZG1WOHhtblh5d2p4NGh3enVTbklHS0hZR1dz?=
 =?utf-8?B?ZGcySEJBZ3FoMmVjUlRIQ2NYTldFcGVhb1l4Vk13YmNLVERzVDdhS1lSeGp2?=
 =?utf-8?B?c2ZhMmJvbWlVVVFHbGhNQXBSZ3JCQ2hOOFRmcU5QSG0wbFdxa2JCY1V6S0g2?=
 =?utf-8?B?NFJRNjR4YjlySFJoZWwyVDhYQUcvVGtVTDE4dElETTM4eFQ1dEg4Z1ZjNTVM?=
 =?utf-8?B?a3F0TVFNWjQ2UGZJYmVldk1NSVFhU1pibENKKzFTZ1JlUXZ3NW8rMzEwek9M?=
 =?utf-8?B?bDNOQVdOV09ZVlZLNWJEL2tqcFlyUUIwa1VKQVp0b0YvdHhoSSswWDBvVnc5?=
 =?utf-8?B?bmpkV3luVWV1UmpoNG5qZXBTWkgxYjM5bWt2U2FWb1VmbWpoZjNBV3lSWEpH?=
 =?utf-8?B?MXdBUHZ5ZUFhS1lnQUNOYXZSNUpaRzF0azFublZUV1JDRjFxNEtuUUVQcXVa?=
 =?utf-8?B?OGxCUWRnMFJROXlwOGpRdEpyWGoyMzVvYkRCZGF0MlRPeUdjZTUxTEM2M0kr?=
 =?utf-8?B?bTdXVlZ2c1ZvSGlLY3VLTmlXQzVlU1N2YnRCM1NnMU9KVUw1bkVIK2s0STJ2?=
 =?utf-8?B?Qm5rTGVIWmhkNU5wU0oyTjJ3Zzc4UHRtaHJzT0tKMFVuYjNrUFJrNXdEdGNX?=
 =?utf-8?B?NHpsb2JLbTcyWTZnUXZQV1Y5d3YxREFGTGZTYlN0UUc2T2pGQ0I2TGZHOGlW?=
 =?utf-8?B?T3BEc1dBVUs3S3hXZG5MZEhZdHNpWVV2Q0RQQW14SW44WjNPUEwyU0V1aVc4?=
 =?utf-8?Q?3wFHrUfR1aY1+sAmketV1aqsh?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b4c0c71-a94f-460b-2554-08dacd763d7a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 17:14:54.9002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U3YyzF+ofKoL5VKpREkZXZ+3MGWl/xBSnEQnM9/AGDX2BOHFmN5gZdgUA6BfOsuJYJfWhj6E1+9w8Wq7iUFusw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4982
X-Mailman-Approved-At: Thu, 24 Nov 2022 08:30:00 +0000
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
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com, airlied@linux.ie,
 tzimmermann@suse.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca,
 Hsia-Jun Li <randy.li@synaptics.com>, helen.koike@collabora.com,
 ezequiel@vanguardiasur.com.ar, Jisheng Zhang <jszhang@kernel.org>,
 ribalda@chromium.org, sebastian.hesselbarth@gmail.com, tfiga@chromium.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> On Nov 24, 2022, at 12:42 AM, Daniel Vetter <daniel@ffwll.ch> wrote:
>=20
> =EF=BB=BFOn Wed, Nov 23, 2022 at 10:58:11PM +0800, Jisheng Zhang wrote:
>>> On Wed, Nov 23, 2022 at 05:19:57PM +0800, Hsia-Jun Li wrote:
>>> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
>>> Memory Traffic Reduction(MTR) is a module in Synaptics
>>> VideoSmart platform could process lossless compression image
>>> and cache the tile memory line.
>>> Those modifiers only record the parameters would effort pixel
>>> layout or memory layout. Whether physical memory page mapping
>>> is used is not a part of format.
>>> We would allocate the same size of memory for uncompressed
>>> and compressed luma and chroma data, while the compressed buffer
>>> would request two extra planes holding the metadata for
>>> the decompression.
>>> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
>>> ---
>>> include/uapi/drm/drm_fourcc.h | 75 +++++++++++++++++++++++++++++++++++
>>> 1 file changed, 75 insertions(+)
>>> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourc=
c.h
>>> index bc056f2d537d..ca0b4ca70b36 100644
>>> --- a/include/uapi/drm/drm_fourcc.h
>>> +++ b/include/uapi/drm/drm_fourcc.h
>>> @@ -407,6 +407,7 @@ extern "C" {
>>> #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>>> #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
>>> #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
>>> +#define DRM_FORMAT_MOD_VENDOR_SYNAPTICS 0x0b
>> Any users in the mainline tree?
Not yet. I believe a V4L2 codec would be the first one.
Still there are many patches are requested for v4l2 which currently does no=
t support format modifier. You could find discussion in linux media list.

This does need the agreement from drm maintainers, three of us tend to drop=
 the pixel formats in video4linux2.h only keeping those codec formats in ne=
w extended v4l2 format negotiation interface. All the pixel formats should =
go to drm_fourcc.h while we can=E2=80=99t decide how to present those hardw=
are requests contiguous memory.

We don=E2=80=99t bring those NV12M into drm_fourcc.h, we hate that.
> Note that drm_fourcc.h serves as the vendor-neutral registry for these
> numbers, and they're referenced in both gl and vk extensions. So this is
> the one case where we do _not_ require in-kernel users or open source
> userspace.
>=20
The first user for these pixel formats would be the software pixel reader f=
or Gstreamer, I am planning to add the unpacker for the two uncompressed pi=
xel formats.
> If there is someone interested in an in-kernel or open userspace driver
> though it would be really great to have their acks before merging. Just t=
o
> make sure that the modifiers will work with both upstream and downstream
> driver stacks.
This patch have been reviewed internally, it is good enough to describe our=
 pixel formats.
>=20
> I just realized that we've failed to document this, I'll type up a patch.

About the format itself, I have sent the document to the mesa, you could fi=
nd a MR there.
> -Daniel
>=20
>=20
>>> /* add more to the end as needed */
>>> @@ -1507,6 +1508,80 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 =
modifier)
>>> #define AMD_FMT_MOD_CLEAR(field) \
>>>   (~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT))
>>> +/*
>>> + * Synaptics VideoSmart modifiers
>>> + *
>>> + * Tiles could be arranged in Groups of Tiles (GOTs), it is a small ti=
le
>>> + * within a tile. GOT size and layout varies based on platform and
>>> + * performance concern. When the compression is applied, it is possibl=
e
>>> + * that we would have two tile type in the GOT, these parameters can't
>>> + * tell the secondary tile type.
>>> + *
>>> + * Besides, an 8 size 4 bytes arrary (32 bytes) would be need to store
>>> + * some compression parameters for a compression meta data plane.
>>> + *
>>> + *       Macro
>>> + * Bits  Param Description
>>> + * ----  ----- -------------------------------------------------------=
----------
>>> + *
>>> + *  7:0  f     Scan direction description.
>>> + *
>>> + *               0 =3D Invalid
>>> + *               1 =3D V4, the scan would always start from vertical f=
or 4 pixel
>>> + *                   then move back to the start pixel of the next hor=
izontal
>>> + *                   direction.
>>> + *               2 =3D Reserved for future use.
>>> + *
>>> + * 15:8  m     The times of pattern repeat in the right angle directio=
n from
>>> + *             the first scan direction.
>>> + *
>>> + * 19:16 p     The padding bits after the whole scan, could be zero.
>>> + *
>>> + * 20:20 g     GOT packing flag.
>>> + *
>>> + * 23:21 -     Reserved for future use.  Must be zero.
>>> + *
>>> + * 27:24 h     log2(horizontal) of bytes, in GOTs.
>>> + *
>>> + * 31:28 v     log2(vertical) of bytes, in GOTs.
>>> + *
>>> + * 35:32 -     Reserved for future use.  Must be zero.
>>> + *
>>> + * 36:36 c     Compression flag.
>>> + *
>>> + * 55:37 -     Reserved for future use.  Must be zero.
>>> + *
>>> + */
>>> +
>>> +#define DRM_FORMAT_MOD_SYNA_V4_TILED        fourcc_mod_code(SYNAPTICS,=
 1)
>>> +
>>> +#define DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(f, m, p, g, h, v, c) \
>>> +    fourcc_mod_code(SYNAPTICS, ((__u64)((f) & 0xff) | \
>>> +                 ((__u64)((m) & 0xff) << 8) | \
>>> +                 ((__u64)((p) & 0xf) << 16) | \
>>> +                 ((__u64)((g) & 0x1) << 20) | \
>>> +                 ((__u64)((h) & 0xf) << 24) | \
>>> +                 ((__u64)((v) & 0xf) << 28) | \
>>> +                 ((__u64)((c) & 0x1) << 36)))
>>> +
>>> +#define DRM_FORMAT_MOD_SYNA_V4H1 \
>>> +    DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 0, 0, 0, 0)
>>> +
>>> +#define DRM_FORMAT_MOD_SYNA_V4H3P8 \
>>> +    DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 0, 0, 0, 0)
>>> +
>>> +#define DRM_FORMAT_MOD_SYNA_V4H1_64L4_COMPRESSED \
>>> +    DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 6, 2, 1)
>>> +
>>> +#define DRM_FORMAT_MOD_SYNA_V4H3P8_64L4_COMPRESSED \
>>> +    DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 6, 2, 1)
>>> +
>>> +#define DRM_FORMAT_MOD_SYNA_V4H1_128L128_COMPRESSED \
>>> +    DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 7, 7, 1)
>>> +
>>> +#define DRM_FORMAT_MOD_SYNA_V4H3P8_128L128_COMPRESSED \
>>> +    DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 7, 7, 1)
>>> +
>>> #if defined(__cplusplus)
>>> }
>>> #endif
>>> --
>>> 2.17.1
>=20
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
