Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F0063EACF
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 09:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0EFE10E559;
	Thu,  1 Dec 2022 08:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA8A10E0FD
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 16:49:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBLmQKz7TH0eeYv/cr9firVFx7lwVUd088DsntW0bj25CaqNGqGmX/0c/3zPRr+mQw2fdBVQIeaaIYHbpuu+zX7YEU+Uv5rQs4U7wUz/vCUsl5Y8GGlZAJro9w4+eWSystTY0N+RD6U/cEQTdyuCPrbpr/4l1LkMpat/45CEC9+MM5ZQEl1mu8TNB8lSMx9qUuLmLplIc/ksyi4I/eMKY1kKZzo964EkFjYjtet0gof69oVTpOsMy2qNrw01IPGJ7pn5MfgFa6l9BnHvvHjf2I/+DEA0jQxezT2ctUBZ/Ex4mlrhLD4EzxSeJ5r689ixsONQgQvhi+LYy655Tbb15w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3rIJH+VISFKpKVgwu04SYI1Z9pp9VKzC1h5GCjd6SM=;
 b=iMkAinOFo8Ff2T2r+N+zhnpYAmAMJVDrPqa7mNc2NlwbOjbE7+3CnqVKfOPseMTauEwOkPk6ElhzHTw52lwT35IfUDDN+4ICOvaRtKLMvd8imnX3k3Y7GAR2jof4Rqay8w1QD+YCciyTIKM4K53oMcRhFsA++LXzXkgqEjcM53XULd/xsJWvzOlxyU9LQV4xgWh7b6xXyrdnaK5APm7qEjzPYwgIoJ3b1+5dCDk0j+9kfzKeFx/pGVMqkBJ9UheGhaIiYJuWNHUsx9b2ZxxWbvmwGp47xu0bsrmvKb06KVGbuNDWljKPtR10xKRgcqkCYc1fd88twWd6zZWr1SJt2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3rIJH+VISFKpKVgwu04SYI1Z9pp9VKzC1h5GCjd6SM=;
 b=SJ1mcmYmfoUvFfBzaCdbA48GBLtX3ROZGDFXIg6T8KUD8vgDUQc/6nTj0UrnoXwzuu4Gr3dwQkddKXWa5l7f0zVqAu2qF97xVJaEC3vJwiJOMsnZ0Dadj+LrdCA+5qsi9i5ZzZD+wplS2acoz+3uQiAD+RDoNb3FbauGeK3Wm90=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 16:49:23 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::a132:66d9:ed0f:e5c1%5]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 16:49:23 +0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Randy Li <ranl@synaptics.com>
Subject: Re: [PATCH v5 1/2] drm/fourcc: Add Synaptics VideoSmart tiled
 modifiers
