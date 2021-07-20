Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5DD3D09AA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 09:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041866E512;
	Wed, 21 Jul 2021 07:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50084.outbound.protection.outlook.com [40.107.5.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F4B6E461;
 Tue, 20 Jul 2021 16:12:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UiwmuGmUkVcVaCLReYwZ3R91JIHtFCunbnxWUaIYJc8ebJdigYNVETdXhlyfigDTNCaEXAy94NTbJLftK3YMKf6g+lq2eSgRw4lJ9gN9DzrvGpBP1DnTJ7Jj1tqWr+Z9P5SCU4RBx2ro1ghwxJoChFaKIIZtQ0ZVhsoYskXpBCoM54ii3TaGduUJ7ZzMxbWo0bcH91jdF2RElEag6XQZr3fiFOfJx73HmWlQrczOhl+T+5ksAyrqp+qPGDlWGsDBjDT2e2eBC8nHwGfiYTDgDJduyO8GYb1vEcdU6ey5TWXmlrB6wvyyGUZjcvUP5DWcqFNDgg50BjWr7qSSJNRk4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zs2k+2csVv//J1S4gpD3Zqjs6dZ+MKZuRPIULmBWiB8=;
 b=g5IyYNw13c9YX0HoCMJiI0AL5N61NixFsiFFuQGHwIeBNvm+KPe5nzHKMBhisujhCPNYWUHOTEKaJ2AT0z95CWRK4ySltONEzmvtbS2wI0OkF/OFlYFfoo+nMIRGRf1FOmjv5KsZ9ENL0zOE8PAhtJg90scQwbI5atXmHEscsr6K/43nvbEI1JyLuezGpCigl63cdvp882ciGZjeeWtZmro6jmo24ISC5ique3HmvND+FQkPsRrDi5b+kX9VJw+xjoHxe9/eLMKG2VLJGtxkT8wj+Tqc3AxSN/vtx5RyBgwqN8dcojeuit2e/ifBV6l+Fo+5VidCEf+KNNksr8j0JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zs2k+2csVv//J1S4gpD3Zqjs6dZ+MKZuRPIULmBWiB8=;
 b=dttlhHorwtPCZDT3USjaiXqM6aumB9GxNuttwcVvRmraHkKq6gdahGE1SdES2IHduegXHwNpvDvxmsQ3FM5T6/yRTrvfWvg29L30/jNcLrT8805aWsK7Wldb2v/6B01ZylVPcQo+B9hepYf43diDUGk/znN2Nh5P5pOqQH4xcyE=
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0402MB3503.eurprd04.prod.outlook.com (2603:10a6:803:d::26)
 by VI1PR0402MB3806.eurprd04.prod.outlook.com (2603:10a6:803:16::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.26; Tue, 20 Jul
 2021 16:12:45 +0000
Received: from VI1PR0402MB3503.eurprd04.prod.outlook.com
 ([fe80::c401:1dd0:8b6d:27a5]) by VI1PR0402MB3503.eurprd04.prod.outlook.com
 ([fe80::c401:1dd0:8b6d:27a5%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 16:12:45 +0000
Subject: Re: [PATCH 05/13] vfio/fsl: Move to the device set infrastructure
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
References: <5-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
From: Diana Craciun OSS <diana.craciun@oss.nxp.com>
Message-ID: <44639398-d50f-ac6a-d52b-4e964465ca6f@oss.nxp.com>
Date: Tue, 20 Jul 2021 19:12:26 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <5-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR03CA0065.eurprd03.prod.outlook.com
 (2603:10a6:207:5::23) To VI1PR0402MB3503.eurprd04.prod.outlook.com
 (2603:10a6:803:d::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.211] (86.126.4.153) by
 AM3PR03CA0065.eurprd03.prod.outlook.com (2603:10a6:207:5::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 16:12:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6711d70-ba0a-4f0c-43cc-08d94b9935c1
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3806:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB380641A729C01F7F3C8CFFC5BEE29@VI1PR0402MB3806.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kJMGAQStM39Nl1S7i2mreL+8b+5DX+1JvQdffDR30IOi/glBhoVyiawynPvCR+gskJBzRsKgeQaaIIDhfdBNL/ZXIpB2olEJQZqpNL5RyqzsXBk1iRIvj5LyOVaeJyhwTgPpCTfGCRVWLAb6x6OCvha2TG2YOVKIBxxdzg94nD4+ij8IWIT6j7IDZ5wdTar6cODn8v+fKEUCKZUA2s4lBQhuwHDSuiAmCl288hMiB90C0NO96I6Bh8XLmoIr0Os55PUHHqATkkRWMz5gIAqWacmkm1weEX+ltWwwMb39XcDVXNly9KfS0oF4uwTLKq2XTnaLgn42y10+JzX7+N2nR/XBoR9oRCruRUJoYmO5y8cUvud3eAv6ZB/uDmsybjWgA/wf4cI6+2ilPlEGKfGsMecUFtkWTSmt5PE8of9TN919E1IIYvpG6erMgZUUgCXrModJizmtarHIsPGN8ZlWFNbR5bixutumfkjJy+oCy1bt7tKv3snL7Z52WtXz8pO1GXgbtdGfdiN4l34yNanm+0CCew0ZD6EuqyKB11HUQzr7KdWbHKAmKHOYqhncczrymjyiF5y/0jBQfTrR5a+CEVsNiOBJHqb7BfQ8jwkO9y9k2ssfd/w40AxcJNhDWzFu4fzJDHqysizQZOPds7ah1hiFUpZax6+djen6+yO8Mvlyz3+UjFlJRokty9P2HuTEO9o5I0mvvoR0ZPwTgCgFJtt2fwsNjvJGWWqjspybpY7uxO8rG6hP+Im2xb/uUxChKIHoDS56opLzwD+D18wHytDHr7GHUag/NBP4Vu7L4xk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3503.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(136003)(346002)(39830400003)(53546011)(7416002)(38100700002)(38350700002)(86362001)(6666004)(4326008)(66476007)(7406005)(2616005)(30864003)(66946007)(508600001)(16576012)(26005)(31686004)(110136005)(6486002)(54906003)(52116002)(8676002)(31696002)(921005)(5660300002)(66556008)(2906002)(186003)(8936002)(83380400001)(956004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFR2M0lKU0hHd1VJdHhNNEJmVzNZRTRaVXRDT3BmYll2WjdJeTRPMzVQT0cy?=
 =?utf-8?B?eVRnV3NzMlJIampzS3kwalRvdnovZnA5dkVLcElHeTVIWUlTVEZ0UWFrd0Z1?=
 =?utf-8?B?YmRXMFk3MVRwWnY0cHJvNVROWXRFTzdjektKTVdETDVLVVhrSGg5UmpEY05a?=
 =?utf-8?B?OUp1VklzRnM1RGV5TUFTdzJCTkszUnIxcU9nTm1BZTJGZGJCTjkyL1g0WElJ?=
 =?utf-8?B?eU9CVk50bUhyQ1pVSHpPdGM1QkdjMHgvUTdTcGJwRjQ0SG5COXZ6UlhDU2hQ?=
 =?utf-8?B?MVg2STk3dUlQTG5KUGx1Zm5FWlJLRjhVd0pFWVFjMG1iRDhmTmROMVVTQ2FI?=
 =?utf-8?B?SEE3dHpaL3RQL2NSRDBqR3c1cUJvZFNhaEVZZTZ3TEFYYVpTNW1QczdnYVBK?=
 =?utf-8?B?OVRGVDk5MVpSYTRpQ3dGcVdwRnphVkl5d1psQmoyM09uSHJiTFRiUjRuNFly?=
 =?utf-8?B?M1E4bVNKdWtma21ISFZlS1NzL2VPOG81NmxqN1U3SU8vTldjM0pORjlTWjZG?=
 =?utf-8?B?bWtKeUkwV3lHQzB0Z2tNWE8yZy95c0JIeWc4a1Fpb3UvRnV2b3RUbnd5NkJr?=
 =?utf-8?B?cFNJWXNPakNYVUNzZDFKeEF2Nm9NSXQzQmJ6NlNndFQyQStRSllQY1FweHlo?=
 =?utf-8?B?L1Ntcks5VkFxamlaVkZuWm5ZWWVyK0RzdUpqNk1XQ052bGg1YkoyL09xVmFn?=
 =?utf-8?B?bWU2L3doeFVvNnBEMnA1cW4veTcvcUgweDBBU0hZbGJReG9XK29qaVRjOE5y?=
 =?utf-8?B?SGhqWk9FaXpvRVBBbFZ3R0FzZER3QlpvYndxMGoyaUlQUURFc0l0em96N1hw?=
 =?utf-8?B?N1YreHBIYnFWMTlGZnUvSklyZlhaRkt5LzVvbVRRSi9GOUJiWE9WV1JmNWlq?=
 =?utf-8?B?WVBxaUlTcjN6b216clFXTUFHMnZaNEQrSG1ZSkxoM3phODBIbngrdmNoclJH?=
 =?utf-8?B?MGt2bS96RkZLVll4SlkvMmpWaFJVWk91MlVJWUlEZ0xsZ2YwdXJwTTVVT3B4?=
 =?utf-8?B?Z05DV2pQck50RzVaa0JzaGVTZWhJVkpBZ1JVQWxrNUl6ZVg4RHNwd2QzQWNC?=
 =?utf-8?B?bkpyUkhhQkdSSXM5R2swK0kxN0RTcDdWR1lmaU9kZmdvQk5UOG1Ja0IxS3BT?=
 =?utf-8?B?dkR2SlJiT2czODN0d0dJY0tRcjlpQktkOFRDeUJsREgwOFpkcDEvYituU1pp?=
 =?utf-8?B?dFRrUzhOdjNGVEhMc1daZUU2Q1Jqb3lTMjkwRmE1U0JwSGoydTlNRGRPME4y?=
 =?utf-8?B?WWc0TnlWcW1HdE81TkkwKzJHQXZoaEFEOWVLZ2w2QnhncDg4MmpqR2lPejcr?=
 =?utf-8?B?ZXJkZ1FwUG1kN3VlbCtrK2tFVmRZWjlKbjdFOFF0TnNra2hvNkI0MVN5Wnht?=
 =?utf-8?B?Vk9STFNEUWtuRk44ZkFLcFAwRk8wdFpLUTNjcFBjU0VuaFBXKzRzdWJ6UWVS?=
 =?utf-8?B?ODBvL2VadXIwNGdPWmprYnVaK0xmR1hkMThpMnRyaWVyT0FtVFBwRVpMWXZD?=
 =?utf-8?B?N2cwUkZoV1d5KzRiN2YvYTBZMG0vc1dwZVU4RE13enJFOXQzYnZYb1NFVVdC?=
 =?utf-8?B?aEhzNGlyblc3ZE1TS3dJWkpLdnlMWTZ2S1d4MVNySjV1QkEwelRlT0pnUjQr?=
 =?utf-8?B?cnZxV0EvY1d6aHBWWllCWVkyTXpIRkNZNWtsT2l5Rlc3Q3VMV0RsSWhmWll3?=
 =?utf-8?B?SmRHWEF2OWRNeXNGVk0ra1M2QW5NT3hSVFNwcXVtUnlKYmpkd0JUR3JzS3U1?=
 =?utf-8?Q?K7dfA/d1DtTE0ArAsGW6kIuR5GSzi6CdwMkH//r?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6711d70-ba0a-4f0c-43cc-08d94b9935c1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3503.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 16:12:45.8970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +DQ9F7SwKgmqeQ4teV9Qwuv+SiKIfXtLSV80axwYKOnppJNZdjzEaBUJlOu+szlAkuMKuwad14HSXTWMsXN97Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3806
X-Mailman-Approved-At: Wed, 21 Jul 2021 07:27:54 +0000
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/15/2021 3:20 AM, Jason Gunthorpe wrote:
> FSL uses the internal reflck to implement the open_device() functionality,
> conversion to the core code is straightforward.
> 
> The decision on which set to be part of is trivially based on the
> is_fsl_mc_bus_dprc() and we use a 'struct device *' pointer as the set_id.
> 
> It isn't entirely clear what the device set lock is actually protecting,
> but I think it is related to the interrupt setup.

Yes, it is protecting the interrupts setup. The FSL MC devices are using 
MSIs and only the DPRC device is allocating the MSIs from the MSI 
domain. The other devices just take interrupts from a pool. The lock is 
protecting the access to this pool.

> 
> Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/vfio/fsl-mc/vfio_fsl_mc.c         | 152 ++++------------------
>   drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c    |   6 +-
>   drivers/vfio/fsl-mc/vfio_fsl_mc_private.h |   7 -
>   3 files changed, 26 insertions(+), 139 deletions(-)
> 
> diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> index 3d2be06e1bc146..49b93de05d5d62 100644
> --- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> +++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
> @@ -19,81 +19,10 @@
>   
>   static struct fsl_mc_driver vfio_fsl_mc_driver;
>   
> -static DEFINE_MUTEX(reflck_lock);
> -
> -static void vfio_fsl_mc_reflck_get(struct vfio_fsl_mc_reflck *reflck)
> -{
> -	kref_get(&reflck->kref);
> -}
> -
> -static void vfio_fsl_mc_reflck_release(struct kref *kref)
> -{
> -	struct vfio_fsl_mc_reflck *reflck = container_of(kref,
> -						      struct vfio_fsl_mc_reflck,
> -						      kref);
> -
> -	mutex_destroy(&reflck->lock);
> -	kfree(reflck);
> -	mutex_unlock(&reflck_lock);
> -}
> -
> -static void vfio_fsl_mc_reflck_put(struct vfio_fsl_mc_reflck *reflck)
> -{
> -	kref_put_mutex(&reflck->kref, vfio_fsl_mc_reflck_release, &reflck_lock);
> -}
> -
> -static struct vfio_fsl_mc_reflck *vfio_fsl_mc_reflck_alloc(void)
> -{
> -	struct vfio_fsl_mc_reflck *reflck;
> -
> -	reflck = kzalloc(sizeof(*reflck), GFP_KERNEL);
> -	if (!reflck)
> -		return ERR_PTR(-ENOMEM);
> -
> -	kref_init(&reflck->kref);
> -	mutex_init(&reflck->lock);
> -
> -	return reflck;
> -}
> -
> -static int vfio_fsl_mc_reflck_attach(struct vfio_fsl_mc_device *vdev)
> -{
> -	int ret = 0;
> -
> -	mutex_lock(&reflck_lock);
> -	if (is_fsl_mc_bus_dprc(vdev->mc_dev)) {
> -		vdev->reflck = vfio_fsl_mc_reflck_alloc();
> -		ret = PTR_ERR_OR_ZERO(vdev->reflck);
> -	} else {
> -		struct device *mc_cont_dev = vdev->mc_dev->dev.parent;
> -		struct vfio_device *device;
> -		struct vfio_fsl_mc_device *cont_vdev;
> -
> -		device = vfio_device_get_from_dev(mc_cont_dev);
> -		if (!device) {
> -			ret = -ENODEV;
> -			goto unlock;
> -		}
> -
> -		cont_vdev =
> -			container_of(device, struct vfio_fsl_mc_device, vdev);
> -		if (!cont_vdev || !cont_vdev->reflck) {
> -			vfio_device_put(device);
> -			ret = -ENODEV;
> -			goto unlock;
> -		}
> -		vfio_fsl_mc_reflck_get(cont_vdev->reflck);
> -		vdev->reflck = cont_vdev->reflck;
> -		vfio_device_put(device);
> -	}
> -
> -unlock:
> -	mutex_unlock(&reflck_lock);
> -	return ret;
> -}
> -
> -static int vfio_fsl_mc_regions_init(struct vfio_fsl_mc_device *vdev)
> +static int vfio_fsl_mc_open_device(struct vfio_device *core_vdev)
>   {
> +	struct vfio_fsl_mc_device *vdev =
> +		container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
>   	struct fsl_mc_device *mc_dev = vdev->mc_dev;
>   	int count = mc_dev->obj_desc.region_count;
>   	int i;
> @@ -136,58 +65,30 @@ static void vfio_fsl_mc_regions_cleanup(struct vfio_fsl_mc_device *vdev)
>   	kfree(vdev->regions);
>   }
>   
> -static int vfio_fsl_mc_open(struct vfio_device *core_vdev)
> -{
> -	struct vfio_fsl_mc_device *vdev =
> -		container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
> -	int ret = 0;
> -
> -	mutex_lock(&vdev->reflck->lock);
> -	if (!vdev->refcnt) {
> -		ret = vfio_fsl_mc_regions_init(vdev);
> -		if (ret)
> -			goto out;
> -	}
> -	vdev->refcnt++;
> -out:
> -	mutex_unlock(&vdev->reflck->lock);
>   
> -	return ret;
> -}
> -
> -static void vfio_fsl_mc_release(struct vfio_device *core_vdev)
> +static void vfio_fsl_mc_close_device(struct vfio_device *core_vdev)
>   {
>   	struct vfio_fsl_mc_device *vdev =
>   		container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
> +	struct fsl_mc_device *mc_dev = vdev->mc_dev;
> +	struct device *cont_dev = fsl_mc_cont_dev(&mc_dev->dev);
> +	struct fsl_mc_device *mc_cont = to_fsl_mc_device(cont_dev);
>   	int ret;
>   
> -	mutex_lock(&vdev->reflck->lock);
> +	vfio_fsl_mc_regions_cleanup(vdev);
>   
> -	if (!(--vdev->refcnt)) {
> -		struct fsl_mc_device *mc_dev = vdev->mc_dev;
> -		struct device *cont_dev = fsl_mc_cont_dev(&mc_dev->dev);
> -		struct fsl_mc_device *mc_cont = to_fsl_mc_device(cont_dev);
> -
> -		vfio_fsl_mc_regions_cleanup(vdev);
> +	/* reset the device before cleaning up the interrupts */
> +	ret = dprc_reset_container(mc_cont->mc_io, 0, mc_cont->mc_handle,
> +				   mc_cont->obj_desc.id,
> +				   DPRC_RESET_OPTION_NON_RECURSIVE);
>   
> -		/* reset the device before cleaning up the interrupts */
> -		ret = dprc_reset_container(mc_cont->mc_io, 0,
> -		      mc_cont->mc_handle,
> -			  mc_cont->obj_desc.id,
> -			  DPRC_RESET_OPTION_NON_RECURSIVE);
> +	if (WARN_ON(ret))
> +		dev_warn(&mc_cont->dev,
> +			 "VFIO_FLS_MC: reset device has failed (%d)\n", ret);
>   
> -		if (ret) {
> -			dev_warn(&mc_cont->dev, "VFIO_FLS_MC: reset device has failed (%d)\n",
> -				 ret);
> -			WARN_ON(1);
> -		}
> +	vfio_fsl_mc_irqs_cleanup(vdev);
>   
> -		vfio_fsl_mc_irqs_cleanup(vdev);
> -
> -		fsl_mc_cleanup_irq_pool(mc_cont);

There is also a need for the lock here. Eventhough the close function is 
called only once, there might be a race between the devices in the set. 
The lock is protecting the pool of interrupts and releasing interrupts 
to the pool might generate races if not protected:

--- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
@@ -86,9 +86,12 @@ static void vfio_fsl_mc_close_device(struct 
vfio_device *core_vdev)
                 dev_warn(&mc_cont->dev,
                          "VFIO_FLS_MC: reset device has failed (%d)\n", 
ret);

+       mutex_lock(&vdev->vdev.dev_set->lock);
         vfio_fsl_mc_irqs_cleanup(vdev);

         fsl_mc_cleanup_irq_pool(mc_cont);
+       mutex_unlock(&vdev->vdev.dev_set->lock);
+
  }


> -	}
> -
> -	mutex_unlock(&vdev->reflck->lock);
> +	fsl_mc_cleanup_irq_pool(mc_cont);
>   }
>   
>   static long vfio_fsl_mc_ioctl(struct vfio_device *core_vdev,
> @@ -504,8 +405,8 @@ static int vfio_fsl_mc_mmap(struct vfio_device *core_vdev,
>   
>   static const struct vfio_device_ops vfio_fsl_mc_ops = {
>   	.name		= "vfio-fsl-mc",
> -	.open		= vfio_fsl_mc_open,
> -	.release	= vfio_fsl_mc_release,
> +	.open_device	= vfio_fsl_mc_open_device,
> +	.close_device	= vfio_fsl_mc_close_device,
>   	.ioctl		= vfio_fsl_mc_ioctl,
>   	.read		= vfio_fsl_mc_read,
>   	.write		= vfio_fsl_mc_write,
> @@ -625,13 +526,15 @@ static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
>   	vdev->mc_dev = mc_dev;
>   	mutex_init(&vdev->igate);
>   
> -	ret = vfio_fsl_mc_reflck_attach(vdev);
> +	ret = vfio_assign_device_set(&vdev->vdev, is_fsl_mc_bus_dprc(mc_dev) ?
> +							  &mc_dev->dev :
> +							  mc_dev->dev.parent);
>   	if (ret)
>   		goto out_uninit;
>   
>   	ret = vfio_fsl_mc_init_device(vdev);
>   	if (ret)
> -		goto out_reflck;
> +		goto out_uninit;
>   
>   	ret = vfio_register_group_dev(&vdev->vdev);
>   	if (ret) {
> @@ -639,12 +542,6 @@ static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
>   		goto out_device;
>   	}
>   
> -	/*
> -	 * This triggers recursion into vfio_fsl_mc_probe() on another device
> -	 * and the vfio_fsl_mc_reflck_attach() must succeed, which relies on the
> -	 * vfio_add_group_dev() above. It has no impact on this vdev, so it is
> -	 * safe to be after the vfio device is made live.
> -	 */
>   	ret = vfio_fsl_mc_scan_container(mc_dev);
>   	if (ret)
>   		goto out_group_dev;
> @@ -655,8 +552,6 @@ static int vfio_fsl_mc_probe(struct fsl_mc_device *mc_dev)
>   	vfio_unregister_group_dev(&vdev->vdev);
>   out_device:
>   	vfio_fsl_uninit_device(vdev);
> -out_reflck:
> -	vfio_fsl_mc_reflck_put(vdev->reflck);
>   out_uninit:
>   	vfio_uninit_group_dev(&vdev->vdev);
>   	kfree(vdev);
> @@ -676,7 +571,6 @@ static int vfio_fsl_mc_remove(struct fsl_mc_device *mc_dev)
>   	dprc_remove_devices(mc_dev, NULL, 0);
>   	vfio_fsl_uninit_device(vdev);
>   	vfio_uninit_group_dev(&vdev->vdev);
> -	vfio_fsl_mc_reflck_put(vdev->reflck);
>   
>   	kfree(vdev);
>   	vfio_iommu_group_put(mc_dev->dev.iommu_group, dev);
> diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c b/drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c
> index 0d9f3002df7f51..77e584093a233d 100644
> --- a/drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c
> +++ b/drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c
> @@ -120,7 +120,7 @@ static int vfio_fsl_mc_set_irq_trigger(struct vfio_fsl_mc_device *vdev,
>   	if (start != 0 || count != 1)
>   		return -EINVAL;
>   
> -	mutex_lock(&vdev->reflck->lock);
> +	mutex_lock(&vdev->vdev.dev_set->lock);
>   	ret = fsl_mc_populate_irq_pool(mc_cont,
>   			FSL_MC_IRQ_POOL_MAX_TOTAL_IRQS);
>   	if (ret)
> @@ -129,7 +129,7 @@ static int vfio_fsl_mc_set_irq_trigger(struct vfio_fsl_mc_device *vdev,
>   	ret = vfio_fsl_mc_irqs_allocate(vdev);
>   	if (ret)
>   		goto unlock;
> -	mutex_unlock(&vdev->reflck->lock);
> +	mutex_unlock(&vdev->vdev.dev_set->lock);
>   
>   	if (flags & VFIO_IRQ_SET_DATA_EVENTFD) {
>   		s32 fd = *(s32 *)data;
> @@ -154,7 +154,7 @@ static int vfio_fsl_mc_set_irq_trigger(struct vfio_fsl_mc_device *vdev,
>   	return 0;
>   
>   unlock:
> -	mutex_unlock(&vdev->reflck->lock);
> +	mutex_unlock(&vdev->vdev.dev_set->lock);
>   	return ret;
>   
>   }
> diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc_private.h b/drivers/vfio/fsl-mc/vfio_fsl_mc_private.h
> index 89700e00e77d10..4ad63ececb914b 100644
> --- a/drivers/vfio/fsl-mc/vfio_fsl_mc_private.h
> +++ b/drivers/vfio/fsl-mc/vfio_fsl_mc_private.h
> @@ -22,11 +22,6 @@ struct vfio_fsl_mc_irq {
>   	char            *name;
>   };
>   
> -struct vfio_fsl_mc_reflck {
> -	struct kref		kref;
> -	struct mutex		lock;
> -};
> -
>   struct vfio_fsl_mc_region {
>   	u32			flags;
>   	u32			type;
> @@ -39,9 +34,7 @@ struct vfio_fsl_mc_device {
>   	struct vfio_device		vdev;
>   	struct fsl_mc_device		*mc_dev;
>   	struct notifier_block        nb;
> -	int				refcnt;
>   	struct vfio_fsl_mc_region	*regions;
> -	struct vfio_fsl_mc_reflck   *reflck;
>   	struct mutex         igate;
>   	struct vfio_fsl_mc_irq      *mc_irqs;
>   };
> 

Diana
