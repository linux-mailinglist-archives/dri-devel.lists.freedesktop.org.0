Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B93844600
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 18:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450C010FB69;
	Wed, 31 Jan 2024 17:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FEC10FB67
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 17:22:58 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40V7MK83016639; Wed, 31 Jan 2024 17:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:mime-version; s=dk201812; bh=KcdkbCYQPjqKfxko9hv/o
 Zx8hkHK0GGVXW1xDXlg9rE=; b=iVV1uW7QiOPjXCj/ayKVPoomBr2enxVdOW0Z0
 d1aM3p3OMW+NMNMSf9h0O+mfI8TJANCa9je3BYWoXVuuoWQGC7ejlNalb9ZlYcfQ
 82ib3ellFWSADiIy1de88Gdvjat8gQe5rBu2IGRJGrTPNhnuy8lgjOmrkHAZfpFI
 ISqkmEI1dAKp0X3Mn+LgBy3qMdAiiF/OjiuF1xKTf2iYUQVSbYOsE05UnDi5hN8O
 g5535MrBxDE0SiN91tE0HLR8xbkjK00GCBwqBosH0ZvHqe4q/6obpjzy0UspLn0Z
 VcJrCzvIoIY+2PQughI7JerUNuQPcJMaQb23hOHucR8obzCyw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3vvrys3gk9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 31 Jan 2024 17:22:31 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 17:22:31 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.40) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 31 Jan 2024 17:22:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhcRhgiZIFSn24XfoASDT9Ah9NoVfQzG1TI5ctebtLSCk8C7FQ9HvXwplVf7P88xG4UkdP0jVTYp89viaWCds5X/+tETOOz4homzkEB7xBubto5PeP5jlRQa9uHdFr4B865zCKDxAgSbr0gsL69LW4bjjAmYNTW61CkGZ/bq+DWXpm56PWZ0p+nh0qudDkMrzRlicB97m4iL0NoCqKc+Gnwh/dpBJ8e0L1+eThtWU1NxNRXmxpNCwYx31ZQZA4t0kFWBHw+KyDcKzrNPU4KchyBVKfk01+Y5I2xmlifPfBF6FQd0+u+41cshLYnVRBJ3+SleQQ4Vmfe9MKId8fo2Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcdkbCYQPjqKfxko9hv/oZx8hkHK0GGVXW1xDXlg9rE=;
 b=OQDAzv5anlnk20aaT/84Bnb6RTgZAaJyXO4O+ITfD4nzFtpFcsf6o9FD0McdKWMnCNZXOt2EJwI6NKSkDodJYdc5MjGG/foK7p4kyc5UxAY9uOUIkjhdCOdARMy+rXEvGQJooCJGnFCP68sMEMimm1LZOULnPjoJN0GGjs79UE8wRlmOEaqbD9Kl4SAKoDo3BB7k6434pVYpdc2+a7Cq68XQQV327hS+FT8PlvO2d2uDBtOnCe9l8iJHMGiKSVHe/k0VXeP1SKKSiV1fMY7uqkwAF+RpyW8T6IkE1XQnW/gR4ncPbXe9IR7meT384FpyX1PJxDeIOnQrQX+F8xyD8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KcdkbCYQPjqKfxko9hv/oZx8hkHK0GGVXW1xDXlg9rE=;
 b=oYdp4z1BJgEpii6owUO8uoLKI+6ZE3/OFUZkQcLYv5UJlcR2K+oaBhjOIbPXQmVRCSKtGFbzSm3+ZxOtJJBPCr1gmDyI1j4c9wUWZY3+79GVs++w3ow7rJ2mqZPeC9BfmEZTirE55sGwXvSgANI+Hq3X5agpzjF6QJhu1dzZRnw=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO2P265MB5775.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:26f::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.23; Wed, 31 Jan 2024 17:22:26 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::39d4:9d4a:b6a:9ad0]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::39d4:9d4a:b6a:9ad0%6]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 17:22:26 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/imagination: On device loss, handle unplug after
 critical section
Thread-Topic: [PATCH] drm/imagination: On device loss, handle unplug after
 critical section
Thread-Index: AQHaVGoPZmL+4hCJakS2Zw1LNf/Jjw==
Date: Wed, 31 Jan 2024 17:22:26 +0000
Message-ID: <42207bd6-2167-49a3-8895-b76fb79a06e6@imgtec.com>
References: <59bb4827-43a5-4e87-8026-77777b2a8087@imgtec.com>
 <ZbKsE2mWTZTfsFBk@phenom.ffwll.local>