Date: Thu, 1 Dec 2022 00:49:16 +0800
Message-Id: <0D62976C-77E2-4748-AA90-C50D5E2CA48C@synaptics.com>
References: <Y4c+5f3qZd6Epd1C@phenom.ffwll.local>
In-Reply-To: <Y4c+5f3qZd6Epd1C@phenom.ffwll.local>
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailer: iPad Mail (18D61)
X-ClientProxiedBy: BYAPR11CA0077.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::18) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|SJ0PR03MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: 69a61328-e22b-4c3c-18e5-08dad2f2d56d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4V33pVodBJPerAZtVpWnKdRhIGTPkWp3q+5LRjnWXUKXsZYekjkjtc4wmhd63XJfA3h4NbQu7YvQIIrYw82TKpdBbtObVUPHd6cQIVV5EmNWPvHgaZSusZaelJri5xnn2/4FAa8z3QgCvBkDon84EIEcBvMKnGADhxqivJUxbYbrbcLzVJM4OaixnLQBlpbewzxx5S1cljIawX3OC12Icm3sXb93gJlMaueZnH/krH73AzyzappVIA/is1jqNlM1XsiN7U9n5NhatDk5eqZlP89kwDcVL8dE7mPclzksVXECPja55Y9dLsr7jH+5kxlP03F6yEzUK1ffr3feoGHgjwyVtMrtbYzUJFjDNWU8UpA3noAPLIvg/8vc5lTkmfu3GOiauHGHCFCvMsqBQb3/PtILGgHm5E1OfSzsTOCTWo31wdRWOTvMeJnLHiutjPk7nFGqSM2jF6l54sk1DaQRKN22HUpyL8CesAKW/V6/jMDPZJ9BzXolIUptLAuqJPHmerrAGqB6CwTD4ucawyAljkcXB7lF42UFmH0vbKseWivDD42oSzgWQ3YPHdsx1YlW0wTDNNQCGxcEXt6z/uPTWrHTF3JX8iRvnvzfIceo38Lw3WQVIBly5kfW+LDSPrJYjx1aekFp0wQrLFf7cdrTrCYwheloNZGyY5jfYgDgdHZO1aDZPK5kahPzvsr/ccFzluJkJ8w8JS0SLQTFaGPbv+p7WwuqXhqw4gjLc+7yiMBeQrQtV1JRei3lzUnIfbbp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(39860400002)(396003)(376002)(136003)(451199015)(4326008)(8676002)(41300700001)(5660300002)(7416002)(8936002)(66946007)(2906002)(66556008)(66476007)(6486002)(966005)(6506007)(26005)(6666004)(6512007)(478600001)(2616005)(186003)(52116002)(53546011)(36756003)(316002)(6916009)(33656002)(38100700002)(38350700002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEtwcmQzTnRBQXRsdnB4RGNOcW0rNERuNnlvdXNzLzlzWldKbUh1WlVZeUY1?=
 =?utf-8?B?WDV2UGdnQ1VUdUJQYjlSVTZWaGRrdzNoQklMRFRMZmIxQmx3dDFxaWlWTVZy?=
 =?utf-8?B?eTVVSHlJWXc3RUJOU1BDWTFOak5JWG9YOHJPMEVPZGpXZXBGZm5jTktnRWlD?=
 =?utf-8?B?N3g3cnhEK2pZbVZvM1VPa2k3cVZJcEVROFc2bHVYY3I1dUt2YnJzR1VnOVUr?=
 =?utf-8?B?QmtlcGRvSjRoTG16RlIwd3dOS2dmblpCVlExRGtFSUpTQ2xuM3VIYnlJeGNj?=
 =?utf-8?B?bkhkQmVHRlVoYWV1VEVnOGJHSEg1OXpvYzlhSHozRVNQRzlNK0ZjNzBkMUND?=
 =?utf-8?B?d2Y0bCtUNUh5QWZuVG5PQnhKUTdMVmxCK3liRlVDTkIrWDZqRWlmVk82VWxP?=
 =?utf-8?B?ZTFSVyt3MmgzOGVLN1pMQUsrcWlkQUlyeHZJTU1lc2wxalh0N3JJOUYyUFZY?=
 =?utf-8?B?OFVVWnl3ZjdDM3V6YlpjNExkUU40aldKSHhJWGkxemhzSnhQeSs3WDJPVnY1?=
 =?utf-8?B?bEwvTTBxYWdlWFE4Z0xrTjd5SEFtajNkRFBHNHJBeHl5QU1pZ3VOZzFlY1Ir?=
 =?utf-8?B?ZklHT2krT0JRSmZnYXNaL0JjcFVHZU1VTTh5eGJNWHp3WTAzaFNzamZCT3lC?=
 =?utf-8?B?YWFHclBrdzUzWlY4T1YyQzRNck9vb3ZkYlYrWXg0NEZsVGlkbzMrNk5yaW10?=
 =?utf-8?B?S0NqVy9ZeWJGUVZJS01PbHJsT1hZanJxLzA4dUNpUllRNkt6bU1YV0tjcFZT?=
 =?utf-8?B?RFJldTZJSkFnM0hOZnlQYUdvanM3RU9rcWVCdE1HNDJ1UGhjOWRqY1hheXZR?=
 =?utf-8?B?MmJ6TDYrMGtlYStKTzluaGlIdXdwSmZ0MU14RTk1R29ZVTlHbzVBR1lJNDVM?=
 =?utf-8?B?TFJ6M0xYMzhsTGVjWUVVTE1MYmFpbXcxbG93R0lKUFFXbzd0OFR1WmJCVnRX?=
 =?utf-8?B?SEtrd1JaTmZOT1JZaDNRK2Rvc3FhOXlmRE13OXcydFFrc2h0Qm04YUJhRTQ4?=
 =?utf-8?B?emVKVUc0THlsYlFrdUpyeThOVHAvWTUrNjN6eEp3MFZqeUIzRWMvZEJ1anlq?=
 =?utf-8?B?WjBmVXdISm1tckZlS0NmeEtjSVNyNHFSWnBYTVQyaEFxUmV3TU1HeHIwc1dB?=
 =?utf-8?B?UUdjd0RyUTBzMDNBUWVrVXdjQzhxdG1RZm81TCtONURIZlMrUzVhZHFqYy9R?=
 =?utf-8?B?Z0Y3MXg1S0pNNkJPeGhzT0VLWUQrSUlwS2YyeE9iZ1JZZUJxZHNlQWllcGJD?=
 =?utf-8?B?T0I2bTFkcDAyOERBM0JJUkdzSjdzbFpSeTg4TWFMeStiejJrTEJUdWl0V0VV?=
 =?utf-8?B?Tjg1STRPeVpwRUxCSmNsV2M1c2JwT2UweWtmQnFna2Z2cFJsbXBTRnQxMURr?=
 =?utf-8?B?TEQvTFRHY0U0WHkwbXpjTFgyV3VwWWFwZFNnWjU1Y01EVDIwY1A5ZmVPTzdC?=
 =?utf-8?B?bGZhT0ZKMXRiV21zNEFzVlZIUThzNjZRaWNvS2lVN2JtTmJHQ1gzS1RPWnow?=
 =?utf-8?B?eUZraldIKyt4T3N3TzlheGdkNEw3S3hwaTN4Y0FoNjhiL1BuVCtzZlRRNEZz?=
 =?utf-8?B?alRrOWhOWXRxOUZZYXIzVUxKOTdBSVJNeXBsZ21WQUNkcFJheURDZkRyUlpJ?=
 =?utf-8?B?R0pVblJKMG1WOGdNUWlSUERMSzg5MzIvQzYyYWNNY2wyNWhOUTFkdWlZZ1Aw?=
 =?utf-8?B?TXB4UFFTemc4OE1vMG5FQzNvUGN2Z3p1dTB3OHFaSUhUbVU5THIrZFJ2cElF?=
 =?utf-8?B?dWtlY2gxeFpiRStzeHlZR0RTbGsweGNwWkNQUHgyb2dzYkFRbDVQbzVGbk5y?=
 =?utf-8?B?NnZQMTd1QlNNNnhaTk0rSCtqNnRXMW9tVlk2eXBYQVpmWmlXK3FYWmh6OHVJ?=
 =?utf-8?B?ZFBWUWpjVG9aTTBDb3V5RFhmK0tFemtuekNxcVZYUVIrcGdmblR5a21VMVV1?=
 =?utf-8?B?R0MxQmxaTjdrakdSV1ovVEdlTTJ2akRFREpVMUFUbjYxYkZRMHlwcXFoeWx4?=
 =?utf-8?B?QllYOTRsTDZFYnVhSG91cEZrMXhZaDJMaWJjTzhneDBYbG1VMUhsazFXbzdQ?=
 =?utf-8?B?R1hZcjIwMW41M0hvS2s2TWhCbkNhQXRhK3dnT0hDY240RDZxZkIyeWlvbTYr?=
 =?utf-8?Q?nPNOB2AX6oNUjotoNDzYhcmI6?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a61328-e22b-4c3c-18e5-08dad2f2d56d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 16:49:23.2693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Emkj7PGFsa3Lts83BADhtXjbVd+qqg+aIkBQ0CJ3LmvGkMA/M1vikyGohh+WXYm+F8zLddDw6rlBsphADY2jiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6343
X-Mailman-Approved-At: Thu, 01 Dec 2022 08:06:25 +0000
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

> On Nov 30, 2022, at 7:30 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
>=20
> =EF=BB=BFCAUTION: Email originated externally, do not click links or open=
 attachments unless you recognize the sender and know the content is safe.
>=20
>=20
>> On Wed, Nov 30, 2022 at 05:21:48PM +0800, Hsia-Jun Li wrote:
>> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
>>=20
>> Those modifiers only record the parameters would effort pixel
>> layout or memory layout. Whether physical memory page mapping
>> is used is not a part of format.
>>=20
>> Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
>> ---
>> include/uapi/drm/drm_fourcc.h | 76 +++++++++++++++++++++++++++++++++++
>> 1 file changed, 76 insertions(+)
>>=20
>> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc=
.h
>> index bc056f2d537d..e0905f573f43 100644
>> --- a/include/uapi/drm/drm_fourcc.h
>> +++ b/include/uapi/drm/drm_fourcc.h
>> @@ -407,6 +407,7 @@ extern "C" {
>> #define DRM_FORMAT_MOD_VENDOR_ARM     0x08
>> #define DRM_FORMAT_MOD_VENDOR_ALLWINNER 0x09
>> #define DRM_FORMAT_MOD_VENDOR_AMLOGIC 0x0a
>> +#define DRM_FORMAT_MOD_VENDOR_SYNAPTICS 0x0b
>>=20
>> /* add more to the end as needed */
>>=20
>> @@ -1507,6 +1508,81 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 m=
odifier)
>> #define AMD_FMT_MOD_CLEAR(field) \
>>      (~((__u64)AMD_FMT_MOD_##field##_MASK << AMD_FMT_MOD_##field##_SHIFT=
))
>>=20
>> +/*
>> + * Synaptics VideoSmart modifiers
>> + *
>> + * Tiles could be arranged in Groups of Tiles (GOTs), it is a small til=
e
>> + * within a tile. GOT size and layout varies based on platform and
>> + * performance concern.
>> + *
>> + * Besides, an 8 length 4 bytes arrary (32 bytes) would be need to stor=
e
>> + * some compression parameters for a compression metadata plane.
>> + *
>> + * Further information can be found in
>> + * Documentation/gpu/synaptics.rst
>> + *
>> + *       Macro
>> + * Bits  Param Description
>> + * ----  ----- --------------------------------------------------------=
---------
>> + *
>> + *  7:0  f     Scan direction description.
>> + *
>> + *               0 =3D Invalid
>> + *               1 =3D V4, the scan would always start from vertical fo=
r 4 pixel
>> + *                   then move back to the start pixel of the next hori=
zontal
>> + *                   direction.
>> + *               2 =3D Reserved for future use.
>> + *
>> + * 15:8  m     The times of pattern repeat in the right angle direction=
 from
>> + *             the first scan direction.
>> + *
>> + * 19:16 p     The padding bits after the whole scan, could be zero.
>> + *
>> + * 20:20 g     GOT packing flag.
>> + *
>> + * 23:21 -     Reserved for future use.  Must be zero.
>=20
> Can you pls fold all the future use reservations into the top end?
You see we could put more related flag in each of reserved area.
Here is for the group of tiles flag.
Bit 35 to 32 could be used for describing the dimension of the group of til=
es.
> Also I
> think it'd be good to at least reserve maybe the top 8 bits or so for a
> synaptics specific format indicator, so that it's easier to extend this i=
n
> the future ...
I think the  bit 56 to 63 are used for storing the vendor id. That is why I=
 didn=E2=80=99t include them below. Or you mean the bit 7 to 0?
Do yo
> -Daniel
>=20
>=20
>> + *
>> + * 27:24 h     log2(horizontal) of pixels, in GOTs.
>> + *
>> + * 31:28 v     log2(vertical) of pixels, in GOTs.
>> + *
>> + * 35:32 -     Reserved for future use.  Must be zero.
>> + *
>> + * 36:36 c     Compression flag.
>> + *
>> + * 55:37 -     Reserved for future use.  Must be zero.
>> + *
>> + */
>> +
>> +#define DRM_FORMAT_MOD_SYNA_V4_TILED         fourcc_mod_code(SYNAPTICS,=
 1)
