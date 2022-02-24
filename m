Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C71974C3346
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 18:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D634810EC66;
	Thu, 24 Feb 2022 17:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2047.outbound.protection.outlook.com [40.107.95.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8FD10EC66;
 Thu, 24 Feb 2022 17:12:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7Qm481gnDsDdQlOwj9CqzZ8lJ0rLe96KrQ4jD4UoB03dQpFAuXhoUkZsCaK1pWeJFS5xdi4KM7CTmMyiRgEO1iZ1Vl4zUiHtxYoEppS8UkA0vp7pSSawCnLRRrUAJB6JxucvfJAvQ3B4eqSWzyDVKC0EB4Y5fpIG4P3YWCrbhCD5vlFlFrbkzJZfjUM+tnvjdemSN3EGUvdbm7B8Wv7xm+4rXqbnw+LlvsfhVMNDsFjvn/P6O775jVk02q65B3MlWcFAqrf0WAnB47ILnqknzZq/2bJxga5saCou/OkAy6b4oCDjsSr9xJhCouRN0dWSUhKmtcCppDPxoh/aP58Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNjhqNB/jCCWranT8bwGlSvf+ZLyda+73Ar6hcZIwPM=;
 b=QKEZF6gbVeJE/99RM3jR9eNR0fqMrTg4l3v/2bcE+zMWhJSHTasqNn7QOoc3VSZMCRy/HQe9tGKHZVjaPev6yxZj6BQTmO2W/T8eB5lwUBl+5yuKThNBX7Okf0hvh44VGXEzDvY3Fiy4xH5NknbJwV2jApJIoPcX2UNs9DkpHW3qkubbFmbPp7xQs3WeCyMLPhKoVEeMaGUelQ2+ioQFB4tIJ/zWQ0MOHELeh7yhqNM5OD16Sqi8NM1WQM+3yPrjsVC6mPKO3mYOceKbTn/G5DFiSQbgXs0ZY63SdJE2a0huTyd9Pf+EX4frFKPb8qBDZjdNEXWmZR6BahFXYhVXXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNjhqNB/jCCWranT8bwGlSvf+ZLyda+73Ar6hcZIwPM=;
 b=GMzB2Ralx2WkECx8GG5MU6VLcgxo45a+D6BzVsW/9AHErzu1K3SFNH+HcdogTEAK39atJkNBovgJl5STdbU97/YohR6pUJ7sbGwafFG5Lel4Fdq1oJwyDoCu4b2Ez+13CsUaJzgOJbA7y6UXP/8K2rVQwEjIKr+fY/Qr7ie+0gM=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by DM5PR12MB1689.namprd12.prod.outlook.com (2603:10b6:4:3::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.24; Thu, 24 Feb 2022 17:12:55 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::2877:73e4:31e7:cecf]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::2877:73e4:31e7:cecf%6]) with mapi id 15.20.5017.025; Thu, 24 Feb 2022
 17:12:55 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>, "Chen, JingWen"
 <JingWen.Chen2@amd.com>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [RFC v4 02/11] drm/amdgpu: Move scheduler init to after XGMI is
 ready
Thread-Topic: [RFC v4 02/11] drm/amdgpu: Move scheduler init to after XGMI is
 ready
Thread-Index: AQHYHUtWDLyrpE2tcUyoxOpmspGGdKyK2a6AgACrOgCAFtVOgIAAoTwAgAAM09o=
Date: Thu, 24 Feb 2022 17:12:55 +0000
Message-ID: <BL1PR12MB514424A75728E78BC0E5B848F73D9@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20220209002320.6077-1-andrey.grodzovsky@amd.com>
 <20220209002320.6077-3-andrey.grodzovsky@amd.com>
 <d82ac1a0-d81d-9861-fc1b-8cc06017a2b5@gmail.com>
 <1d7cb471-c32c-416c-4336-317ee9f171ef@amd.com>
 <3752a89c-d468-8c39-03a9-37d592dae89f@amd.com>
 <48c207dc-cc7a-efda-a4a8-4f1f1a6511fe@amd.com>