In-Reply-To: <ZbKsE2mWTZTfsFBk@phenom.ffwll.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO2P265MB5775:EE_
x-ms-office365-filtering-correlation-id: ea1023f8-cd5e-4a53-481b-08dc22813218
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BeQ3otg0Qf5fyAJ7yX+7D8ncl4JXdUAo7W2pht+oBbNNXmP8I26ZGB6i34+ozxKmT/i6i/pIAh6iTwvh6SYl0zPpM2hzC+v7PJ0LfeckOmui8ViNlLPq622S5w1F+lVdD2PGEsCfvMwy9yn+kHjwSAxucszgJIe/8iGoXUKdXOFmcMVWgTZDdKV8IU0i9REwAXgc78koIYieKeK0WWspIMBxgyBBJofE9RV4QqzuDh6Rc13oi6Ab13gwnaTRw9xmqLjsSaFjfNAhDX6dH0evtMV7CkHxrKcwjhRkmfT946alYdw8EmUpo7GXYPt63AJDP7lPnA8ounx6pYfTiYm1tpT9/ZFuPkxhlGqNLlKRPqHd5IRDNKsGysSYlvBzrNP2aSp7zTSrot4yO99aPT4b6ZY1TS0bM28Xu4xnftN5AOX7eR4HIYuHc1p8q68Ll66C5rsS+qodQYEmhnq4TJPq2wOiRACo1yHKmGWCX55jTV43052+TMoIew+w3BJ9TefvFNKjyyyM0+zA2kAXOMjElxTgPSGQfXeXhNwfoJv+1hXZhfXbuFA/RgQk8jNTwY8Jfgqn/LxiemIY48XmLJ1Ly+7YOy0F9srLegwcmdUYU9KgXQzjnIbIyXYdPMfKZdmN3UGOpqBmd+UzQVCw7JYJ4g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(366004)(39850400004)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(2616005)(26005)(31686004)(41300700001)(966005)(54906003)(38070700009)(66476007)(64756008)(66556008)(6916009)(316002)(66446008)(36756003)(478600001)(53546011)(6512007)(83380400001)(6486002)(99936003)(38100700002)(6506007)(71200400001)(122000001)(66946007)(31696002)(86362001)(8936002)(30864003)(5660300002)(76116006)(4326008)(8676002)(2906002)(45980500001)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVFZL01XaDRveFFzWmJIQnpZeG9BQzNzMDhzWTNZN0Rmc3ZjcEo1azhZQ0xp?=
 =?utf-8?B?VEtrUXRibFhGK0RIenBoV2RzbCtTTkVwU1p2TXdTZEtYY1BRYzNEK0F3c1ZG?=
 =?utf-8?B?UXIyY05KTFV2encrOVlqTmV2N3lyS3F4bjhqM1lRVmdiRjBOcU9JUzBYbFMr?=
 =?utf-8?B?SVRrdDE2aHRpYWozNU1EZ3dJb2d6NVhTY1dManU0UFVOSldPQVJ3RENvcy96?=
 =?utf-8?B?aUt2c084a3ErVkVTVkpCRDBYeDlzdUZYaFJBZWl1Zm1PVHRXbkN2R1NxNFpJ?=
 =?utf-8?B?dFRnZG9udkU2R204U1R4VXZwcG9uOGpNSzA1clJFL2IvYzdyYklDaHEwdlZu?=
 =?utf-8?B?aWVUa3VqWVZ2a2ZMUE4vR0xmdDZsTGxkTDFLRndDdnBNRkRTaVRNbS90YzVU?=
 =?utf-8?B?TUMvOSt3Z1ZDUFVHMi92VUt3b3c4N3NUcmlyRmJtb2ZhTFpwdmFGRGtHUXlp?=
 =?utf-8?B?VmtNQXdIV3laOEszTXBFSkR3M05kVVFlc1ZqMjJNSG8zL0pkdEM3SThJVFM0?=
 =?utf-8?B?RUl2b1dycDFISmJETklKMXhVcDd3WGF4NTh3NlJJekJoMENoekFKR2lqV09o?=
 =?utf-8?B?ZGI2N0hxSHRnOFF1MkN6Z2E1Mk9odTFsWjB3ZG9ISHp6YjR1ekJ6OW1tUnFy?=
 =?utf-8?B?ZWlBT2JpMTVLb0hucVgrU2xPQnFiSXV6d0owR3lSdG4xTFYyOUtEWmNRR0dC?=
 =?utf-8?B?OG1QczVQNTJ1akJwQUUrWlFrVm1OOEZFbTdiNXlVZU94ZXQ0bWt2MWZ4TGgx?=
 =?utf-8?B?aDBlSGp2QTJxaXNVVlUzYVhUYVpaT2RVWDVSNWdONnNWNXNDaGd6cnlvYXFI?=
 =?utf-8?B?cUpsQVFOYjBMWmFTZ2l3MVh4bFBZVGtiQWVFczRyQlc4WkZuKzd2SGJpaWxr?=
 =?utf-8?B?WmZ4OFR5c2pCaGc3SkgrTk1zZ1NIUEY2OVpXQXAvdGhRQWtaY2JhWHhVd0R3?=
 =?utf-8?B?QWhVbGFRSjNLeHVnMVlsY1JPTEhsZWJtVG1IWU4vVXYveFZNc3ZoRnRYZ3A3?=
 =?utf-8?B?OGo0aGRINFc5eWR6UnhIRGIvcEtKMTFqbzdyRVlKWkJTMmF2WVRudGtSS1JI?=
 =?utf-8?B?TzFnbUdOZjR5c1V1SG1ETVduRy9obyttdjhnMmw2cExzbEFrYTB1a29CbDJ6?=
 =?utf-8?B?NGRlOHN2U05lcHQrMXBiaUZvQU0zd1RjL3VQSGQ1d3dNdWxYZ0hvV2s2OEhX?=
 =?utf-8?B?cStQcUg1UHRhb3JORmVISmdyQTBnVWxucy9yN3dMNEJLMEo1a2NpZkRGb1lK?=
 =?utf-8?B?Y3ZBUWNmMzN3K0grMXlsWStyUjJIU3RkQUFBTXJoV25RaUk1TjRiS0xaVHU3?=
 =?utf-8?B?TWYzVGk2MUEwN1ZjYTUyeVhETW50MXFmODBGaElBSWRHQS9pN1QwY1phaFRT?=
 =?utf-8?B?ZktDYXc0VTJPVnRPRmVQK2ttNll2SFBvcTNsWnVFUDRzQjZYakRoRlh3K285?=
 =?utf-8?B?U2Q3NktiWUlkSzNnTkNMKzFJaFNyUmpVdCtjbWhuWUVVYU1INjRwNDZjclR4?=
 =?utf-8?B?Y0txaVh2dW9iM0pwWDdVV2dTT3FQN2MyNGdiMUhHcFEyUS91VGxnMHhYek4r?=
 =?utf-8?B?bWJzSmVuTzR5VkNFSDhVZjdkTXNEOC9oMjB4bWNibjhHeVdJRTFWdmNOMTlN?=
 =?utf-8?B?c09GazExZzI3Y3VKWWlyMm9GdWV0OEpWc0JDbVpDSW9OVWZWQndkNkJXYjhI?=
 =?utf-8?B?N055ajBmTTdzaExyVDQybXdhREowdWcxTkJvWERKMWdEZ25hRG5rUTN0SVAz?=
 =?utf-8?B?Y3FnNzdtMzhRcDRyajVwdjF6amx5R2pVcWpuZ1FrL0tqbUNUUEhCNWhlK25r?=
 =?utf-8?B?RlpUTURoUmdPZmNsR2RXVFhiSVRVVXU0ZUpHMndLbThYVDgvU1RCbmx2cnFl?=
 =?utf-8?B?dzN3VDVzL1pHZCttZk02OTF3TFdjRTlnMG10eGtLZ3dyNUFkbXdNNFlNUEps?=
 =?utf-8?B?ZlF1S2Fia2VyQlFFblpTMFhXYVJ0QTBKSllJb0VTNUVMendWTVh6QUlOT3NI?=
 =?utf-8?B?L2tqb2VlaGxNd2txc2o2TWszNjA1VnJ5TC9ROEIxZnkzbkZ5MENqb1pXUmUx?=
 =?utf-8?B?TDVjNE52MVMxMStmOHY0WnhnZTFXOUZpRU9Yd2F0cVRERmhqWUNWb28wRnNE?=
 =?utf-8?B?VUNpN1JFb04vN3RsMUJJRnJLOUVlRDVaNnpOVUZXN01JVFlmRURWa1BQZysw?=
 =?utf-8?B?Q0E9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Vs7YbR5YkqG36lHtbLHQWGgL"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ea1023f8-cd5e-4a53-481b-08dc22813218
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 17:22:26.6319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WEOCwYq/EQEb97avEkY88B3DXU96nAOuTXEr0xmtszmvk2m3lr2j0f+Wc6LFlGRqUOh2OteK8ghyjYeGhdDRyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5775
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: RrQMegUk74-QMa5lvhi0Wz20dk9QAY11
X-Proofpoint-ORIG-GUID: RrQMegUk74-QMa5lvhi0Wz20dk9QAY11
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
Cc: Maxime Ripard <mripard@kernel.org>, Steven Price <steven.price@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------Vs7YbR5YkqG36lHtbLHQWGgL
Content-Type: multipart/mixed; boundary="------------0r0xXYhJXiA5O80ycI0I8P0B";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Frank Binns <Frank.Binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
Message-ID: <42207bd6-2167-49a3-8895-b76fb79a06e6@imgtec.com>
Subject: Re: [PATCH] drm/imagination: On device loss, handle unplug after
 critical section