>> +
>> +#define DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(f, m, p, g, h, v, c) \
>> +     fourcc_mod_code(SYNAPTICS, ((__u64)((f) & 0xff) | \
>> +                              ((__u64)((m) & 0xff) << 8) | \
>> +                              ((__u64)((p) & 0xf) << 16) | \
>> +                              ((__u64)((g) & 0x1) << 20) | \
>> +                              ((__u64)((h) & 0xf) << 24) | \
>> +                              ((__u64)((v) & 0xf) << 28) | \
>> +                              ((__u64)((c) & 0x1) << 36)))
>> +
>> +#define DRM_FORMAT_MOD_SYNA_V4H1 \
>> +     DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 0, 0, 0, 0)
>> +
>> +#define DRM_FORMAT_MOD_SYNA_V4H3P8 \
>> +     DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 0, 0, 0, 0)
>> +
>> +#define DRM_FORMAT_MOD_SYNA_V4H1_64L4_COMPRESSED \
>> +     DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 6, 2, 1)
>> +
>> +#define DRM_FORMAT_MOD_SYNA_V4H3P8_64L4_COMPRESSED \
>> +     DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 6, 2, 1)
>> +
>> +#define DRM_FORMAT_MOD_SYNA_V4H1_128L128_COMPRESSED \
>> +     DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 1, 0, 1, 7, 7, 1)
>> +
>> +#define DRM_FORMAT_MOD_SYNA_V4H3P8_128L128_COMPRESSED \
>> +     DRM_FORMAT_MOD_SYNA_MTR_LINEAR_2D(1, 3, 8, 1, 7, 7, 1)
>> +
>> #if defined(__cplusplus)
>> }
>> #endif
>> --
>> 2.37.3
>>=20
>=20
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__blog.ffwll.ch&d=3DD=
wIBAg&c=3D7dfBJ8cXbWjhc0BhImu8wVIoUFmBzj1s88r8EGyM0UY&r=3DP4xb2_7biqBxD4LGG=
PrSV6j-jf3C3xlR7PXU-mLTeZE&m=3Dd1mgHWc-ItDXK9dSnz0WGYs9xoXTTk9LqbifMtn2LOxm=
aHHsc4ieCoE78BFkHI1i&s=3D8ptqPzTUwb3X3fBSyQA6nVAA6DchubUUsMRgmLIp1lY&e=3D