In-Reply-To: <48c207dc-cc7a-efda-a4a8-4f1f1a6511fe@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-02-24T17:12:54.305Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged; 
suggested_attachment_session_id: 55e9484b-c124-8edc-2c2b-d18e2d9787be
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec1e6c0e-f881-4a0e-bf4e-08d9f7b8e5de
x-ms-traffictypediagnostic: DM5PR12MB1689:EE_
x-microsoft-antispam-prvs: <DM5PR12MB16892BEA3E5EEE0353092ED7F73D9@DM5PR12MB1689.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jSOgbuVEDtoZGS7cviJ9o8sIDM4DFDgpNybeLEero3FcPgc72KsB7KSr+08Fqh7QF5UmU71MMMK5TNdpMkL+5MrJAKGk9JgQDyG6iTNwNZLg1Y4dXN15IcFtB2+3zLHL43xT5o/EMeARv+CNJRDUZT0xFAOT2b14Q5NKYFmfJb7Tpa5GBiaDsD7m66BpyVONur9WmZmpN+3QRIs8YiKuUSoZRUbxj4JoSgaCEdbrGPM5Cc67pl3ggZCtxOOZ5LwuPZ6kvqTUsKQTHVEtBu5qVKphgVEExF8tJDethypOd+vqc1iZS1M1Oti6vQUfbt0ijcygarHOLlKiid76nIO7zOmeSbeFknURFaU8wx8YPeGwCN/4lcfH8hh6HnU5C584ig6U5V2N+4OjbUXc4hNp8qcgUQt1gWXvu5JqixGq9jdDxeulFfzBuCE7rTWNl9qE2tVd7wotHpju6VES1XxOrd8eHTmTc08trVTbbPa3jb0zXsLKQCnQf7YyE5sd+TIXUjQk86UNDaC13/S6xLmie8u81n3h5lZJN0h+thJisuIDeMBpoXdoeaAPkKOgSxFrxWqAeLc1wBUmjaDdZ4Fj/A1PaKT+vra6QBIaIUzgpRpdeJ9xd6fZuCcas+GNbFiZ/lGR8wd24n3TiYl4L4tBa4uHXruR8GFq6nBM/xBw5+HtV5kasrcYtAFPJVtwggqAfQ/1lyrqYYE/Q2Uay4IbUA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(8936002)(7696005)(316002)(55016003)(54906003)(71200400001)(52536014)(53546011)(508600001)(19627405001)(9686003)(33656002)(110136005)(38070700005)(76116006)(66446008)(186003)(2906002)(66476007)(86362001)(38100700002)(122000001)(66574015)(66946007)(26005)(8676002)(66556008)(5660300002)(64756008)(4326008)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?BQutXK6coHty/X8kIdh0zpHPWliT6YkFCeyVopE4weOtjE0mOReniUOwQK?=
 =?iso-8859-1?Q?+GXxeRRW9T/m6IbWON5hJqqM/fx3DaPIL04rpRdd8i0bj3ZzU7MiJ+Jh6A?=
 =?iso-8859-1?Q?64odRmOBvT61oGUhnm77PuuUlFhp6UJ8FVHaaRpOWPYgLhhoR9PwoMVW9o?=
 =?iso-8859-1?Q?pqdtSkfw4+iPjDQNnpwffEpOxL/1Zd543j32xObeM6em02f36ypyV++pyR?=
 =?iso-8859-1?Q?BX5dtigXiO/GtjVWzt22a3n7ipjL0eNEOFX7VZ/2YlmQLeS9Cqv8isY7sM?=
 =?iso-8859-1?Q?07oLAlOXNbiiKflo37SebE8vddAMkEUvpT2u7I1rAf8uPgX8S0g1MB2C/4?=
 =?iso-8859-1?Q?1Kf1MdIjzZp5j07RH5Jb9LinF63fT306UIBsUNwFdS2OWn0kFSLC8Zyoe8?=
 =?iso-8859-1?Q?9cfV6r0Dn1JrvgMs1vVS4ZRcD1x0y+M/f2d11WtzOga0e+z9U99XhIJq61?=
 =?iso-8859-1?Q?BeMOK+e28F337XzA0xuubJlMFSk/Z8WoIkHo8llCujgsyNN/66BSjcJpi2?=
 =?iso-8859-1?Q?K+ZnByCV7ryHdJUQDQdGlEUN1XTu0ktXrtnU2847MQtL2x9d6AzE9OjES6?=
 =?iso-8859-1?Q?8C4jzpiB5EtbgAVnxMvHtykJFYJt/KyY1xSX07jq8bI5a+v/VwxA8Xfbku?=
 =?iso-8859-1?Q?E5UE7nXMjmIDhb4gZ+Mz4meig9BxmrGicdmYRSNRx8rIlGEH/BtbNYE+2J?=
 =?iso-8859-1?Q?V+FQZN5e7Q83zgCws/6fKvCKBBJnk1QurKszW488NmRT8aA9oao6SOli6J?=
 =?iso-8859-1?Q?9jFgGn7Cqw0XFv6j7XGeAzL76cVFJD/IrInOsVMdnOrbL2G5pY6AvR+toH?=
 =?iso-8859-1?Q?r3YYgyDc/rkj6baaFKfMo5bODq8MGQ5ejyVB6dO5k/WSMw1TatFmv8BYbU?=
 =?iso-8859-1?Q?2iImKBj1LSJsw1ucISUvW/J2pBFO+IAHIueKBPIRo9BHIl8Q9mGH7APssa?=
 =?iso-8859-1?Q?E7jcklNSUIEllGCvE6CdO7itrLqBxC3F7bqubq7PvDMlnkx54i9M3X46Mx?=
 =?iso-8859-1?Q?FdwozyMzDekwqQXzfWJOh3/boj1tXOok2RoS47uQ9jHmgEnFPJhUpzSD3Q?=
 =?iso-8859-1?Q?D2y7+ejTswLKxji+/shTUBkA5s4kRQI3cXcVZ6SYrg6mKjMrhTz3oTGy9m?=
 =?iso-8859-1?Q?6NuPOIGUq3OEkLta/uYEDuJhNO2ZbckGQ42SxTSnuVgIysNEJRDLGevVjC?=
 =?iso-8859-1?Q?6Jk2Kf8Es9+QGrmMDRjFkGKmEup6t1niP3+oslVXHn1g6OgnnSUrceuvMc?=
 =?iso-8859-1?Q?fPut/0Acv5ZJfsEgFDQlGG3DLSzbqa3XEhjJ9DwE4jp1HsWvVnSEGmz0RR?=
 =?iso-8859-1?Q?xkxxXA6/jCCSvRmgXDApNCwxI3YHvx2RACK0Aw1lYgV8tverPqmrKplTZA?=
 =?iso-8859-1?Q?qlkaJLyho4f+5qJJavLuq8ZUqDdUzfxLsXMdYf4hBdVmUrSBs0l7l74Bio?=
 =?iso-8859-1?Q?ac6FSrSkR02UmZxWMklHpmeNJtudbv553v+VWhwVVI1mPUy7NzeVJXXdCO?=
 =?iso-8859-1?Q?bEjso9Ues3eVEn83z4tnwBvT87LjudcbwJxs+c/UweamCiRxJdzkv9D5PY?=
 =?iso-8859-1?Q?Urc0Uc/tUFismx51Ol2Q6a2+YaYB/d/4dfG069H02B+XIlqLvK9dT7iwbv?=
 =?iso-8859-1?Q?CI9l8OtaEza3i821nxqY/wuPGb56FgCU1tySqa7e4ujVxIRnXUWl79YPJE?=
 =?iso-8859-1?Q?KAh1mwIVX+ZiUgAQCa8=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BL1PR12MB514424A75728E78BC0E5B848F73D9BL1PR12MB5144namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec1e6c0e-f881-4a0e-bf4e-08d9f7b8e5de
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 17:12:55.1009 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EfhXItXNszG63GRyQuBU/uptYLL9+CsPS+1h7nZ7J7uPiMy7h+SYneK3HeJTm+7dbgUImvFYSUZ1QYRfjCzD7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1689
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
Cc: "Chen, Horace" <Horace.Chen@amd.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BL1PR12MB514424A75728E78BC0E5B848F73D9BL1PR12MB5144namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[Public]