References: <59bb4827-43a5-4e87-8026-77777b2a8087@imgtec.com>
 <ZbKsE2mWTZTfsFBk@phenom.ffwll.local>
In-Reply-To: <ZbKsE2mWTZTfsFBk@phenom.ffwll.local>

--------------0r0xXYhJXiA5O80ycI0I8P0B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 25/01/2024 18:44, Daniel Vetter wrote:
> On Tue, Jan 23, 2024 at 01:04:24PM +0000, Matt Coster wrote:
>> From: Donald Robson <donald.robson@imgtec.com>
>>
>> When the kernel driver 'loses' the device, for instance if the firmwar=
e
>> stops communicating, the driver calls drm_dev_unplug(). This is
>> currently done inside the drm_dev_enter() critical section, which isn'=
t
>> permitted. In addition, the bool that marks the device as lost is not
>> atomic or protected by a lock.
>>
>> This fix replaces the bool with an atomic that also acts as a mechanis=
m
>> to ensure the device is unplugged after drm_dev_exit(), preventing a
>> concurrent call to drm_dev_enter() from succeeding in a race between i=
t
>> and drm_dev_unplug().
>=20
> Uh ... atomic_t does not make locking.
>=20
> From a quick look this entire thing smells a bit like bad design overal=
l,
> and my gut feeling is that you probably want to rip out pvr_dev->lost
> outright. Or alternatively, explain what exactly this does beyond
> drm_dev_enter/exit, and then probably add that functionality there inst=
ead
> of hand-roll lockless trickery in drivers.
>=20
> From a quick look keeping track of where you realize the device is lost=

> and then calling drm_dev_unplug after the drm_dev_exit is probably the
> clean solution. That also means the drm_dev_unplug() is not delayed due=
 to
> a drm_dev_enter/exit section on a different thread, which is probably a=

> good thing.
>=20
> Cheers, Sima

Hi Sima,

Thanks for taking the time to look over this patch.

This was the last piece of work Donald did for us at Imagination but he
never got a chance to send it out himself.

I'll put it on my list to try a new, more minimal, approach before
sending a v2. Your suggestion sounds very promising =E2=80=93 that's prob=
ably
the first thing I'll try.