If it applies cleanly, feel free to drop it in.  I'll drop those patches fo=
r drm-next since they are already in drm-misc.

Alex

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Andrey G=
rodzovsky <andrey.grodzovsky@amd.com>
Sent: Thursday, February 24, 2022 11:24 AM
To: Chen, JingWen <JingWen.Chen2@amd.com>; Christian K=F6nig <ckoenig.leich=
tzumerken@gmail.com>; dri-devel@lists.freedesktop.org <dri-devel@lists.free=
desktop.org>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Liu, Monk <Monk.Liu@amd.com>; Chen, Horace <Horace.Chen@amd.com>; Lazar=
, Lijo <Lijo.Lazar@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; =
daniel@ffwll.ch <daniel@ffwll.ch>
Subject: Re: [RFC v4 02/11] drm/amdgpu: Move scheduler init to after XGMI i=
s ready

No because all the patch-set including this patch was landed into
drm-misc-next and will reach amd-staging-drm-next on the next upstream
rebase i guess.

Andrey

On 2022-02-24 01:47, JingWen Chen wrote:
> Hi Andrey,
>
> Will you port this patch into amd-staging-drm-next?
>
> on 2/10/22 2:06 AM, Andrey Grodzovsky wrote:
>> All comments are fixed and code pushed. Thanks for everyone
>> who helped reviewing.
>>
>> Andrey
>>
>> On 2022-02-09 02:53, Christian K=F6nig wrote:
>>> Am 09.02.22 um 01:23 schrieb Andrey Grodzovsky:
>>>> Before we initialize schedulers we must know which reset
>>>> domain are we in - for single device there iis a single
>>>> domain per device and so single wq per device. For XGMI
>>>> the reset domain spans the entire XGMI hive and so the
>>>> reset wq is per hive.
>>>>
>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> One more comment below, with that fixed Reviewed-by: Christian K=F6nig =
<christian.koenig@amd.com>.
>>>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 45 +++++++++++++++++++=
+++
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 34 ++--------------
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  2 +
>>>>    3 files changed, 51 insertions(+), 30 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_device.c
>>>> index 9704b0e1fd82..00123b0013d3 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>>> @@ -2287,6 +2287,47 @@ static int amdgpu_device_fw_loading(struct amdg=
pu_device *adev)
>>>>        return r;
>>>>    }
>>>>    +static int amdgpu_device_init_schedulers(struct amdgpu_device *ade=
v)
>>>> +{
>>>> +    long timeout;
>>>> +    int r, i;
>>>> +
>>>> +    for (i =3D 0; i < AMDGPU_MAX_RINGS; ++i) {
>>>> +        struct amdgpu_ring *ring =3D adev->rings[i];
>>>> +
>>>> +        /* No need to setup the GPU scheduler for rings that don't ne=
ed it */
>>>> +        if (!ring || ring->no_scheduler)
>>>> +            continue;
>>>> +
>>>> +        switch (ring->funcs->type) {
>>>> +        case AMDGPU_RING_TYPE_GFX:
>>>> +            timeout =3D adev->gfx_timeout;
>>>> +            break;
>>>> +        case AMDGPU_RING_TYPE_COMPUTE:
>>>> +            timeout =3D adev->compute_timeout;
>>>> +            break;
>>>> +        case AMDGPU_RING_TYPE_SDMA:
>>>> +            timeout =3D adev->sdma_timeout;
>>>> +            break;
>>>> +        default:
>>>> +            timeout =3D adev->video_timeout;
>>>> +            break;
>>>> +        }
>>>> +
>>>> +        r =3D drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>>>> +                   ring->num_hw_submission, amdgpu_job_hang_limit,
>>>> +                   timeout, adev->reset_domain.wq, ring->sched_score,=
 ring->name);
>>>> +        if (r) {
>>>> +            DRM_ERROR("Failed to create scheduler on ring %s.\n",
>>>> +                  ring->name);
>>>> +            return r;
>>>> +        }
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +
>>>>    /**
>>>>     * amdgpu_device_ip_init - run init for hardware IPs
>>>>     *
>>>> @@ -2419,6 +2460,10 @@ static int amdgpu_device_ip_init(struct amdgpu_=
device *adev)
>>>>            }
>>>>        }
>>>>    +    r =3D amdgpu_device_init_schedulers(adev);
>>>> +    if (r)
>>>> +        goto init_failed;
>>>> +
>>>>        /* Don't init kfd if whole hive need to be reset during init */
>>>>        if (!adev->gmc.xgmi.pending_reset)
>>>>            amdgpu_amdkfd_device_init(adev);
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_fence.c
>>>> index 45977a72b5dd..fa302540c69a 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> @@ -457,8 +457,6 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ri=
ng *ring,
>>>>                      atomic_t *sched_score)
>>>>    {
>>>>        struct amdgpu_device *adev =3D ring->adev;
>>>> -    long timeout;
>>>> -    int r;
>>>>          if (!adev)
>>>>            return -EINVAL;
>>>> @@ -478,36 +476,12 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_=
ring *ring,
>>>>        spin_lock_init(&ring->fence_drv.lock);
>>>>        ring->fence_drv.fences =3D kcalloc(num_hw_submission * 2, sizeo=
f(void *),
>>>>                         GFP_KERNEL);
>>>> -    if (!ring->fence_drv.fences)
>>>> -        return -ENOMEM;
>>>>    -    /* No need to setup the GPU scheduler for rings that don't nee=
d it */
>>>> -    if (ring->no_scheduler)
>>>> -        return 0;
>>>> +    ring->num_hw_submission =3D num_hw_submission;
>>>> +    ring->sched_score =3D sched_score;
>>> Let's move this into the caller and then use ring->num_hw_submission in=
 the fence code as well.
>>>
>>> The maximum number of jobs on the ring is not really fence specific.
>>>
>>> Regards,
>>> Christian.
>>>
>>>>    -    switch (ring->funcs->type) {
>>>> -    case AMDGPU_RING_TYPE_GFX:
>>>> -        timeout =3D adev->gfx_timeout;
>>>> -        break;
>>>> -    case AMDGPU_RING_TYPE_COMPUTE:
>>>> -        timeout =3D adev->compute_timeout;
>>>> -        break;
>>>> -    case AMDGPU_RING_TYPE_SDMA:
>>>> -        timeout =3D adev->sdma_timeout;
>>>> -        break;
>>>> -    default:
>>>> -        timeout =3D adev->video_timeout;
>>>> -        break;
>>>> -    }
>>>> -
>>>> -    r =3D drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>>>> -               num_hw_submission, amdgpu_job_hang_limit,
>>>> -               timeout, NULL, sched_score, ring->name);
>>>> -    if (r) {
>>>> -        DRM_ERROR("Failed to create scheduler on ring %s.\n",
>>>> -              ring->name);
>>>> -        return r;
>>>> -    }
>>>> +    if (!ring->fence_drv.fences)
>>>> +        return -ENOMEM;
>>>>          return 0;
>>>>    }
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_ring.h
>>>> index fae7d185ad0d..7f20ce73a243 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>>>> @@ -251,6 +251,8 @@ struct amdgpu_ring {
>>>>        bool            has_compute_vm_bug;
>>>>        bool            no_scheduler;
>>>>        int            hw_prio;
>>>> +    unsigned         num_hw_submission;
>>>> +    atomic_t        *sched_score;
>>>>    };
>>>>      #define amdgpu_ring_parse_cs(r, p, ib) ((r)->funcs->parse_cs((p),=
 (ib)))

--_000_BL1PR12MB514424A75728E78BC0E5B848F73D9BL1PR12MB5144namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#008000;margin:15pt;" al=
ign=3D"Left">
[Public]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
If it applies cleanly, feel free to drop it in.&nbsp; I'll drop those patch=
es for drm-next since they are already in drm-misc.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Andrey Grodzovsky &lt;andrey.=
grodzovsky@amd.com&gt;<br>
<b>Sent:</b> Thursday, February 24, 2022 11:24 AM<br>
<b>To:</b> Chen, JingWen &lt;JingWen.Chen2@amd.com&gt;; Christian K=F6nig &=
lt;ckoenig.leichtzumerken@gmail.com&gt;; dri-devel@lists.freedesktop.org &l=
t;dri-devel@lists.freedesktop.org&gt;; amd-gfx@lists.freedesktop.org &lt;am=
d-gfx@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Liu, Monk &lt;Monk.Liu@amd.com&gt;; Chen, Horace &lt;Horace.Chen=
@amd.com&gt;; Lazar, Lijo &lt;Lijo.Lazar@amd.com&gt;; Koenig, Christian &lt=
;Christian.Koenig@amd.com&gt;; daniel@ffwll.ch &lt;daniel@ffwll.ch&gt;<br>
<b>Subject:</b> Re: [RFC v4 02/11] drm/amdgpu: Move scheduler init to after=
 XGMI is ready</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">No because all the patch-set including this patch =