Cheers,
Matt
=20
>> Reported-by: Steven Price <steven.price@arm.com>
>> Closes: https://lore.kernel.org/dri-devel/1b957ca4-71cf-42fd-ac81-1920=
592b952d@arm.com/
>> Fixes: cc1aeedb98ad ("drm/imagination: Implement firmware infrastructu=
re and META FW support")
>> Signed-off-by: Donald Robson <donald.robson@imgtec.com>
>> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
>> ---
>>  drivers/gpu/drm/imagination/pvr_ccb.c      |  2 +-
>>  drivers/gpu/drm/imagination/pvr_device.c   | 98 +++++++++++++++++++++=
-
>>  drivers/gpu/drm/imagination/pvr_device.h   | 72 +++++++++++++---
>>  drivers/gpu/drm/imagination/pvr_drv.c      | 87 ++++++++++---------
>>  drivers/gpu/drm/imagination/pvr_fw.c       | 12 +--
>>  drivers/gpu/drm/imagination/pvr_fw_trace.c |  4 +-
>>  drivers/gpu/drm/imagination/pvr_mmu.c      | 20 ++---
>>  drivers/gpu/drm/imagination/pvr_power.c    | 42 +++-------
>>  drivers/gpu/drm/imagination/pvr_power.h    |  2 -
>>  9 files changed, 237 insertions(+), 102 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/imagination/pvr_ccb.c b/drivers/gpu/drm/i=
magination/pvr_ccb.c
>> index 4deeac7ed40a..1fe64adc0c2c 100644
>> --- a/drivers/gpu/drm/imagination/pvr_ccb.c
>> +++ b/drivers/gpu/drm/imagination/pvr_ccb.c
>> @@ -247,7 +247,7 @@ pvr_kccb_send_cmd_reserved_powered(struct pvr_devi=
ce *pvr_dev,
>>  	u32 old_write_offset;
>>  	u32 new_write_offset;
>> =20
>> -	WARN_ON(pvr_dev->lost);
>> +	WARN_ON(pvr_device_is_lost(pvr_dev));
>> =20
>>  	mutex_lock(&pvr_ccb->lock);
>> =20
>> diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/dr=
m/imagination/pvr_device.c
>> index 1704c0268589..397491375b7d 100644
>> --- a/drivers/gpu/drm/imagination/pvr_device.c
>> +++ b/drivers/gpu/drm/imagination/pvr_device.c
>> @@ -6,14 +6,15 @@
>> =20
>>  #include "pvr_fw.h"
>>  #include "pvr_params.h"
>> -#include "pvr_power.h"
>>  #include "pvr_queue.h"
>>  #include "pvr_rogue_cr_defs.h"
>>  #include "pvr_stream.h"
>>  #include "pvr_vm.h"
>> =20
>> +#include <drm/drm_drv.h>
>>  #include <drm/drm_print.h>
>> =20
>> +#include <linux/atomic.h>
>>  #include <linux/bitfield.h>
>>  #include <linux/clk.h>
>>  #include <linux/compiler_attributes.h>
>> @@ -556,6 +557,101 @@ pvr_device_fini(struct pvr_device *pvr_dev)
>>  	pvr_device_gpu_fini(pvr_dev);
>>  }
>> =20
>> +/**
>> + * pvr_device_enter() - Try to enter device critical section.
>> + * @pvr_dev: Target PowerVR device.
>> + * @idx: Pointer to index that will be passed to the matching pvr_dev=
ice_exit().
>> + *
>> + * Use this in place of drm_dev_enter() within this driver.
>> + *
>> + * Returns:
>> + *  * %true if the critical section was entered, or
>> + *  * %false otherwise.
>> + */
>> +bool pvr_device_enter(struct pvr_device *pvr_dev, int *idx)
>> +{
>> +	const enum pvr_device_state old_state =3D
>> +		atomic_cmpxchg(&pvr_dev->state,
>> +			       PVR_DEVICE_STATE_PRESENT,
>> +			       PVR_DEVICE_STATE_ENTERED);
>> +
>> +	switch (old_state) {
>> +	case PVR_DEVICE_STATE_PRESENT:
>> +	case PVR_DEVICE_STATE_ENTERED:
>> +		return drm_dev_enter(from_pvr_device(pvr_dev), idx);
>> +
>> +	case PVR_DEVICE_STATE_LOST:
>> +	case PVR_DEVICE_STATE_LOST_UNPLUGGED:
>> +		WARN_ONCE(1, "Attempt to use GPU after becoming lost.");
>> +		break;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +/**
>> + * pvr_device_exit() - Exit a device critical section.
>> + * @pvr_dev: Target PowerVR device.
>> + * @idx: Index given by matching pvr_device_enter().
>> + *
>> + * Use this in place of drm_dev_exit() within this driver.
>> + */
>> +void pvr_device_exit(struct pvr_device *pvr_dev, int idx)
>> +{
>> +	const enum pvr_device_state old_state =3D
>> +		atomic_cmpxchg(&pvr_dev->state,
>> +			       PVR_DEVICE_STATE_ENTERED,
>> +			       PVR_DEVICE_STATE_PRESENT);
>> +
>> +	switch (old_state) {
>> +	case PVR_DEVICE_STATE_PRESENT:
>> +	case PVR_DEVICE_STATE_ENTERED:
>> +		drm_dev_exit(idx);
>> +		return;
>> +
>> +	case PVR_DEVICE_STATE_LOST:
>> +		/* Unplug the device if it was lost during the critical section. */=

>> +		atomic_set(&pvr_dev->state, PVR_DEVICE_STATE_LOST_UNPLUGGED);
>> +
>> +		drm_dev_exit(idx);
>> +
>> +		WARN_ONCE(1, "GPU lost and now unplugged.");
>> +		drm_dev_unplug(from_pvr_device(pvr_dev));
>> +
>> +		return;
>> +
>> +	case PVR_DEVICE_STATE_LOST_UNPLUGGED:
>> +		WARN_ONCE(1, "GPU unplugged during critical section.");
>> +		drm_dev_exit(idx);
>> +		return;
>> +	}
>> +}
>> +
>> +/**
>> + * pvr_device_set_lost() - Mark GPU device as lost.
>> + * @pvr_dev: Target PowerVR device.
>> + *
>> + * This will cause the DRM device to be unplugged at the next call to=

>> + * pvr_device_exit().
>> + */
>> +void pvr_device_set_lost(struct pvr_device *pvr_dev)
>> +{
>> +	/*
>> +	 * Unplug the device immediately if the device is not in a critical
>> +	 * section.
>> +	 */
>> +	const bool unplug =3D atomic_cmpxchg(&pvr_dev->state,
>> +					   PVR_DEVICE_STATE_PRESENT,
>> +					   PVR_DEVICE_STATE_LOST_UNPLUGGED) =3D=3D
>> +			    PVR_DEVICE_STATE_PRESENT;
>> +
>> +	if (unplug)
>> +		drm_dev_unplug(from_pvr_device(pvr_dev));
>> +	else
>> +		atomic_cmpxchg(&pvr_dev->state, PVR_DEVICE_STATE_ENTERED,
>> +			       PVR_DEVICE_STATE_LOST);
>> +}
>> +
>>  bool
>>  pvr_device_has_uapi_quirk(struct pvr_device *pvr_dev, u32 quirk)
>>  {
>> diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/dr=
m/imagination/pvr_device.h
>> index ecdd5767d8ef..7c08b2bda395 100644
>> --- a/drivers/gpu/drm/imagination/pvr_device.h
>> +++ b/drivers/gpu/drm/imagination/pvr_device.h
>> @@ -274,20 +274,19 @@ struct pvr_device {
>>  	} kccb;
>> =20
>>  	/**
>> -	 * @lost: %true if the device has been lost.
>> -	 *
>> -	 * This variable is set if the device has become irretrievably unava=
ilable, e.g. if the
>> -	 * firmware processor has stopped responding and can not be revived =
via a hard reset.
>> +	 * @state: Indicates whether the device is present and in use. One o=
f
>> +	 * &enum pvr_device_state.
>>  	 */
>> -	bool lost;
>> +	atomic_t state;
>> =20
>>  	/**
>>  	 * @reset_sem: Reset semaphore.
>>  	 *
>> -	 * GPU reset code will lock this for writing. Any code that submits =
commands to the firmware
>> -	 * that isn't in an IRQ handler or on the scheduler workqueue must l=
ock this for reading.
>> -	 * Once this has been successfully locked, &pvr_dev->lost _must_ be =
checked, and -%EIO must
>> -	 * be returned if it is set.
>> +	 * GPU reset code will lock this for writing. Any code that submits
>> +	 * commands to the firmware that isn't in an IRQ handler or on the
>> +	 * scheduler workqueue must lock this for reading.
>> +	 * Once this has been successfully locked, pvr_device_is_lost() _mus=
t_
>> +	 * be checked, and -%EIO must be returned if it is.
>>  	 */
>>  	struct rw_semaphore reset_sem;
>> =20
>> @@ -487,7 +486,60 @@ packed_bvnc_to_pvr_gpu_id(u64 bvnc, struct pvr_gp=
u_id *gpu_id)
>> =20
>>  int pvr_device_init(struct pvr_device *pvr_dev);
>>  void pvr_device_fini(struct pvr_device *pvr_dev);
>> -void pvr_device_reset(struct pvr_device *pvr_dev);
>> +
>> +/**
>> + * enum pvr_device_state - States used by &struct pvr_device.state.
>> + */
>> +enum pvr_device_state {
>> +	/** @PVR_DEVICE_STATE_PRESENT: The device is available for use. */
>> +	PVR_DEVICE_STATE_PRESENT,
>> +
>> +	/** @PVR_DEVICE_STATE_ENTERED: The device is in a critical section. =
*/
>> +	PVR_DEVICE_STATE_ENTERED,
>> +
>> +	/**
>> +	 * @PVR_DEVICE_STATE_LOST: The device was lost during the current de=
vice
>> +	 * critical section and will be unplugged once the section exits.
>> +	 */
>> +	PVR_DEVICE_STATE_LOST,
>> +
>> +	/**
>> +	 * @PVR_DEVICE_STATE_LOST_UNPLUGGED: The device was lost and
>> +	 * subsequently unplugged.
>> +	 *
>> +	 * The device may become irretrievably unavailable, e.g. if the firm=
ware
>> +	 * processor has stopped responding and can not be revived via a har=
d
>> +	 * reset.
>> +	 */
>> +	PVR_DEVICE_STATE_LOST_UNPLUGGED,
>> +};
>> +
>> +/**
>> + * pvr_device_is_lost() - Check if GPU device has been marked lost.
>> + * @pvr_dev: Target PowerVR device.
>> + *
>> + * Returns:
>> + *  * %true if device is lost, or
>> + *  * %false otherwise.
>> + */
>> +static __always_inline bool pvr_device_is_lost(struct pvr_device *pvr=
_dev)
>> +{
>> +	switch ((enum pvr_device_state)atomic_read(&pvr_dev->state)) {
>> +	case PVR_DEVICE_STATE_PRESENT:
>> +	case PVR_DEVICE_STATE_ENTERED:
>> +		return false;
>> +
>> +	case PVR_DEVICE_STATE_LOST:
>> +	case PVR_DEVICE_STATE_LOST_UNPLUGGED:
>> +		break;
>> +	}
>> +
>> +	return true;
>> +}
>> +
>> +bool pvr_device_enter(struct pvr_device *pvr_dev, int *idx);
>> +void pvr_device_exit(struct pvr_device *pvr_dev, int idx);
>> +void pvr_device_set_lost(struct pvr_device *pvr_dev);
>> =20
>>  bool
>>  pvr_device_has_uapi_quirk(struct pvr_device *pvr_dev, u32 quirk);
>> diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/i=
magination/pvr_drv.c
>> index 5c3b2d58d766..55bea656a40f 100644
>> --- a/drivers/gpu/drm/imagination/pvr_drv.c
>> +++ b/drivers/gpu/drm/imagination/pvr_drv.c
>> @@ -81,13 +81,13 @@ pvr_ioctl_create_bo(struct drm_device *drm_dev, vo=
id *raw_args,
>>  	int idx;
>>  	int err;
>> =20
>> -	if (!drm_dev_enter(drm_dev, &idx))
>> +	if (!pvr_device_enter(pvr_dev, &idx))
>>  		return -EIO;
>> =20
>>  	/* All padding fields must be zeroed. */
>>  	if (args->_padding_c !=3D 0) {
>>  		err =3D -EINVAL;
>> -		goto err_drm_dev_exit;
>> +		goto err_pvr_device_exit;
>>  	}
>> =20
>>  	/*
>> @@ -101,7 +101,7 @@ pvr_ioctl_create_bo(struct drm_device *drm_dev, vo=
id *raw_args,
>>  	if (args->size > SIZE_MAX || args->size =3D=3D 0 || args->flags &
>>  	    ~DRM_PVR_BO_FLAGS_MASK || args->size & (PVR_DEVICE_PAGE_SIZE - 1=
)) {
>>  		err =3D -EINVAL;
>> -		goto err_drm_dev_exit;
>> +		goto err_pvr_device_exit;
>>  	}
>> =20
>>  	sanitized_size =3D (size_t)args->size;
>> @@ -113,7 +113,7 @@ pvr_ioctl_create_bo(struct drm_device *drm_dev, vo=
id *raw_args,
>>  	pvr_obj =3D pvr_gem_object_create(pvr_dev, sanitized_size, args->fla=
gs);
>>  	if (IS_ERR(pvr_obj)) {
>>  		err =3D PTR_ERR(pvr_obj);
>> -		goto err_drm_dev_exit;
>> +		goto err_pvr_device_exit;
>>  	}
>> =20
>>  	/* This function will not modify &args->handle unless it succeeds. *=
/
>> @@ -121,7 +121,7 @@ pvr_ioctl_create_bo(struct drm_device *drm_dev, vo=
id *raw_args,
>>  	if (err)
>>  		goto err_destroy_obj;
>> =20
>> -	drm_dev_exit(idx);
>> +	pvr_device_exit(pvr_dev, idx);
>> =20
>>  	return 0;
>> =20
>> @@ -133,8 +133,8 @@ pvr_ioctl_create_bo(struct drm_device *drm_dev, vo=
id *raw_args,
>>  	 */
>>  	pvr_gem_object_put(pvr_obj);
>> =20
>> -err_drm_dev_exit:
>> -	drm_dev_exit(idx);
>> +err_pvr_device_exit:
>> +	pvr_device_exit(pvr_dev, idx);
>> =20
>>  	return err;
>>  }
>> @@ -164,19 +164,20 @@ pvr_ioctl_get_bo_mmap_offset(struct drm_device *=
drm_dev, void *raw_args,
>>  			     struct drm_file *file)
>>  {
>>  	struct drm_pvr_ioctl_get_bo_mmap_offset_args *args =3D raw_args;
>> +	struct pvr_device *pvr_dev =3D to_pvr_device(drm_dev);
>>  	struct pvr_file *pvr_file =3D to_pvr_file(file);
>>  	struct pvr_gem_object *pvr_obj;
>>  	struct drm_gem_object *gem_obj;
>>  	int idx;
>>  	int ret;
>> =20
>> -	if (!drm_dev_enter(drm_dev, &idx))
>> +	if (!pvr_device_enter(pvr_dev, &idx))
>>  		return -EIO;
>> =20
>>  	/* All padding fields must be zeroed. */
>>  	if (args->_padding_4 !=3D 0) {
>>  		ret =3D -EINVAL;
>> -		goto err_drm_dev_exit;
>> +		goto err_pvr_device_exit;
>>  	}
>> =20
>>  	/*
>> @@ -188,7 +189,7 @@ pvr_ioctl_get_bo_mmap_offset(struct drm_device *dr=
m_dev, void *raw_args,
>>  	pvr_obj =3D pvr_gem_object_from_handle(pvr_file, args->handle);
>>  	if (!pvr_obj) {
>>  		ret =3D -ENOENT;
>> -		goto err_drm_dev_exit;
>> +		goto err_pvr_device_exit;
>>  	}
>> =20
>>  	gem_obj =3D gem_from_pvr_gem(pvr_obj);
>> @@ -202,7 +203,7 @@ pvr_ioctl_get_bo_mmap_offset(struct drm_device *dr=
m_dev, void *raw_args,
>>  	if (ret !=3D 0) {
>>  		/* Drop our reference to the buffer object. */
>>  		drm_gem_object_put(gem_obj);
>> -		goto err_drm_dev_exit;
>> +		goto err_pvr_device_exit;
>>  	}
>> =20
>>  	/*
>> @@ -214,8 +215,8 @@ pvr_ioctl_get_bo_mmap_offset(struct drm_device *dr=
m_dev, void *raw_args,
>>  	/* Drop our reference to the buffer object. */
>>  	pvr_gem_object_put(pvr_obj);
>> =20
>> -err_drm_dev_exit:
>> -	drm_dev_exit(idx);
>> +err_pvr_device_exit:
>> +	pvr_device_exit(pvr_dev, idx);
>> =20
>>  	return ret;
>>  }
>> @@ -626,7 +627,7 @@ pvr_ioctl_dev_query(struct drm_device *drm_dev, vo=
id *raw_args,
>>  	int idx;
>>  	int ret =3D -EINVAL;
>> =20
>> -	if (!drm_dev_enter(drm_dev, &idx))
>> +	if (!pvr_device_enter(pvr_dev, &idx))
>>  		return -EIO;
>> =20
>>  	switch ((enum drm_pvr_dev_query)args->type) {
>> @@ -655,7 +656,7 @@ pvr_ioctl_dev_query(struct drm_device *drm_dev, vo=
id *raw_args,
>>  		break;
>>  	}
>> =20
>> -	drm_dev_exit(idx);
>> +	pvr_device_exit(pvr_dev, idx);
>> =20
>>  	return ret;
>>  }
>> @@ -680,16 +681,17 @@ pvr_ioctl_create_context(struct drm_device *drm_=
dev, void *raw_args,
>>  			 struct drm_file *file)
>>  {
>>  	struct drm_pvr_ioctl_create_context_args *args =3D raw_args;
>> +	struct pvr_device *pvr_dev =3D to_pvr_device(drm_dev);
>>  	struct pvr_file *pvr_file =3D file->driver_priv;
>>  	int idx;
>>  	int ret;
>> =20
>> -	if (!drm_dev_enter(drm_dev, &idx))
>> +	if (!pvr_device_enter(pvr_dev, &idx))
>>  		return -EIO;
>> =20
>>  	ret =3D pvr_context_create(pvr_file, args);
>> =20
>> -	drm_dev_exit(idx);
>> +	pvr_device_exit(pvr_dev, idx);
>> =20
>>  	return ret;
>>  }
>> @@ -738,18 +740,19 @@ pvr_ioctl_create_free_list(struct drm_device *dr=
m_dev, void *raw_args,
>>  			   struct drm_file *file)
>>  {
>>  	struct drm_pvr_ioctl_create_free_list_args *args =3D raw_args;
>> +	struct pvr_device *pvr_dev =3D to_pvr_device(drm_dev);
>>  	struct pvr_file *pvr_file =3D to_pvr_file(file);
>>  	struct pvr_free_list *free_list;
>>  	int idx;
>>  	int err;
>> =20
>> -	if (!drm_dev_enter(drm_dev, &idx))
>> +	if (!pvr_device_enter(pvr_dev, &idx))
>>  		return -EIO;
>> =20
>>  	free_list =3D pvr_free_list_create(pvr_file, args);
>>  	if (IS_ERR(free_list)) {
>>  		err =3D PTR_ERR(free_list);
>> -		goto err_drm_dev_exit;
>> +		goto err_pvr_device_exit;
>>  	}
>> =20
>>  	/* Allocate object handle for userspace. */
>> @@ -761,15 +764,15 @@ pvr_ioctl_create_free_list(struct drm_device *dr=
m_dev, void *raw_args,
>>  	if (err < 0)
>>  		goto err_cleanup;
>> =20
>> -	drm_dev_exit(idx);
>> +	pvr_device_exit(pvr_dev, idx);
>> =20
>>  	return 0;
>> =20
>>  err_cleanup:
>>  	pvr_free_list_put(free_list);
>> =20
>> -err_drm_dev_exit:
>> -	drm_dev_exit(idx);
>> +err_pvr_device_exit:
>> +	pvr_device_exit(pvr_dev, idx);
>> =20
>>  	return err;
>>  }
>> @@ -824,18 +827,19 @@ pvr_ioctl_create_hwrt_dataset(struct drm_device =
*drm_dev, void *raw_args,
>>  			      struct drm_file *file)
>>  {
>>  	struct drm_pvr_ioctl_create_hwrt_dataset_args *args =3D raw_args;
>> +	struct pvr_device *pvr_dev =3D to_pvr_device(drm_dev);
>>  	struct pvr_file *pvr_file =3D to_pvr_file(file);
>>  	struct pvr_hwrt_dataset *hwrt;
>>  	int idx;
>>  	int err;
>> =20
>> -	if (!drm_dev_enter(drm_dev, &idx))
>> +	if (!pvr_device_enter(pvr_dev, &idx))
>>  		return -EIO;
>> =20
>>  	hwrt =3D pvr_hwrt_dataset_create(pvr_file, args);
>>  	if (IS_ERR(hwrt)) {
>>  		err =3D PTR_ERR(hwrt);
>> -		goto err_drm_dev_exit;
>> +		goto err_pvr_device_exit;
>>  	}
>> =20
>>  	/* Allocate object handle for userspace. */
>> @@ -847,15 +851,15 @@ pvr_ioctl_create_hwrt_dataset(struct drm_device =
*drm_dev, void *raw_args,
>>  	if (err < 0)
>>  		goto err_cleanup;
>> =20
>> -	drm_dev_exit(idx);
>> +	pvr_device_exit(pvr_dev, idx);
>> =20
>>  	return 0;
>> =20
>>  err_cleanup:
>>  	pvr_hwrt_dataset_put(hwrt);
>> =20
>> -err_drm_dev_exit:
>> -	drm_dev_exit(idx);
>> +err_pvr_device_exit:
>> +	pvr_device_exit(pvr_dev, idx);
>> =20
>>  	return err;
>>  }
>> @@ -910,23 +914,24 @@ pvr_ioctl_create_vm_context(struct drm_device *d=
rm_dev, void *raw_args,
>>  			    struct drm_file *file)
>>  {
>>  	struct drm_pvr_ioctl_create_vm_context_args *args =3D raw_args;
>> +	struct pvr_device *pvr_dev =3D to_pvr_device(drm_dev);
>>  	struct pvr_file *pvr_file =3D to_pvr_file(file);
>>  	struct pvr_vm_context *vm_ctx;
>>  	int idx;
>>  	int err;
>> =20
>> -	if (!drm_dev_enter(drm_dev, &idx))
>> +	if (!pvr_device_enter(pvr_dev, &idx))
>>  		return -EIO;
>> =20
>>  	if (args->_padding_4) {
>>  		err =3D -EINVAL;
>> -		goto err_drm_dev_exit;
>> +		goto err_pvr_device_exit;
>>  	}
>> =20
>>  	vm_ctx =3D pvr_vm_create_context(pvr_file->pvr_dev, true);
>>  	if (IS_ERR(vm_ctx)) {
>>  		err =3D PTR_ERR(vm_ctx);
>> -		goto err_drm_dev_exit;
>> +		goto err_pvr_device_exit;
>>  	}
>> =20
>>  	/* Allocate object handle for userspace. */
>> @@ -938,15 +943,15 @@ pvr_ioctl_create_vm_context(struct drm_device *d=
rm_dev, void *raw_args,
>>  	if (err < 0)
>>  		goto err_cleanup;
>> =20
>> -	drm_dev_exit(idx);
>> +	pvr_device_exit(pvr_dev, idx);
>> =20
>>  	return 0;
>> =20
>>  err_cleanup:
>>  	pvr_vm_context_put(vm_ctx);
>> =20
>> -err_drm_dev_exit:
>> -	drm_dev_exit(idx);
>> +err_pvr_device_exit:
>> +	pvr_device_exit(pvr_dev, idx);
>> =20
>>  	return err;
>>  }
>> @@ -1022,26 +1027,26 @@ pvr_ioctl_vm_map(struct drm_device *drm_dev, v=
oid *raw_args,
>>  	int idx;
>>  	int err;
>> =20
>> -	if (!drm_dev_enter(drm_dev, &idx))
>> +	if (!pvr_device_enter(pvr_dev, &idx))
>>  		return -EIO;
>> =20
>>  	/* Initial validation of args. */
>>  	if (args->_padding_14) {
>>  		err =3D -EINVAL;
>> -		goto err_drm_dev_exit;
>> +		goto err_pvr_device_exit;
>>  	}
>> =20
>>  	if (args->flags !=3D 0 ||
>>  	    check_add_overflow(args->offset, args->size, &offset_plus_size) =
||
>>  	    !pvr_find_heap_containing(pvr_dev, args->device_addr, args->size=
)) {
>>  		err =3D -EINVAL;
>> -		goto err_drm_dev_exit;
>> +		goto err_pvr_device_exit;
>>  	}
>> =20
>>  	vm_ctx =3D pvr_vm_context_lookup(pvr_file, args->vm_context_handle);=

>>  	if (!vm_ctx) {
>>  		err =3D -EINVAL;
>> -		goto err_drm_dev_exit;
>> +		goto err_pvr_device_exit;
>>  	}
>> =20
>>  	pvr_obj =3D pvr_gem_object_from_handle(pvr_file, args->handle);
>> @@ -1079,8 +1084,8 @@ pvr_ioctl_vm_map(struct drm_device *drm_dev, voi=
d *raw_args,
>>  err_put_vm_context:
>>  	pvr_vm_context_put(vm_ctx);
>> =20
>> -err_drm_dev_exit:
>> -	drm_dev_exit(idx);
>> +err_pvr_device_exit:
>> +	pvr_device_exit(pvr_dev, idx);
>> =20
>>  	return err;
>>  }
>> @@ -1148,12 +1153,12 @@ pvr_ioctl_submit_jobs(struct drm_device *drm_d=
ev, void *raw_args,
>>  	int idx;
>>  	int err;
>> =20
>> -	if (!drm_dev_enter(drm_dev, &idx))
>> +	if (!pvr_device_enter(pvr_dev, &idx))
>>  		return -EIO;
>> =20
>>  	err =3D pvr_submit_jobs(pvr_dev, pvr_file, args);
>> =20
>> -	drm_dev_exit(idx);
>> +	pvr_device_exit(pvr_dev, idx);
>> =20
>>  	return err;
>>  }
>> diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/im=
agination/pvr_fw.c
>> index 3debc9870a82..07547e167963 100644
>> --- a/drivers/gpu/drm/imagination/pvr_fw.c
>> +++ b/drivers/gpu/drm/imagination/pvr_fw.c
>> @@ -1094,7 +1094,7 @@ pvr_fw_structure_cleanup(struct pvr_device *pvr_=
dev, u32 type, struct pvr_fw_obj
>> =20
>>  	down_read(&pvr_dev->reset_sem);
>> =20
>> -	if (!drm_dev_enter(from_pvr_device(pvr_dev), &idx)) {
>> +	if (!pvr_device_enter(pvr_dev, &idx)) {
>>  		err =3D -EIO;
>>  		goto err_up_read;
>>  	}
>> @@ -1118,22 +1118,22 @@ pvr_fw_structure_cleanup(struct pvr_device *pv=
r_dev, u32 type, struct pvr_fw_obj
>>  		break;
>>  	default:
>>  		err =3D -EINVAL;
>> -		goto err_drm_dev_exit;
>> +		goto err_pvr_device_exit;
>>  	}
>> =20
>>  	err =3D pvr_kccb_send_cmd(pvr_dev, &cmd, &slot_nr);
>>  	if (err)
>> -		goto err_drm_dev_exit;
>> +		goto err_pvr_device_exit;
>> =20
>>  	err =3D pvr_kccb_wait_for_completion(pvr_dev, slot_nr, HZ, &rtn);
>>  	if (err)
>> -		goto err_drm_dev_exit;
>> +		goto err_pvr_device_exit;
>> =20
>>  	if (rtn & ROGUE_FWIF_KCCB_RTN_SLOT_CLEANUP_BUSY)
>>  		err =3D -EBUSY;
>> =20
>> -err_drm_dev_exit:
>> -	drm_dev_exit(idx);
>> +err_pvr_device_exit:
>> +	pvr_device_exit(pvr_dev, idx);
>> =20
>>  err_up_read:
>>  	up_read(&pvr_dev->reset_sem);
>> diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/=
drm/imagination/pvr_fw_trace.c
>> index 31199e45b72e..26d67483eac2 100644
>> --- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
>> +++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
>> @@ -149,7 +149,7 @@ update_logtype(struct pvr_device *pvr_dev, u32 gro=
up_mask)
>>  	fw_trace->group_mask =3D group_mask;
>> =20
>>  	down_read(&pvr_dev->reset_sem);
>> -	if (!drm_dev_enter(from_pvr_device(pvr_dev), &idx)) {
>> +	if (!pvr_device_enter(pvr_dev, &idx)) {
>>  		err =3D -EIO;
>>  		goto err_up_read;
>>  	}
>> @@ -159,7 +159,7 @@ update_logtype(struct pvr_device *pvr_dev, u32 gro=
up_mask)
>> =20
>>  	err =3D pvr_kccb_send_cmd(pvr_dev, &cmd, NULL);
>> =20
>> -	drm_dev_exit(idx);
>> +	pvr_device_exit(pvr_dev, idx);
>> =20
>>  err_up_read:
>>  	up_read(&pvr_dev->reset_sem);
>> diff --git a/drivers/gpu/drm/imagination/pvr_mmu.c b/drivers/gpu/drm/i=
magination/pvr_mmu.c
>> index 4fe70610ed94..59911f70e9ca 100644
>> --- a/drivers/gpu/drm/imagination/pvr_mmu.c
>> +++ b/drivers/gpu/drm/imagination/pvr_mmu.c
>> @@ -129,18 +129,18 @@ int pvr_mmu_flush_exec(struct pvr_device *pvr_de=
v, bool wait)
>>  	u32 slot;
>>  	int idx;
>> =20
>> -	if (!drm_dev_enter(from_pvr_device(pvr_dev), &idx))
>> +	if (!pvr_device_enter(pvr_dev, &idx))
>>  		return -EIO;
>> =20
>>  	/* Can't flush MMU if the firmware hasn't booted yet. */
>>  	if (!pvr_dev->fw_dev.booted)
>> -		goto err_drm_dev_exit;
>> +		goto err_pvr_device_exit;
>> =20
>>  	cmd_mmu_cache_data->cache_flags =3D
>>  		atomic_xchg(&pvr_dev->mmu_flush_cache_flags, 0);
>> =20
>>  	if (!cmd_mmu_cache_data->cache_flags)
>> -		goto err_drm_dev_exit;
>> +		goto err_pvr_device_exit;
>> =20
>>  	cmd_mmu_cache.cmd_type =3D ROGUE_FWIF_KCCB_CMD_MMUCACHE;
>> =20
>> @@ -156,7 +156,7 @@ int pvr_mmu_flush_exec(struct pvr_device *pvr_dev,=
 bool wait)
>>  	if (err)
>>  		goto err_reset_and_retry;
>> =20
>> -	drm_dev_exit(idx);
>> +	pvr_device_exit(pvr_dev, idx);
>> =20
>>  	return 0;
>> =20
>> @@ -167,23 +167,23 @@ int pvr_mmu_flush_exec(struct pvr_device *pvr_de=
v, bool wait)
>>  	 */
>>  	err =3D pvr_power_reset(pvr_dev, true);
>>  	if (err)
>> -		goto err_drm_dev_exit; /* Device is lost. */
>> +		goto err_pvr_device_exit; /* Device is lost. */
>> =20
>>  	/* Retry sending flush request. */
>>  	err =3D pvr_kccb_send_cmd(pvr_dev, &cmd_mmu_cache, &slot);
>>  	if (err) {
>> -		pvr_device_lost(pvr_dev);
>> -		goto err_drm_dev_exit;
>> +		pvr_device_set_lost(pvr_dev);
>> +		goto err_pvr_device_exit;
>>  	}
>> =20
>>  	if (wait) {
>>  		err =3D pvr_kccb_wait_for_completion(pvr_dev, slot, HZ, NULL);
>>  		if (err)
>> -			pvr_device_lost(pvr_dev);
>> +			pvr_device_set_lost(pvr_dev);
>>  	}
>> =20
>> -err_drm_dev_exit:
>> -	drm_dev_exit(idx);
>> +err_pvr_device_exit:
>> +	pvr_device_exit(pvr_dev, idx);
>> =20
>>  	return err;
>>  }
>> diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm=
/imagination/pvr_power.c
>> index ba7816fd28ec..c927def3d3f3 100644
>> --- a/drivers/gpu/drm/imagination/pvr_power.c
>> +++ b/drivers/gpu/drm/imagination/pvr_power.c
>> @@ -23,21 +23,6 @@
>> =20
>>  #define WATCHDOG_TIME_MS (500)
>> =20
>> -/**
>> - * pvr_device_lost() - Mark GPU device as lost
>> - * @pvr_dev: Target PowerVR device.
>> - *
>> - * This will cause the DRM device to be unplugged.
>> - */
>> -void
>> -pvr_device_lost(struct pvr_device *pvr_dev)
>> -{
>> -	if (!pvr_dev->lost) {
>> -		pvr_dev->lost =3D true;
>> -		drm_dev_unplug(from_pvr_device(pvr_dev));
>> -	}
>> -}
>> -
>>  static int
>>  pvr_power_send_command(struct pvr_device *pvr_dev, struct rogue_fwif_=
kccb_cmd *pow_cmd)
>>  {
>> @@ -186,7 +171,7 @@ pvr_watchdog_worker(struct work_struct *work)
>>  						  watchdog.work.work);
>>  	bool stalled;
>> =20
>> -	if (pvr_dev->lost)
>> +	if (pvr_device_is_lost(pvr_dev))
>>  		return;
>> =20
>>  	if (pm_runtime_get_if_in_use(from_pvr_device(pvr_dev)->dev) <=3D 0)
>> @@ -208,10 +193,9 @@ pvr_watchdog_worker(struct work_struct *work)
>>  	pm_runtime_put(from_pvr_device(pvr_dev)->dev);
>> =20
>>  out_requeue:
>> -	if (!pvr_dev->lost) {
>> +	if (!pvr_device_is_lost(pvr_dev))
>>  		queue_delayed_work(pvr_dev->sched_wq, &pvr_dev->watchdog.work,
>>  				   msecs_to_jiffies(WATCHDOG_TIME_MS));
>> -	}
>>  }
>> =20
>>  /**
>> @@ -239,21 +223,21 @@ pvr_power_device_suspend(struct device *dev)
>>  	int err =3D 0;
>>  	int idx;
>> =20
>> -	if (!drm_dev_enter(drm_dev, &idx))
>> +	if (!pvr_device_enter(pvr_dev, &idx))
>>  		return -EIO;
>> =20
>>  	if (pvr_dev->fw_dev.booted) {
>>  		err =3D pvr_power_fw_disable(pvr_dev, false);
>>  		if (err)
>> -			goto err_drm_dev_exit;
>> +			goto err_pvr_device_exit;
>>  	}
>> =20
>>  	clk_disable_unprepare(pvr_dev->mem_clk);
>>  	clk_disable_unprepare(pvr_dev->sys_clk);
>>  	clk_disable_unprepare(pvr_dev->core_clk);
>> =20
>> -err_drm_dev_exit:
>> -	drm_dev_exit(idx);
>> +err_pvr_device_exit:
>> +	pvr_device_exit(pvr_dev, idx);
>> =20
>>  	return err;
>>  }
>> @@ -267,12 +251,12 @@ pvr_power_device_resume(struct device *dev)
>>  	int idx;
>>  	int err;
>> =20
>> -	if (!drm_dev_enter(drm_dev, &idx))
>> +	if (!pvr_device_enter(pvr_dev, &idx))
>>  		return -EIO;
>> =20
>>  	err =3D clk_prepare_enable(pvr_dev->core_clk);
>>  	if (err)
>> -		goto err_drm_dev_exit;
>> +		goto err_pvr_device_exit;
>> =20
>>  	err =3D clk_prepare_enable(pvr_dev->sys_clk);
>>  	if (err)
>> @@ -288,7 +272,7 @@ pvr_power_device_resume(struct device *dev)
>>  			goto err_mem_clk_disable;
>>  	}
>> =20
>> -	drm_dev_exit(idx);
>> +	pvr_device_exit(pvr_dev, idx);
>> =20
>>  	return 0;
>> =20
>> @@ -301,8 +285,8 @@ pvr_power_device_resume(struct device *dev)
>>  err_core_clk_disable:
>>  	clk_disable_unprepare(pvr_dev->core_clk);
>> =20
>> -err_drm_dev_exit:
>> -	drm_dev_exit(idx);
>> +err_pvr_device_exit:
>> +	pvr_device_exit(pvr_dev, idx);
>> =20
>>  	return err;
>>  }
>> @@ -345,7 +329,7 @@ pvr_power_reset(struct pvr_device *pvr_dev, bool h=
ard_reset)
>> =20
>>  	down_write(&pvr_dev->reset_sem);
>> =20
>> -	if (pvr_dev->lost) {
>> +	if (pvr_device_is_lost(pvr_dev)) {
>>  		err =3D -EIO;
>>  		goto err_up_write;
>>  	}
>> @@ -407,7 +391,7 @@ pvr_power_reset(struct pvr_device *pvr_dev, bool h=
ard_reset)
>> =20
>>  err_device_lost:
>>  	drm_err(from_pvr_device(pvr_dev), "GPU device lost");
>> -	pvr_device_lost(pvr_dev);
>> +	pvr_device_set_lost(pvr_dev);
>> =20
>>  	/* Leave IRQs disabled if the device is lost. */
>> =20
>> diff --git a/drivers/gpu/drm/imagination/pvr_power.h b/drivers/gpu/drm=
/imagination/pvr_power.h
>> index 9a9312dcb2da..360980f454d7 100644
>> --- a/drivers/gpu/drm/imagination/pvr_power.h
>> +++ b/drivers/gpu/drm/imagination/pvr_power.h
>> @@ -12,8 +12,6 @@
>>  int pvr_watchdog_init(struct pvr_device *pvr_dev);
>=20
>=20
>=20
>=20
>=20
>=20

--------------0r0xXYhJXiA5O80ycI0I8P0B--

--------------Vs7YbR5YkqG36lHtbLHQWGgL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZbqB0gUDAAAAAAAKCRB5vBnz2d5qsG5X
AQC6QTa6Cn/NC47/Ioxyp2n8c56N26LOJC5sJHDvyLB4rAEAyxfpJswqGzHdFTVSDxbOt1hQtreg
UD7P+N5+/W8QfA0=
=8hwJ
-----END PGP SIGNATURE-----

--------------Vs7YbR5YkqG36lHtbLHQWGgL--