was landed into
<br>
drm-misc-next and will reach amd-staging-drm-next on the next upstream <br>
rebase i guess.<br>
<br>
Andrey<br>
<br>
On 2022-02-24 01:47, JingWen Chen wrote:<br>
&gt; Hi Andrey,<br>
&gt;<br>
&gt; Will you port this patch into amd-staging-drm-next?<br>
&gt;<br>
&gt; on 2/10/22 2:06 AM, Andrey Grodzovsky wrote:<br>
&gt;&gt; All comments are fixed and code pushed. Thanks for everyone<br>
&gt;&gt; who helped reviewing.<br>
&gt;&gt;<br>
&gt;&gt; Andrey<br>
&gt;&gt;<br>
&gt;&gt; On 2022-02-09 02:53, Christian K=F6nig wrote:<br>
&gt;&gt;&gt; Am 09.02.22 um 01:23 schrieb Andrey Grodzovsky:<br>
&gt;&gt;&gt;&gt; Before we initialize schedulers we must know which reset<b=
r>
&gt;&gt;&gt;&gt; domain are we in - for single device there iis a single<br=
>
&gt;&gt;&gt;&gt; domain per device and so single wq per device. For XGMI<br=
>
&gt;&gt;&gt;&gt; the reset domain spans the entire XGMI hive and so the<br>
&gt;&gt;&gt;&gt; reset wq is per hive.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Andrey Grodzovsky &lt;andrey.grodzovsky@amd=
.com&gt;<br>
&gt;&gt;&gt; One more comment below, with that fixed Reviewed-by: Christian=
 K=F6nig &lt;christian.koenig@amd.com&gt;.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | =
45 ++++++++++++++++++++++<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c&nbs=
p; | 34 ++--------------<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h&nbsp=
;&nbsp; |&nbsp; 2 +<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; 3 files changed, 51 insertions(+), 30 deletio=
ns(-)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/=
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt;&gt;&gt;&gt; index 9704b0e1fd82..00123b0013d3 100644<br>
&gt;&gt;&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt;&gt;&gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c<br>
&gt;&gt;&gt;&gt; @@ -2287,6 +2287,47 @@ static int amdgpu_device_fw_loading=
(struct amdgpu_device *adev)<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; }<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; +static int amdgpu_device_init_schedulers(str=
uct amdgpu_device *adev)<br>
&gt;&gt;&gt;&gt; +{<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp; long timeout;<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp; int r, i;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; AMDGPU_MAX_RINGS;=
 ++i) {<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_=
ring *ring =3D adev-&gt;rings[i];<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* No need to =
setup the GPU scheduler for rings that don't need it */<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ring || r=
ing-&gt;no_scheduler)<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; continue;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (ring-&=
gt;funcs-&gt;type) {<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_RI=
NG_TYPE_GFX:<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; timeout =3D adev-&gt;gfx_timeout;<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; break;<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_RI=
NG_TYPE_COMPUTE:<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; timeout =3D adev-&gt;compute_timeout;<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; break;<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case AMDGPU_RI=
NG_TYPE_SDMA:<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; timeout =3D adev-&gt;sdma_timeout;<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; break;<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; timeout =3D adev-&gt;video_timeout;<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; break;<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D drm_sche=
d_init(&amp;ring-&gt;sched, &amp;amdgpu_sched_ops,<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring-&gt;num_hw_submiss=
ion, amdgpu_job_hang_limit,<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timeout, adev-&gt;reset=
_domain.wq, ring-&gt;sched_score, ring-&gt;name);<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r) {<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; DRM_ERROR(&quot;Failed to create scheduler on ring %s.\n&quot;,<b=
r>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring-&gt;name);<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; return r;<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; /**<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp; * amdgpu_device_ip_init - run init for =
hardware IPs<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp; *<br>
&gt;&gt;&gt;&gt; @@ -2419,6 +2460,10 @@ static int amdgpu_device_ip_init(st=
ruct amdgpu_device *adev)<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; }<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; +&nbsp;&nbsp;&nbsp; r =3D amdgpu_device_init_=
schedulers(adev);<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp; if (r)<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto init_fail=
ed;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Don't init kfd if =
whole hive need to be reset during init */<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!adev-&gt;gmc.xgm=
i.pending_reset)<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; amdgpu_amdkfd_device_init(adev);<br>
&gt;&gt;&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/d=
rivers/gpu/drm/amd/amdgpu/amdgpu_fence.c<br>
&gt;&gt;&gt;&gt; index 45977a72b5dd..fa302540c69a 100644<br>
&gt;&gt;&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c<br>
&gt;&gt;&gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c<br>
&gt;&gt;&gt;&gt; @@ -457,8 +457,6 @@ int amdgpu_fence_driver_init_ring(stru=
ct amdgpu_ring *ring,<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; atomic_t *sc=
hed_score)<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; {<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device =
*adev =3D ring-&gt;adev;<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; long timeout;<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; int r;<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!adev)<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; return -EINVAL;<br>
&gt;&gt;&gt;&gt; @@ -478,36 +476,12 @@ int amdgpu_fence_driver_init_ring(st=
ruct amdgpu_ring *ring,<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_lock_init(&amp;r=
ing-&gt;fence_drv.lock);<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring-&gt;fence_drv.fe=
nces =3D kcalloc(num_hw_submission * 2, sizeof(void *),<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; GFP_KERNEL);<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; if (!ring-&gt;fence_drv.fences)<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOMEM=
;<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; -&nbsp;&nbsp;&nbsp; /* No need to setup the G=
PU scheduler for rings that don't need it */<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; if (ring-&gt;no_scheduler)<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp; ring-&gt;num_hw_submission =3D num_hw_=
submission;<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp; ring-&gt;sched_score =3D sched_score;<=
br>
&gt;&gt;&gt; Let's move this into the caller and then use ring-&gt;num_hw_s=
ubmission in the fence code as well.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The maximum number of jobs on the ring is not really fence spe=
cific.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt; Christian.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; -&nbsp;&nbsp;&nbsp; switch (ring-&gt;funcs-&g=
t;type) {<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; case AMDGPU_RING_TYPE_GFX:<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timeout =3D ad=
ev-&gt;gfx_timeout;<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; case AMDGPU_RING_TYPE_COMPUTE:<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timeout =3D ad=
ev-&gt;compute_timeout;<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; case AMDGPU_RING_TYPE_SDMA:<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timeout =3D ad=
ev-&gt;sdma_timeout;<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; default:<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timeout =3D ad=
ev-&gt;video_timeout;<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&gt;&gt; -<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; r =3D drm_sched_init(&amp;ring-&gt;sch=
ed, &amp;amdgpu_sched_ops,<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; num_hw_submission, amdgpu_job_hang_limit,<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; timeout, NULL, sched_score, ring-&gt;name);<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; if (r) {<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quo=
t;Failed to create scheduler on ring %s.\n&quot;,<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ring-&gt;name);<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&gt;&gt;&gt;&gt; -&nbsp;&nbsp;&nbsp; }<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp; if (!ring-&gt;fence_drv.fences)<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOMEM=
;<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; }<br>
&gt;&gt;&gt;&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/dr=
ivers/gpu/drm/amd/amdgpu/amdgpu_ring.h<br>
&gt;&gt;&gt;&gt; index fae7d185ad0d..7f20ce73a243 100644<br>
&gt;&gt;&gt;&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h<br>
&gt;&gt;&gt;&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h<br>
&gt;&gt;&gt;&gt; @@ -251,6 +251,8 @@ struct amdgpu_ring {<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; has_compute_vm_bug;<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; no_scheduler;<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hw_prio;<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp; unsigned&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; num_hw_submission;<br>
&gt;&gt;&gt;&gt; +&nbsp;&nbsp;&nbsp; atomic_t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; *sched_score;<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; };<br>
&gt;&gt;&gt;&gt;&nbsp; &nbsp; &nbsp; #define amdgpu_ring_parse_cs(r, p, ib)=
 ((r)-&gt;funcs-&gt;parse_cs((p), (ib)))<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BL1PR12MB514424A75728E78BC0E5B848F73D9BL1PR12MB5144namp_--
