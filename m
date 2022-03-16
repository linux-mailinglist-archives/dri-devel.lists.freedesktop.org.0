Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E68D4DAE72
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 11:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E64210E367;
	Wed, 16 Mar 2022 10:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090F689FA9;
 Wed, 16 Mar 2022 10:46:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=emRw7pb9mv7K79TPOEKHeyQzFXuQDYFSkOnBQeX0OeaCg6Fac+Agkq5oNDsh+5ioTo2/u5ldYu3KDOwjvJQw673C5s+FsfwRDEbrjo2oEeyVGCmIArXSYaRMqsP8JysAkHhjI7AxC/9XzMKTFzvndEi51g2i1/PCxiInlu3axbrGkA/vXvCMEitX+0x4zgG+GHtNTOqWNQece4JfMP8Ps3yPAPT6UbPSq6ic11scpwpTRCczxVufE4F9VpkfHSy37e17bMRLd8EppLoe75VyEfX+Gr5MyLCxi46krCA0g7NUpsbobpbcUE144l1dGzvQVbdB8wvLXFVwJU2NnBFfrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3+rBXlpWfms56lPTGofzVbkHFSeZQSqpBNqra+Qdlc=;
 b=gRs+HulYWVlM24soWqCJSfebPvGI6YipzOrlCfuxZ2XiIptf76qf6sJ5EcqWhOn1nBfgZP9zWaJNr3BCYj3HPoA/sqixeuzK7f1gemhJ5g/gVn9oFomhN+/a4vnschghbhwHwZgmuxQwRbdT1YZmIy2onuC+rgF6eIxjKq6pH56tCYEQX/lixnn7E1vyxxqpOwAsFcoZ+ergYuQCajRVxJ/E7+/k7kkC7rjbkkqIHoTNh/4HdwAr+qb2XX9WwxK5hSM4G+btN/n91xrA1JMpR00uK/shXXVLf0c2ZNUWUwOM9DWHZXVtR+OtnjaaVRduvt6W3weulRwfEQ+Pk3rgeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3+rBXlpWfms56lPTGofzVbkHFSeZQSqpBNqra+Qdlc=;
 b=aAD1LSFqy3ssU0x6ne/D1tK2z7FrdrSaQ7FRtZQCKys7Q7G/XeuBBWRpLAgGw7W7vCO1LB1D1xYH9dyKIxrxzDIPF5GWNkmYms7ZxdhgBEDXEbuAVxMwVg+f8picVwAW7tKybXGhj6hQbm4nKRhh5yOYdcSOtEIu293wr4plnSM=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by BN8PR12MB3105.namprd12.prod.outlook.com (2603:10b6:408:67::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Wed, 16 Mar
 2022 10:46:12 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::ed3a:f7e5:cbdf:720f]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::ed3a:f7e5:cbdf:720f%3]) with mapi id 15.20.5081.014; Wed, 16 Mar 2022
 10:46:11 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>
Subject: RE: [PATCH] WIP: drm/dp_mst: Add support for dumping topology ref
 histories from debugfs
Thread-Topic: [PATCH] WIP: drm/dp_mst: Add support for dumping topology ref
 histories from debugfs
Thread-Index: AQHX0D+AE15V0cuVgkqFgVkq+XJhhqwbv0zAgAwd2gCAAEwcgIASwW2ggCVww4CACbQzgIAJv2yQgA1ywICAIuyLMIABQxUAgATGo4CAAcvdAIAJb+bAgAyKrgCAAKMZMA==
Date: Wed, 16 Mar 2022 10:46:11 +0000
Message-ID: <CO6PR12MB54895A5B1E30DC619B95C7ABFC119@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20211102231502.286654-1-lyude@redhat.com>
 <CO6PR12MB54896F2BBF20F6C04D187D1AFC679@CO6PR12MB5489.namprd12.prod.outlook.com>
 <37497a7c6ce031bf4c99decdd4eecfacf95969b5.camel@redhat.com>
 <CO6PR12MB5489E282DA251241843EF4E4FC6F9@CO6PR12MB5489.namprd12.prod.outlook.com>
 <CO6PR12MB5489D4C51655B1D8B817A50FFC7B9@CO6PR12MB5489.namprd12.prod.outlook.com>
 <4074c2ad21ebe692022d4e097209910e9f32383e.camel@redhat.com>
 <4516b3a53a7d673ff451ca4c7542b40f4e10713a.camel@redhat.com>
 <CO6PR12MB54899D612BCEB3D485367045FC5F9@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ad5c80b1f9bd0087b87903b0156bdfa80b8043ca.camel@redhat.com>
 <CO6PR12MB5489AA5549DC251E202BD58AFC3E9@CO6PR12MB5489.namprd12.prod.outlook.com>
 <660715cddbf8284531972c77ee16570ea6d66267.camel@redhat.com>
 <55113c2ddb041bf73b9363df94cca9544aa7f9bb.camel@redhat.com>
 <4607907a7cf6937b2c2fee1b7c0ce077e8f3d10c.camel@redhat.com>
 <CO6PR12MB54892DC34D5D2FA0886657BFFC099@CO6PR12MB5489.namprd12.prod.outlook.com>
 <c0e30cebdf986ff3a70a9941148002bd32f26fe2.camel@redhat.com>
In-Reply-To: <c0e30cebdf986ff3a70a9941148002bd32f26fe2.camel@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=3d1239da-d052-4397-b8cf-af054014ea43;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-03-16T10:32:06Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87265d47-a822-4e6a-ffe7-08da073a2fcd
x-ms-traffictypediagnostic: BN8PR12MB3105:EE_
x-microsoft-antispam-prvs: <BN8PR12MB31058E689BB51A7930CDC18AFC119@BN8PR12MB3105.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Nl7m34SZ8zPOftIqHWhAJSKqkQhYE5D+oSJT1NuWrMqh0P/eHLlkWhSBYuz7hLQvrR7p7rsVnGDyw7zmu7gRWKxghEYoiJKhcgTforxs7viu96xy8Sy2i+veMrsmU+gLiRA1dZACvU6nzwQIVD+vdJTq/fch3v8Ik8IVIBhD8ni048JttXNpuxELCa8U0HXzJGzkOFvzRIc8iaaZgevP7pE+VoaZS+nn9sTxn919Jqu4C3u8jFkwvp9f0EV5MZuvILidl1C5XFa6Z64bWE5kZ2U9iqRx9vkqYCT8QhF9evb9nAOA314weCsF77ANqWQavozLc3G0TjjxDH08siWa9c95veh8C1vj1oyz5icCBXxdJbtEyyeMuAJevJOTQaa3RiPtU+ymyiqxTxSCOwd1pPzKYohrNbslxOSYWjNdycbbJ2v1f0IuOvXPxYrzzVNtxwASFnt6uGuj6H7nNYMiy8uHIpNVABi7cJ2i/QS9lPYHGsiU26cOnVtk8daukJFeCDsVn10t0aP9oRDxgBXpewkQOLTiOy2prY5oi1LsV1uiv3XZayL+jhEHfd8GYphSuWbLQi/1uOREZeSFU7rKL/IaIYZnI9CTSS5RTK/Q/yxnRTmc+yJpl8uvE5dNmfE0TkiEMmHAEV9kUolaxonb9sOJGgz9HwkoulGX7bFVBos+EDPJGoso2SKYOMh/SyMqUWQjtOBd1Bs5IeeA0uqtdaTSYHqLj7LvnQcrYCplhW8ad6RbEzUHAQsMCkh76wqBaMDtRcKyvaDa3boLpfV2D76CY/vGfOLoTcqvz9nu0yGT1APlIuYWxLFiEu3LF6QKY/GEHMSEeBJ79kU8DavYtg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(2906002)(33656002)(45080400002)(19627235002)(83380400001)(9686003)(7696005)(6506007)(508600001)(966005)(71200400001)(53546011)(5660300002)(26005)(66946007)(4326008)(86362001)(30864003)(52536014)(122000001)(186003)(4001150100001)(8676002)(38100700002)(55016003)(54906003)(6916009)(316002)(76116006)(66446008)(66476007)(64756008)(8936002)(66556008)(559001)(579004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Ng2z3Ib4Jb/QTwbeLxAslG6jfj5cJUjBZUwCy7tfTSPAssaj7exgL8c2ZQ?=
 =?iso-8859-1?Q?peLsTm6vW8uuvON0g5wNLEo5BW35Em+DkSNjX/bTQaeu84zu4OnzxL6Ft3?=
 =?iso-8859-1?Q?jhDnSIfxGDipj8TkSKi1bAzHgtW1TXDGoMlzog4Up7AMb4UeuxQz8LF/tA?=
 =?iso-8859-1?Q?NStoPa4xiCeiyasy1yaBfUJitCINP0yGes3ub4fV1Kj0CRB+UYMo3//wWT?=
 =?iso-8859-1?Q?PybXYlFeaUxpJhWHHe67E9l7E/r0uO83Dn6th+sLiNrPuE5wE+pe/6Zfjx?=
 =?iso-8859-1?Q?lUYIIjEMIAgDyBn/GMWoJJ1dMMUcwP3OmRj5LXr1VqcotzJbm3FOuz80sa?=
 =?iso-8859-1?Q?0P9Ttz/O9gR9dM9yFps0F7ZVZr86/wdTl1uHUCvwQHAGw4HtCYAWzS1JCh?=
 =?iso-8859-1?Q?iGgvy5CjQ4zAMVUMjK0e72Hlmb1MlgYsVbZQpCYWTwRnEJRNb4D/G6QS63?=
 =?iso-8859-1?Q?lUamfG1J0gKY7FbRgNL4VWDzzBpB8PEaJfaVFI69ZVVB/kYg0TP4Mq0599?=
 =?iso-8859-1?Q?DMO9aWw+rih0luRT0SlsMGZCoyaDj45P1yXtuR7RE4thUmzTZWK7WhroB0?=
 =?iso-8859-1?Q?UhINd0c+IOUxCB20DmHyV++ufonrsMvycuvZzvOpV6kMbq8+ZZquBptYrC?=
 =?iso-8859-1?Q?0u0BMCnHYqbpjWHgY9uFWHPFL54kctym5P4SRktsh+FldLGW+18kdVPH3W?=
 =?iso-8859-1?Q?UA7ti0Fp/wjQs1I5LkqCuftTFT+E++Fq9PouMSb02mkibWLa5VkIIC0EXt?=
 =?iso-8859-1?Q?JEIHxcX5RkOwp+ETpy9+Bx/bz4leDaKQ2rKT1PlGZ3vmiQfX4ceS45rBQW?=
 =?iso-8859-1?Q?/rEoIkm9Jj/89zvIb/15+s6I9ji/7+wfowElph9WBwQ2fvD2AfohyUrSub?=
 =?iso-8859-1?Q?gYBF4XqqLAV9pppaV3ixWEuGG7kuu5BfsVL++BRmClDxvtIkAhKXZMqSh1?=
 =?iso-8859-1?Q?Am0nra8KSGG/CkVgbtH6KIKzTARwnHtyXbCmWJpSlArkifhTZ5hVCDSuh8?=
 =?iso-8859-1?Q?vI10I4Vl+F4bDIUakXFsWaKOOLAONpiGhxg/5doxICd6/Qt/mH38s7depu?=
 =?iso-8859-1?Q?MFL6KKYZrpYbPtx5R4uThZ3mNnqeoxxyL/dcyyJHDAhwrhpaxteAIpqxhp?=
 =?iso-8859-1?Q?10lJhPHVK7mvXneIVKzHuZEIXETDZsjIVFRpl/Jg6OTyh/Pyht8PioZiQp?=
 =?iso-8859-1?Q?sLjiNvGgMLU9YC/YjSoWZwwDHGOzIuHsuIEPCSDFx0rvUaGv1nBabBU3tt?=
 =?iso-8859-1?Q?6zVuFuI8WcOodZ959Eys5t2XaPa5z0Zwc1ai8CJUyDPdallJpuhj0HhB5C?=
 =?iso-8859-1?Q?hp/QP3W5q/kVo2PPbunIn+SY9t57/tDl+0ncYmwHK+9EE+eoxP4ni6vO1s?=
 =?iso-8859-1?Q?MsDYX2+x32ifAXiXTDttX832H9uoupNZhucDyAHeCXVZ+qK/SOW9dZV4Rr?=
 =?iso-8859-1?Q?0Vnx6pDIvbLEPvGp5nM5m6fpgO7B8qGUXBqXqqpxS4LFL/Eq+tNL9wZYYo?=
 =?iso-8859-1?Q?g=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87265d47-a822-4e6a-ffe7-08da073a2fcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 10:46:11.3030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 599+t9i5y6NqHLwxYc9FwRXTZawJUbg8OL/wdMrGW7OCu17Zf2nB99MqJgc9HBI9uq5FTImxqAjMrYJrRCg7Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3105
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

> -----Original Message-----
> From: Lyude Paul <lyude@redhat.com>
> Sent: Wednesday, March 16, 2022 8:48 AM
> To: Lin, Wayne <Wayne.Lin@amd.com>
> Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Subject: Re: [PATCH] WIP: drm/dp_mst: Add support for dumping topology re=
f histories from debugfs
>
> (Adding this back to the dri-devel mailing list since I didn't notice it =
got
> dropped from there)
>
> Hm, some comments on this issue down below. Sorry for the delayed respons=
e, I
> was going to try this right after I finished the MST legacy removal but t=
hat's
> ending up taking longer than I hoped.
>
> On Tue, 2022-03-08 at 01:46 +0000, Lin, Wayne wrote:
> > [AMD Official Use Only]
> >
> > Oops...
> > I didn't notice that I replied to wrong mail previously : P
> > Sorry for the confusion and reply to the correct thread.
> >
> > Good day!
> > I probably know why you can't reproduce the issue there. Please refer t=
o the
> > attached
> > patch file which makes me easier to explain this.
> >
> > In dm_dp_mst_get_modes(), we will create a new dc_sink by calling
> > dc_link_add_remote_sink() and add that dc_sink into the array dc_link-
> > >remote_sinks[].
> > However, if we find that aconnector->dc_sink is not null, then we won't
> > create a new
> > dc_sink for that aconnector and won't add the sink to the array dc_link=
-
> > >remote_sinks[].
> >
> > When the issue that I mentioned before occurs, we won't be able to rele=
ase
> > the dc_sink
> > for the aconnector when we unplug the sst monitor. Hence, we can't crea=
te
> > new dc_sink
> > for the latter on connected new stream sink of that port. Which leads t=
o two
> > issues
> > 1. Unplug monitor and plug in another monitor "to the same port"
> > =3D>  Since we use the same dc_sink to reflect the capability of the ne=
w
> > connected stream
> > sink, we might send out inappropriate stream to the new connected sink.
> > 2. Because we can't release dc_sink in the array dc_link->remote_sinks[=
],
> > when we
> > plug/unplug sst monitor to more than 4 different mst port, we will brea=
k the
> > criteria
> > "dc_link->sink_count >=3D MAX_SINKS_PER_LINK" in
> > link_add_remote_sink_helper().
>
> Ok, a lot of this seems to be happening in amdgpu which certainly explain=
s why
> I had so much trouble following along with this originally (also, having
> learned a bit more about how DC works definitely has helped a bit). I alr=
eady
> see a bunch of issues though with how this code is structured that would
> definitely break things, though note I haven't sat down and tried this on=
 a
> real machine yet - will try tomorrow.
>
> So - it seems like dc_sink =3D=3D a bunch of hotplugging state for a dm c=
onnector,
> which actually tells me for one that this is definitely the wrong spot fo=
r
> this code. get_modes() really should just handle filling out DRM modes an=
d
> pretty much nothing else, because callers from DRM aren't going to expect
> side-effects like this when get_modes() is called - which could potential=
ly
> lead to all sorts of weirdness down the line if the DRM call paths that u=
se
> this ever change. i915 and nouveau have good examples of what these funct=
ions
> should typically look like, and amdgpu actually seems to mostly follow th=
is
> advice for it's other get_modes() callback.
>
> Note there's also another problem here: the assumption "no EDID =3D=3D
> disconnected" isn't correct. It's totally possible to run into EDID-less
> displays if the display is some ancient pre-historic relic, or if the ROM=
 (or
> EEPROM? can't remember what type of chip computer displays tend to use...=
) chip
> in the monitor containing the EDID has died. Note that the second situati=
on is
> suprisingly more common then one might think! I ran into a 140Hz 4k ASUS
> display where this happened, and I know another friend of mine who had th=
e ROM
> in their display die randomly as well.
>
> So with this being said: I, think the solution here is actually just to
> add/remove dc_sink from dm_dp_mst_detect() based on the CSN, and drop the
> calls from get_modes()? detect() should always be called before the conne=
ctor
> has been removed, and we could use the return status from
> drm_dp_mst_detect_port() in order to tell whether or not we should add/re=
move
> the dc_sink.

Thank you Lyude for guiding me through! After your elaboration, I think I r=
oughly
know the idea from drm perspective now. Let me get through this and will ge=
t back
to you.

>
> If you don't get to it first tomorrow, I'll see if I can reproduce this
> locally and try writing up a patch.
>
> Also a final note: I don't think it's a good idea in general for there to=
 be a
> fixed size array of dc_sinks like this. Those probably should just be sto=
red
> somehow on a per-connector basis. I say this because in addition to the f=
act

Understand and agree with that. I plan to remove the constraint as well. Th=
anks!

> MST connectors aren't destroyed immediately (which could lead to a situat=
ion
> where we have more then 6 connected MST ports briefly before their destru=
ctors
> run, e.g. during suspend/resume reprobing).
>
> Also, one question below:
> >
> > Anyway, these are my steps to reproduce the issue.
> > I use a startech mst 1to4 mst hub, a sst monitor and a mst monitor.
> >
> > 1. boot up with sst monitor connected to the hub and plug the hub to th=
e
> > system.
> > 2. unplug/plug sst monitor to all left three different DP output ports.
> > Which is used to
> > Pollute all four aconnectors to have them keep the stale dc_sinks.
> > 3. plug in the mst monitor to arbitrary ports. Since the new connected =
mst
> > monitor will
> > have us add new mst port to the topology and attach a new aconnector fo=
r
> > that mst port,
> > we'll try to create a new dc_sink to that new aconnector and break the
> > sink_count
> > limitation. As you can see in the log the error message : "*ERROR* Unab=
le to
> > add a
> > remote sink"
> >
> > (Note that different hub might influence the result. Some hubs will pul=
l
> > down the HPD
> > when there is no monitor connected to its downstream ports which will r=
un
> > into different
> > code flow)
>
> by "pull down" I assume you mean doing a long HPD instead of short (or vi=
ce
> versa?).

Yes, long HPD!

Thanks for your help Lyude!
>
> >
> > I also attach the dmesg log under different debug level (0x104 & 0x116)=
 for
> > your reference.
> >
> > Please let me know if you can reproduce then : )
> >
> > Sorry about that Lyude and hope this time I send to the right thread..
> > Really appreciate for your help!!!
> >
> > Regards,
> > Wayne
> > > -----Original Message-----
> > > From: Lyude Paul <lyude@redhat.com>
> > > Sent: Wednesday, March 2, 2022 9:10 AM
> > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > Subject: Re: [PATCH] WIP: drm/dp_mst: Add support for dumping topolog=
y ref
> > > histories from debugfs
> > >
> > > Ran into some issues with my system yesterday (hooray being the first=
 to
> > > find
> > > a rather annoying zsh bug that broke my scripts!), but I've finally g=
ot
> > > things
> > > setup. I'm not able to reproduce this issue though (I've tried hotplu=
gging
> > > the
> > > way you mentioned here, but nothing seems to leak), which makes me th=
ink
> > > there's something special in your setup we might not have noticed.
> > >
> > > Do you think you could get some drm logs with drm.debug=3D0x116
> > > log_buf_len=3D50M
> > > from when this happens so I can get a better idea of the drm events
> > > leading up
> > > to this? Also, if you've been testing this in a GUI could you confirm
> > > whether
> > > this happens when you're just in a plain old VT?
> > >
> > > On Mon, 2022-02-28 at 16:43 -0500, Lyude Paul wrote:
> > > > Alright - starting to look into this now and setting up a system to=
 try
> > > > reproducing this, will let you know as soon as I've got results. So=
rry
> > > > again
> > > > about all of the delays
> > > >
> > > > On Fri, 2022-02-25 at 15:47 -0500, Lyude Paul wrote:
> > > > > I didn't get a chance yet, but I've gotten through most of my bac=
klog
> > > > > now.
> > > > > Sorry about the delay - I've been catching up since I had to take=
 two
> > > > > weeks
> > > > > off work very unexpectedly. I'll put aside time to look at this f=
irst
> > > > > thing
> > > > > monday.
> > > > >
> > > > > On Fri, 2022-02-25 at 01:33 +0000, Lin, Wayne wrote:
> > > > > > [AMD Official Use Only]
> > > > > >
> > > > > > Hi Lyude,
> > > > > >
> > > > > > Good day!
> > > > > > Sorry to bother you, but would like to know if you can reproduc=
e the
> > > > > > issue?
> > > > > >
> > > > > > Thanks!
> > > > > >
> > > > > > Regards,
> > > > > > Wayne
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Lyude Paul <lyude@redhat.com>
> > > > > > > Sent: Thursday, February 3, 2022 4:12 AM
> > > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > > Subject: Re: [PATCH] WIP: drm/dp_mst: Add support for dumping
> > > > > > > topology
> > > > > > > ref
> > > > > > > histories from debugfs
> > > > > > >
> > > > > > > JFYI I should be able to respond to this soon, I think I'm
> > > > > > > following
> > > > > > > your
> > > > > > > issue a bit more (haven't gotten to go through the patches to=
o so
> > > > > > > I'm
> > > > > > > probably
> > > > > > > going to see if I can reproduce it locally as well. Sorry for=
 the
> > > > > > > delay
> > > > > > > -
> > > > > > > dealing with some X.org stuff and work issues at the moment
> > > > > > >
> > > > > > > On Tue, 2022-01-25 at 08:32 +0000, Lin, Wayne wrote:
> > > > > > > > [Public]
> > > > > > > >
> > > > > > > > Hey Lyude,
> > > > > > > >
> > > > > > > > Sorry, just got chance to get back to this and BIG THANKS t=
o
> > > > > > > > elaborating
> > > > > > > > in
> > > > > > > > such details!
> > > > > > > > Following are some of my comments : )
> > > > > > > >
> > > > > > > > > -----Original Message-----
> > > > > > > > > From: Lyude Paul <lyude@redhat.com>
> > > > > > > > > Sent: Wednesday, January 19, 2022 9:59 AM
> > > > > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > > > > Subject: Re: [PATCH] WIP: drm/dp_mst: Add support for dum=
ping
> > > > > > > > > topology
> > > > > > > > > ref
> > > > > > > > > histories from debugfs
> > > > > > > > >
> > > > > > > > > Hey - so, the original issue here was that payloads were =
not
> > > > > > > > > always
> > > > > > > > > deleted when we expected them to be - correct?
> > > > > > > >
> > > > > > > > Actually, what I was trying to do is not relevant to payloa=
d
> > > > > > > > maintenance.
> > > > > > > > What I wanted to do is having a way to notify
> > > > > > > > amdgpu to release its enumerated resource "dc_sink" when un=
plug
> > > > > > > > event
> > > > > > > > occurs. Currently, under specific scenarios,
> > > > > > > > we can't release remote "dc_sink" and ends up can't allocat=
e
> > > > > > > > resource
> > > > > > > > for
> > > > > > > > new connected monitors. I'll explain the scenario
> > > > > > > > underneath.
> > > > > > > >
> > > > > > > > So, get back to the main issue that I was trying to solve w=
hen I
> > > > > > > > pushed
> > > > > > > > the
> > > > > > > > patchset:
> > > > > > > >
> > >
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
work.kernel.org%2Fproject%2Fdri&amp;data=3D04%7C01%7Cw
> ayne.lin%40amd.com%7Cd77e829cfd3a466e25e508da06e6a9dd%7C3dd8961fe4884e608=
e11a82d994e183d%7C0%7C0%7C637829885024
> 474689%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sda
> ta=3DMvKilTT1CkBqZVK1N24JyNPjiPYORV%2FsCwvEzwx%2FIAk%3D&amp;reserved=3D0
> > > ayne.lin%40amd.com%7Cbbc27043edc04bf8067c08d9fbe9620c%7C3dd8961fe4884=
e608e
> > > 11a82d994e183d%7C0%7C0%7C6378178020798
> > > 98960%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6
> > > Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdat
> > > a=3DRVUc8KgTO3mhFL9qemshHJqiyXJs%2Fvytx21AMyUaW%2Bs%3D&amp;reserved=
=3D0
> > > > > > > > -
> > > > > > > devel%2Fcover%2F20210720160342.11415-1-
> > > > > > > Wayne.Lin%40amd.com%2F&amp;data=3D04%7C01%7Cwayne.lin%40amd.c=
om%7C2e
> > > > > > > 19d9
> > > > > > > 32
> > > > > > > 1b
> > > > > > > 5f4e948c1208d9e6884f24%7C3dd8961fe488
> > > > > > > 4e608e11a82d994e183d%7C0%7C0%7C637794295422403301%7CUnknown%7=
CTWFp
> > > > > > > bGZs
> > > > > > > b3
> > > > > > > d8
> > > > > > > eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL
> > > > > > > CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DrvtwQioO3pT1=
BoHb7S5
> > > > > > > 32ms
> > > > > > > Ra
> > > > > > > 61
> > > > > > > gP1vIyE8AB7M9I4E%3D&amp;reserved=3D0
> > > > > > > >
> > > > > > > > I was trying to fix some problems that I observed after the=
se 2
> > > > > > > > patches
> > > > > > > > * 09b974e8983 drm/amd/amdgpu_dm/mst: Remove -
> > > > > > > > >destroy_connector()
> > > > > > > > callback
> > > > > > > > * 72dc0f51591 drm/dp_mst: Remove
> > > > > > > > drm_dp_mst_topology_cbs.destroy_connector
> > > > > > > >
> > > > > > > > With above patches, it changes our flow to remove dc_sink (=
by
> > > > > > > > calling
> > > > > > > > dc_link_remote_sink()) when connector is about to be
> > > > > > > > destroyed. And let's see below use cases:
> > > > > > > > a). Disconnection happens between mst branch devices
> > > > > > > > e.g.
> > > > > > > > src - 1st_mstb - 2nd_mstb - sst_monitor =3D> src - 1st_mstb
> > > > > > > > (disconnect)
> > > > > > > > 2nd_mstb - sst_monitor
> > > > > > > >
> > > > > > > > In above case, after receiving CSN, we will put topology
> > > > > > > > reference
> > > > > > > > count
> > > > > > > > of
> > > > > > > > 2nd mstb and its port which connected to the sst monitor.
> > > > > > > > As you suggested before, we will destroy 2nd mst branch dev=
ice
> > > > > > > > and
> > > > > > > > its
> > > > > > > > all
> > > > > > > > ports due to there is no more mst path can route to them.
> > > > > > > > As the result of that, we at end call
> > > > > > > > drm_dp_delayed_destroy_port()
> > > > > > > > and
> > > > > > > > unregister/put the drm connector and eventually call
> > > > > > > >  dc_link_remote_sink() to release the dc_sinck we enumerate=
 for
> > > > > > > > the
> > > > > > > > specific
> > > > > > > > stream sink of sst_monitor.
> > > > > > > >
> > > > > > > > However, in below case:
> > > > > > > > b). Disconnection happens between mst branch devices and SS=
T
> > > > > > > > monitor
> > > > > > > > e.g.
> > > > > > > > src - 1st_mstb - sst_monitor =3D> src - 1st_mstb (disconnec=
t)
> > > > > > > > sst_monitor
> > > > > > > >
> > > > > > > > In this case, which is the case having problem, it definite=
ly
> > > > > > > > won't
> > > > > > > > decrease
> > > > > > > > the topology references count of the port of 1st_mstb which
> > > > > > > > was connected to the sst monitor to zero since the port is =
still
> > > > > > > > existing in
> > > > > > > > the topology. Same as the malloc reference since the port c=
an't
> > > > > > > > get
> > > > > > > > destroyed. Hence, the port still exists and we won't call
> > > > > > > > drm_dp_delayed_destroy_port() to unregister and put the drm
> > > > > > > > connector.
> > > > > > > > As
> > > > > > > > the
> > > > > > > > result of that, we can't release corresponding remote dc_si=
nk
> > > > > > > > under
> > > > > > > > this
> > > > > > > > case. And after few times hotplugs, we can't create any new
> > > > > > > > dc_sink since the number of stream sink is exceeding our
> > > > > > > > limitation.
> > > > > > > >
> > > > > > > > Hence, what I'm thinking here is to register a callback fun=
ction
> > > > > > > > for
> > > > > > > > notifying us that the remote sink is detached. This just al=
igns
> > > > > > > > what
> > > > > > > > we
> > > > > > > > do
> > > > > > > > for handling long HPD event (unplug monitor from system) of
> > > > > > > > legacy
> > > > > > > > DP
> > > > > > > > (none
> > > > > > > > mst). For which case, once we detect long HPD event
> > > > > > > > indicating the monitor is detached, we will immediately try=
 to
> > > > > > > > release
> > > > > > > > the
> > > > > > > > dc_link->local_sink and fire hotplug event to upper layer.
> > > > > > > > Same as here, once receives a CSN message notifying a drm
> > > > > > > > connector
> > > > > > > > is
> > > > > > > > changed from connected to disconnected, trigger the callbac=
k
> > > > > > > > function and we can try to release the dc_sink resource.
> > > > > > > >
> > > > > > > > >
> > > > > > > > > If I'm remembering that correctly, then (and I'm not 100%=
 sure
> > > > > > > > > on
> > > > > > > > > this
> > > > > > > > > yet) I might already have noticed something very possibly
> > > > > > > > > wonky in
> > > > > > > > > how we handle payload allocations currently, that I found
> > > > > > > > > while
> > > > > > > > > working on
> > > > > > > > > the non-atomic removal branch that I linked to you in my
> > > > > > > > > previous response. Basically, in the
> > > > > > > > > step1() function it looks like that we follow this genera=
l
> > > > > > > > > flow
> > > > > > > > > with
> > > > > > > > > updating
> > > > > > > > > payloads:
> > > > > > > > >
> > > > > > > > >  * Loop through proposed payloads and compare to previous=
ly
> > > > > > > > > programmed
> > > > > > > > >    payloads
> > > > > > > > >     - If a payload has a different allocation then it
> > > > > > > > > previously
> > > > > > > > > did,
> > > > > > > > > update the
> > > > > > > > >       payload
> > > > > > > > >     - If the payload is new, create it
> > > > > > > > >     - If a payload no longer has an allocation, remove th=
e
> > > > > > > > > payload
> > > > > > > > >
> > > > > > > > > At first glance this seems totally correct - but I'm not
> > > > > > > > > actually
> > > > > > > > > entirely
> > > > > > > > > convinced it is? Particularly because it seems like the o=
rder
> > > > > > > > > in
> > > > > > > > > which
> > > > > > > > > we do creation/deletion of payloads is totally arbitrary.=
 To
> > > > > > > > > explain
> > > > > > > > > what
> > > > > > > > > I mean by that, consider a state transition like this:
> > > > > > > > >
> > > > > > > > > vcpi_slots=3D15 vcpi_slots=3D35 vcpi_slots=3D14
> > > > > > > > > > 1 | 2 |xxxxxxxx|
> > > > > > > > >
> > > > > > > > > Let's say we want to increase payload #1 from 15 to 50, a=
nd
> > > > > > > > > disable
> > > > > > > > > payload #2 in the same atomic commit on DRM's side. If th=
e
> > > > > > > > > order
> > > > > > > > > we
> > > > > > > > > update payloads is entirely arbitrary, we could end up do=
ing
> > > > > > > > > this:
> > > > > > > > >
> > > > > > > > >  * Increase VCPI slots payload #1 from 15->50 (total VCPI
> > > > > > > > > slots=3D99,
> > > > > > > > > overflow!)
> > > > > > > > >  * Decrease VCPI slots payload #2 from 35->0  (total VCPI
> > > > > > > > > slots=3D50)
> > > > > > > > >
> > > > > > > > > Notice on the first step, we've technically overflowed th=
e
> > > > > > > > > available
> > > > > > > > > number of VCPI slots in the payload table. This is still
> > > > > > > > > before
> > > > > > > > > step
> > > > > > > > > 2
> > > > > > > > > though, and I could be totally wrong here - perhaps this =
is
> > > > > > > > > entirely
> > > > > > > > > OK in
> > > > > > > > > the real world, and we're allowed to overflow VC slots as=
 long
> > > > > > > > > as
> > > > > > > >
> > > > > > > > I think it's forbidden to allocate time slots beyond 64 whe=
n
> > > > > > > > we're
> > > > > > > > updating
> > > > > > > > payload ID table of the branch in the real world. Branch
> > > > > > > > probably
> > > > > > > > will NACK the DPCD write.
> > > > > > > >
> > > > > > > > > we repair the issue before step 2. But so far I can't see=
m to
> > > > > > > > > find
> > > > > > > > > anything in the DP 2.0 spec that explicitly states this w=
ould
> > > > > > > > > be
> > > > > > > > > OK
> > > > > > > > > -
> > > > > > > > > which
> > > > > > > > > makes me think we might fail some payload allocations if =
we
> > > > > > > > > don't
> > > > > > > > > always
> > > > > > > > > ensure we avoid overflows in between VC payload table cha=
nges
> > > > > > > >
> > > > > > > > Agree.
> > > > > > > > For amdgpu, I think we always do deallocation (call hws-
> > > > > > > > > funcs.reset_hw_ctx_wrap()) before allocation
> > > > > > > > (apply_single_controller_ctx_to_hw()).
> > > > > > > >
> > > > > > > > > Note that avoiding overflows would be as simple as just m=
aking
> > > > > > > > > sure
> > > > > > > > > we
> > > > > > > > > send all VC payload table changes that free VC slots befo=
re
> > > > > > > > > sending
> > > > > > > > > any that take new slots.
> > > > > > > > >
> > > > > > > > > Again - I haven't actually confirmed this yet and am hopi=
ng to
> > > > > > > > > test
> > > > > > > > > stuff
> > > > > > > > > like this very soon as I'm pretty close finishing up the
> > > > > > > > > initial
> > > > > > > > > attempt
> > > > > > > > > at removing the non-atomic MST code in the DRM helpers no=
w. If
> > > > > > > > > my
> > > > > > > > > theory
> > > > > > > > > ends up being correct here, I can fix this in my rewrite =
of
> > > > > > > > > the
> > > > > > > > > MST payload management code. But I figured it might be wo=
rth
> > > > > > > > > mentioning in
> > > > > > > > > the mean time in case you think it might be relevant to t=
he
> > > > > > > > > problem here :).
> > > > > > > > >
> > > > > > > > > On Wed, 2022-01-12 at 16:47 -0500, Lyude Paul wrote:
> > > > > > > > > > (CC'ing this to dri-devel, since this is basically patc=
h
> > > > > > > > > > review)
> > > > > > > > > >
> > > > > > > > > > Alright - so first off sorry about the broken debugging
> > > > > > > > > > patch! I
> > > > > > > > > > thought I had tested that but I guess I hadn't tested i=
t
> > > > > > > > > > well
> > > > > > > > > > enough,
> > > > > > > > > > I'll get it fixed asap, but feel free to try getting to=
 it
> > > > > > > > > > before
> > > > > > > > > > I
> > > > > > > > > > do.
> > > > > > > > > >
> > > > > > > > > > As for this patch... (comments below)
> > > > > > > > > >
> > > > > > > > > > On Mon, 2021-12-20 at 02:17 +0000, Lin, Wayne wrote:
> > > > > > > > > > > [AMD Official Use Only]
> > > > > > > > > > >
> > > > > > > > > > > Hi Lyude,
> > > > > > > > > > >
> > > > > > > > > > > No rush and thanks for your time! : ) Just want to he=
lp
> > > > > > > > > > > clarify
> > > > > > > > > > > what
> > > > > > > > > > > I mean that "registering a callback function"
> > > > > > > > > > > for CSN of disconnecting
> > > > > > > > > > > stream sink device (not mst branch case). Attach belo=
w the
> > > > > > > > > > > tentative
> > > > > > > > > > > patch that I planned to do. Thanks so much!
> > > > > > > > > > >
> > > > > > > > > > > Regards,
> > > > > > > > > > > Wayne
> > > > > > > > > > > ---
> > > > > > > > > > >  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 53
> > > > > > > > > > > +++++++++++++++++++
> > > > > > > > > > >  drivers/gpu/drm/drm_dp_mst_topology.c         | 16 +=
++++-
> > > > > > > > > > >  include/drm/drm_dp_mst_helper.h               |  1 +
> > > > > > > > > > >  3 files changed, 68 insertions(+), 2 deletions(-)
> > > > > > > > > > >
> > > > > > > > > > > diff --git
> > > > > > > > > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst=
_type
> > > > > > > > > > > s.c
> > > > > > > > > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst=
_type
> > > > > > > > > > > s.c
> > > > > > > > > > > index cc34a35d0bcb..d7343c64908c 100644
> > > > > > > > > > > ---
> > > > > > > > > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst=
_type
> > > > > > > > > > > s.c
> > > > > > > > > > > +++
> > > > > > > > > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst=
_type
> > > > > > > > > > > s.c
> > > > > > > > > > > @@ -472,8 +472,61 @@ dm_dp_add_mst_connector(struct
> > > > > > > > > > > drm_dp_mst_topology_mgr *mgr,
> > > > > > > > > > >         return connector;
> > > > > > > > > > >  }
> > > > > > > > > > >
> > > > > > > > > > > +void dm_dp_notify_csn_disconnection(struct drm_conne=
ctor
> > > > > > > > > > > +*connector) {
> > > > > > > > > > > +       struct amdgpu_dm_connector *aconnector =3D
> > > > > > > > > > > +               to_amdgpu_dm_connector(connector);
> > > > > > > > > > > +       struct dc_sink *dc_sink =3D aconnector->dc_si=
nk;
> > > > > > > > > > > +       struct dc_link *dc_link =3D aconnector->dc_li=
nk;
> > > > > > > > > > > +       struct amdgpu_device *adev =3D drm_to_adev(dd=
ev);
> > > > > > > > > > > +
> > > > > > > > > > > +       ASSERT(dc_link);
> > > > > > > > > > > +
> > > > > > > > > > > +       if (dc_sink) {
> > > > > > > > > > > +               mutex_lock(&adev->dm.dc_lock);
> > > > > > > > > > > +
> > > > > > > > > > > +               /*clear the remote sink of the link*/
> > > > > > > > > > > +               dc_link_remove_remote_sink(dc_link,
> > > > > > > > > > > dc_sink);
> > > > > > > > > > > +               dc_sink_release(dc_sink);
> > > > > > > > > > > +               aconnector->dc_sink =3D NULL;
> > > > > > > > > > > +
> > > > > > > > > > > +               mutex_unlock(&adev->dm.dc_lock);
> > > > > > > > > > > +       }
> > > > > > > > > > > +}
> > > > > > > > > > > +
> > > > > > > > > > >  static const struct drm_dp_mst_topology_cbs dm_mst_c=
bs =3D
> > > > > > > > > > > {
> > > > > > > > > > >         .add_connector =3D dm_dp_add_mst_connector,
> > > > > > > > > > > +       .notify_csn_disconnection =3D
> > > > > > > > > > > dm_dp_notify_csn_disconnection,
> > > > > > > > > > >  };
> > > > > > > > > >
> > > > > > > > > > I still don't really think this is a good idea. This se=
ems
> > > > > > > > > > like
> > > > > > > > > > it's
> > > > > > > > > > just adding another hotplugging path to the code in ord=
er to
> > > > > > > > > > avoid
> > > > > > > > > > sending hotplugs for non-endpoint devices. In addition =
to
> > > > > > > > > > the
> > > > > > > >
> > > > > > > > So, what I wanted to do is to add a callback function for
> > > > > > > > endpoint
> > > > > > > > devices
> > > > > > > > case as described above. For disconnection of non-endpoint
> > > > > > > > devices
> > > > > > > > is
> > > > > > > > already taken care by current code.
> > > > > > > >
> > > > > > > > > > drm_connector issues I mentioned before, we also really=
 need
> > > > > > > > > > to
> > > > > > > > > > stop
> > > > > > > > > > doing any kind of payload maintence in hotplugging path=
s.
> > > > > > > > > > The
> > > > > > > > > > reality
> > > > > > > > > > is any kind of payload maintanence we do outside of nor=
mal
> > > > > > > > > > modesetting
> > > > > > > > > > paths is a relic from legacy modesetting that I'm dropp=
ing
> > > > > > > > > > ASAP
> > > > > > > > > > (more
> > > > > > > > > > on this below), and we can't keep adding to it because =
it
> > > > > > > > > > dramatically
> > > > > > > > > > complicates maintanence as well.
> > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Sorry for repeating this point so often but - the bigge=
st
> > > > > > > > > > issue
> > > > > > > > > > too
> > > > > > > > > > is
> > > > > > > > > > I'm still not sure what it is we're even avoiding here.=
 We
> > > > > > > > > > know
> > > > > > > > > > resources aren't released consistently, and that we're =
able
> > > > > > > > > > to
> > > > > > > > > > reproduce the behavior with repeated hotplugs. We also =
know
> > > > > > > > > > that
> > > > > > > > > > if
> > > > > > > > > > we
> > > > > > > > > > skip sending certain hotplug events, that fixes the iss=
ue.
> > > > > > > > > > And
> > > > > > > > > > we
> > > > > > > > > > know
> > > > > > > > > > we can workaround it by adding a special case for forci=
ng a
> > > > > > > > > > payload
> > > > > > > > > > release in DC. But none of those actually tell us exact=
ly
> > > > > > > > > > what
> > > > > > > > > > piece
> > > > > > > > > > of code is leaking and why, which means that any workar=
ounds
> > > > > > > > > > we're
> > > > > > > > > > putting in to avoid this mysterious guilty section of c=
ode
> > > > > > > > > > we
> > > > > > > > > > don't
> > > > > > > > > > entirely understand either - which means we're just add=
ing
> > > > > > > > > > more
> > > > > > > > > > code
> > > > > > > > > > in that no one actually fully understands. This just en=
ds up
> > > > > > > > > > making
> > > > > > > > > > maintence difficult because every change in code nearby
> > > > > > > > > > workarounds
> > > > > > > > > > like this has to strugle to try to figure out said
> > > > > > > > > > workarounds
> > > > > > > > > > in
> > > > > > > > > > order to avoid breaking things.
> > > > > > > >
> > > > > > > > Thank you Lyude for the reminder and I totally agree with y=
ou by
> > > > > > > > avoiding
> > > > > > > > adding workaround since it will get the code maintenance ha=
rder.
> > > > > > > > And
> > > > > > > > I
> > > > > > > > think the root cause of the issue that I observed before is
> > > > > > > > quite
> > > > > > > > concrete.
> > > > > > > > There is no code path for us to release dc_sink under the u=
nplug
> > > > > > > > scenario
> > > > > > > > that I described above.
> > > > > > > >
> > > > > > > > > >
> > > > > > > > > > I'm actually currently running into these "later" issue=
s
> > > > > > > > > > right
> > > > > > > > > > now,
> > > > > > > > > > as
> > > > > > > > > > recently I've (-actively-, finally!!!) been working on
> > > > > > > > > > trying to
> > > > > > > > > > remove as much non-atomic MST as I can because. As it t=
urns
> > > > > > > > > > out
> > > > > > > > > > -
> > > > > > > > > > a
> > > > > > > > > > huge amount of the payload maintanence code just isn't
> > > > > > > > > > needed at
> > > > > > > > > > all
> > > > > > > > > > when we stop caring about non-atomic drivers and stick
> > > > > > > > > > everything
> > > > > > > > > > in
> > > > > > > > > > atomic state structs. Step 1 for updating updating the
> > > > > > > > > > payload
> > > > > > > > > > table,
> > > > > > > > > > e.g. drm_dp_update_payload_part1(), is a great example =
of
> > > > > > > > > > how
> > > > > > > > > > messy
> > > > > > > > > > things have become. Here's a small sample of some of th=
e
> > > > > > > > > > stuff
> > > > > > > > > > I've
> > > > > > > > > > seen from just that one function so far that either jus=
t
> > > > > > > > > > don't
> > > > > > > > > > make
> > > > > > > > > > sense here or is totally redundant. I should note that =
a lot
> > > > > > > > > > of
> > > > > > > > > > these
> > > > > > > > > > things also come from patches I reviwed, but didn't rea=
lly
> > > > > > > > > > look
> > > > > > > > > > at
> > > > > > > > > > as
> > > > > > > > > > closely as I should have because I was swamped at work,=
 some
> > > > > > > > > > are
> > > > > > > > > > historical artifacts, and others are less-than-ideal pa=
tches
> > > > > > > > > > I
> > > > > > > > > > got
> > > > > > > > > > wrote myself when I was first started working on MST an=
d
> > > > > > > > > > didn't
> > > > > > > > > > know
> > > > > > > > > > the code as well as I do
> > > > > > > > > > now:
> > > > > > > > > >
> > > > > > > > > >  * We try to avoid some sort of userspace issue by usin=
g
> > > > > > > > > >    drm_dp_mst_port_downstream_of_branch() to avoid rele=
asing
> > > > > > > > > > payloads
> > > > > > > > > > for a
> > > > > > > > > >    branch if we can't prove it's downstream of the top =
of
> > > > > > > > > > the
> > > > > > > > > > topology. This
> > > > > > > > > >    seems to workaround either a userspace bug. This is =
a
> > > > > > > > > > redundant,
> > > > > > > > > > since
> > > > > > > > > >    that's what topology refs are already supposed to be
> > > > > > > > > > doing to
> > > > > > > > > > the
> > > > > > > > > > extent is
> > > > > > > > > >    reasonably possibly. It's also unfortunately racy
> > > > > > > > > > solution
> > > > > > > > > > because
> > > > > > > > > > we have
> > > > > > > > > >    to be able to handle the situation where a connector=
 is
> > > > > > > > > > removed
> > > > > > > > > > from under
> > > > > > > > > >    us. That can happen at any time, including _immediat=
ely_
> > > > > > > > > > after
> > > > > > > > > > we
> > > > > > > > > > call
> > > > > > > > > >    drm_dp_mst_port_downstream_of_branch() - rendering t=
he
> > > > > > > > > > call
> > > > > > > > > > not
> > > > > > > > > > really
> > > > > > > > > >    useful.
> > > > > > > > > >  * If we fail to validate the sink in
> > > > > > > > > > drm_dp_update_payload_part,
> > > > > > > > > > we
> > > > > > > > > > don't
> > > > > > > > > >    update the payload table. I think at best this solut=
ion
> > > > > > > > > > is
> > > > > > > > > > racy
> > > > > > > > > > and
> > > > > > > > > > not
> > > > > > > > > >    useful, at worst it leaves us with a payload table t=
hat
> > > > > > > > > > doesn't
> > > > > > > > > > match what
> > > > > > > > > >    we attempted to set in the atomic state - which at w=
orst
> > > > > > > > > > brings
> > > > > > > > > > us
> > > > > > > > > > into
> > > > > > > > > >    undefined territory where we're just plain out of sy=
nc
> > > > > > > > > > with
> > > > > > > > > > the
> > > > > > > > > > reality in
> > > > > > > > > >    hw.
> > > > > > > > > >  * Actually fun fact - mgr->payloads and mgr->proposed_=
vcpis
> > > > > > > > > > both
> > > > > > > > > > can
> > > > > > > > > > and
> > > > > > > > > >    definitely should be removed entirely. All of the in=
fo
> > > > > > > > > > for
> > > > > > > > > > mgr->payloads
> > > > > > > > > >    could just be in the atomic state, because that + th=
e
> > > > > > > > > > magic
> > > > > > > > > > of
> > > > > > > > > > atomic state
> > > > > > > > > >    duplication means we'll also have an accurate view o=
f the
> > > > > > > > > > previous
> > > > > > > > > > state's
> > > > > > > > > >    payload allocations: which renders mgr->proposed_vcp=
is
> > > > > > > > > > redundant.
> > > > > > > > > >
> > > > > > > > > > Apologies for the long explanation again, but I hope th=
at
> > > > > > > > > > explains
> > > > > > > > > > my
> > > > > > > >
> > > > > > > > Really really thanks for your kindly help on this : )
> > > > > > > > I'll try my best to get to your WIP branch soon. Thank you
> > > > > > > > Lyude!
> > > > > > > >
> > > > > > > > > > point here a bit. I'm going to be trying to get to movi=
ng
> > > > > > > > > > amdgpu's
> > > > > > > > > > DSC
> > > > > > > > > > code out of amdgpu and into DRM helpers as well soon, s=
o I'm
> > > > > > > > > > really
> > > > > > > > > > determined to clean stuff up beforehand as every time I=
've
> > > > > > > > > > done
> > > > > > > > > > so
> > > > > > > > > > it's become substantially easier to make changes to thi=
s
> > > > > > > > > > code.
> > > > > > > > > > Things
> > > > > > > > > > used to be even worse before I started cleaning things =
up 2
> > > > > > > > > > or 3
> > > > > > > > > > years
> > > > > > > > > > ago, where simple changes would end up getting me stuck
> > > > > > > > > > spending
> > > > > > > > > > hours
> > > > > > > > > > trying to dig through lockdep or memory manegement issu=
es.
> > > > > > > > > > As
> > > > > > > > > > well,
> > > > > > > > > > I
> > > > > > > > > > would be entirely unsurprised if bugs like this very pa=
yload
> > > > > > > > > > leak
> > > > > > > > > > we're working on just disappear once we've gotten rid o=
f all
> > > > > > > > > > the
> > > > > > > > > > extraneous workarounds and state tracking here - especi=
ally
> > > > > > > > > > with
> > > > > > > > > > how
> > > > > > > > > > many special cases we have for maintaining the payload =
table
> > > > > > > > > > right
> > > > > > > > > > now. That's certainly ended up being the case in the pa=
st
> > > > > > > > > > with a
> > > > > > > > > > number of other difficult to track down issues I've dea=
lt
> > > > > > > > > > with
> > > > > > > > > > in
> > > > > > > > > > MST.
> > > > > > > > > >
> > > > > > > > > > Anyhow. I've been way more productive this year then la=
st
> > > > > > > > > > because
> > > > > > > > > > I
> > > > > > > > > > had over a month off work and am finally not super burn=
t out
> > > > > > > > > > from
> > > > > > > > > > my
> > > > > > > > > > job, and so far I've been making progress on the payloa=
d
> > > > > > > > > > state
> > > > > > > > > > cleanup
> > > > > > > > > > far faster then I was last year :). I think if you can'=
t
> > > > > > > > > > figure
> > > > > > > > > > out
> > > > > > > > > > where the leak is coming from even once I get the debug=
ging
> > > > > > > > > > patches
> > > > > > > > > > I
> > > > > > > > > > mentioned fixed up, it might be a good idea for us to t=
ry
> > > > > > > > > > again
> > > > > > > > > > after
> > > > > > > > > > I've got some of this code cleaned up. I've got a curre=
ntly
> > > > > > > > > > WIP
> > > > > > > > > > branch
> > > > > > > > > > here:
> > > > > > > > > >
> > > > > > > > > > https://nam11.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fgitl
> > > > > > > > > > ab.freedesktop.org%2Flyudess%2Flinux%2F-
> > > > > > > > > > %2Fcommit%2F624dd68fa804e64b5b
> > > > > > > > > > 2060e4735d7317090692b5&amp;data=3D04%7C01%7Cwayne.lin%4=
0amd.co
> > > > > > > > > > m%7C
> > > > > > > > > > d4
> > > > > > > > > > bd
> > > > > > > > > > c7
> > > > > > > > > > 59eb274bfccc8208d9daef41fe%7C3dd8961fe4884e608e11a82d99=
4e183
> > > > > > > > > > d%7C
> > > > > > > > > > 0%
> > > > > > > > > > 7C
> > > > > > > > > > 0%
> > > > > > > > > > 7C637781543416430632%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjA
> > > > > > > > > > wMDA
> > > > > > > > > > iL
> > > > > > > > > > CJ
> > > > > > > > > > QI
> > > > > > > > > > joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sd=
ata=3Dn
> > > > > > > > > > FpVl
> > > > > > > > > > %2
> > > > > > > > > > BV
> > > > > > > > > > oF
> > > > > > > > > > 40JPabfRMcR6Cz7ZHDwt%2BBpLDBNdXftJaA%3D&amp;reserved=3D=
0
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > >  void amdgpu_dm_initialize_dp_connector(struct
> > > > > > > > > > > amdgpu_display_manager *dm, diff --git
> > > > > > > > > > > a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > index 857c5d15e81d..a70e26c5d084 100644
> > > > > > > > > > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > @@ -2508,6 +2508,7 @@ drm_dp_mst_handle_conn_stat(str=
uct
> > > > > > > > > > > drm_dp_mst_branch *mstb,
> > > > > > > > > > >         u8 new_pdt;
> > > > > > > > > > >         bool new_mcs;
> > > > > > > > > > >         bool dowork =3D false, create_connector =3D f=
alse;
> > > > > > > > > > > +       bool notify_unplug_event =3D false;
> > > > > > > > > > >
> > > > > > > > > > >         port =3D drm_dp_get_port(mstb, conn_stat-
> > > > > > > > > > > >port_number);
> > > > > > > > > > >         if (!port)
> > > > > > > > > > > @@ -2520,6 +2521,9 @@ drm_dp_mst_handle_conn_stat(str=
uct
> > > > > > > > > > > drm_dp_mst_branch *mstb,
> > > > > > > > > > >                          * port, so just throw the po=
rt
> > > > > > > > > > > out
> > > > > > > > > > > and
> > > > > > > > > > > make
> > > > > > > > > > > sure we
> > > > > > > > > > >                          * reprobe the link address o=
f
> > > > > > > > > > > it's
> > > > > > > > > > > parent
> > > > > > > > > > > MSTB
> > > > > > > > > > >                          */
> > > > > > > > > > > +                       /* should also consider
> > > > > > > > > > > notify_unplug_event
> > > > > > > > > > > here.
> > > > > > > > > > > +                        * but it's not a normal case=
 for
> > > > > > > > > > > products
> > > > > > > > > > > +in the
> > > > > > > > > > > market
> > > > > > > > > > > +                        */
> > > > > > > > > > >
> > > > > > > > > > > drm_dp_mst_topology_unlink_port(mgr,
> > > > > > > > > > > port);
> > > > > > > > > > >                         mstb->link_address_sent =3D f=
alse;
> > > > > > > > > > >                         dowork =3D true; @@ -2541,10
> > > > > > > > > > > +2545,14 @@
> > > > > > > > > > > drm_dp_mst_handle_conn_stat(struct
> > > > > > > > > > > drm_dp_mst_branch
> > > > > > > > > > > *mstb,
> > > > > > > > > > >         port->ddps =3D conn_stat-
> > > > > > > > > > > > displayport_device_plug_status;
> > > > > > > > > > >
> > > > > > > > > > >         if (old_ddps !=3D port->ddps) {
> > > > > > > > > > > -               if (port->ddps && !port->input)
> > > > > > > > > > > +               if (port->ddps && !port->input) {
> > > > > > > > > > >
> > > > > > > > > > > drm_dp_send_enum_path_resources(mgr,
> > > > > > > > > > > mstb,
> > > > > > > > > > > port);
> > > > > > > > > > > -               else
> > > > > > > > > > > +               } else {
> > > > > > > > > > >                         port->full_pbn =3D 0;
> > > > > > > > > > > +                       if (port->connector &&
> > > > > > > > > > > +
> > > > > > > > > > > drm_dp_mst_is_end_device(port-
> > > > > > > > > > > > pdt,
> > > > > > > > > > > +port-
> > > > > > > > > > > > mcs))
> > > > > > > > > > > +                               notify_unplug_event =
=3D
> > > > > > > > > > > true;
> > > > > > > > > > > +               }
> > > > > > > > > > >         }
> > > > > > > > > > >
> > > > > > > > > > >         new_pdt =3D port->input ? DP_PEER_DEVICE_NONE=
 :
> > > > > > > > > > > conn_stat-
> > > > > > > > > > > > peer_device_type;
> > > > > > > > > > > @@ -2557,11 +2565,15 @@ drm_dp_mst_handle_conn_stat(s=
truct
> > > > > > > > > > > drm_dp_mst_branch
> > > > > > > > > > > *mstb,
> > > > > > > > > > >                 dowork =3D false;
> > > > > > > > > > >         }
> > > > > > > > > > >
> > > > > > > > > > > +       if (notify_unplug_event &&
> > > > > > > > > > > +mgr->cbs->notify_csn_disconnection)
> > > > > > > > > > > +               mgr->cbs->notify_csn_disconnection(po=
rt-
> > > > > > > > > > > > connector);
> > > > > > > > > > > +
> > > > > > > > > > >         if (port->connector)
> > > > > > > > > > >                 drm_modeset_unlock(&mgr->base.lock);
> > > > > > > > > > >         else if (create_connector)
> > > > > > > > > > >                 drm_dp_mst_port_add_connector(mstb, p=
ort);
> > > > > > > > > > >
> > > > > > > > > > > +
> > > > > > > > > > >  out:
> > > > > > > > > > >         drm_dp_mst_topology_put_port(port);
> > > > > > > > > > >         if (dowork)
> > > > > > > > > > > diff --git a/include/drm/drm_dp_mst_helper.h
> > > > > > > > > > > b/include/drm/drm_dp_mst_helper.h index
> > > > > > > > > > > 78044ac5b59b..ff9e47729841
> > > > > > > > > > > 100644
> > > > > > > > > > > --- a/include/drm/drm_dp_mst_helper.h
> > > > > > > > > > > +++ b/include/drm/drm_dp_mst_helper.h
> > > > > > > > > > > @@ -525,6 +525,7 @@ struct drm_dp_mst_topology_cbs {
> > > > > > > > > > >          * IRQ pulse handler.
> > > > > > > > > > >          */
> > > > > > > > > > >         void (*poll_hpd_irq)(struct
> > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > *mgr);
> > > > > > > > > > > +       void (*notify_csn_disconnection)(struct
> > > > > > > > > > > drm_connector
> > > > > > > > > > > +*connector);
> > > > > > > > > > >  };
> > > > > > > > > > >
> > > > > > > > > > >  #define DP_MAX_PAYLOAD (sizeof(unsigned long) * 8)
> > > > > > > > > > > --
> > > > > > > > > > > 2.31.0
> > > > > > > > > > >
> > > > > > > > > > > > -----Original Message-----
> > > > > > > > > > > > From: Lin, Wayne
> > > > > > > > > > > > Sent: Wednesday, December 8, 2021 11:39 AM
> > > > > > > > > > > > To: 'Lyude Paul' <lyude@redhat.com>
> > > > > > > > > > > > Subject: RE: [PATCH] WIP: drm/dp_mst: Add support f=
or
> > > > > > > > > > > > dumping
> > > > > > > > > > > > topology ref histories from debugfs
> > > > > > > > > > > >
> > > > > > > > > > > > No worries Lyude!
> > > > > > > > > > > > Thanks for keeping helping on this. Take your time =
: )
> > > > > > > > > > > >
> > > > > > > > > > > > > -----Original Message-----
> > > > > > > > > > > > > From: Lyude Paul <lyude@redhat.com>
> > > > > > > > > > > > > Sent: Wednesday, December 8, 2021 7:05 AM
> > > > > > > > > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > > > > > > > > > Subject: Re: [PATCH] WIP: drm/dp_mst: Add support=
 for
> > > > > > > > > > > > > dumping
> > > > > > > > > > > > > topology ref histories from debugfs
> > > > > > > > > > > > >
> > > > > > > > > > > > > Sorry! I will try to get to this tomorrow, if not=
 then
> > > > > > > > > > > > > sometime
> > > > > > > > > > > > > this week.
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Tue, 2021-11-30 at 08:41 +0000, Lin, Wayne wro=
te:
> > > > > > > > > > > > > > [Public]
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Hi Lyude,
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Finally have some bandwidth to get back to this
> > > > > > > > > > > > > > problem!
> > > > > > > > > > > > > > I roughly went through this patch and I'm just =
aware
> > > > > > > > > > > > > > that
> > > > > > > > > > > > > > we
> > > > > > > > > > > > > > already have such kind of convenient tool for a
> > > > > > > > > > > > > > while.
> > > > > > > > > > > > > > I think it's definitely useful for us to track
> > > > > > > > > > > > > > port/mstb
> > > > > > > > > > > > > > reference count issues and I'll start to embrac=
e
> > > > > > > > > > > > > > this
> > > > > > > > > > > > > > feature
> > > > > > > > > > > > > > for cleaning up those issues. Thank you Lyude!
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > However, I think the issue that I was trying to=
 fix
> > > > > > > > > > > > > > is
> > > > > > > > > > > > > > not
> > > > > > > > > > > > > > related to what you suggested:
> > > > > > > > > > > > > > " The idea here is that if stream resources are=
n't
> > > > > > > > > > > > > > being
> > > > > > > > > > > > > > released, my guess would be that we're not drop=
ping
> > > > > > > > > > > > > > topology
> > > > > > > > > > > > > > references for the port which means the connect=
or
> > > > > > > > > > > > > > never
> > > > > > > > > > > > > > goes
> > > > > > > > > > > > > > away."
> > > > > > > > > > > > > > The issue I was trying to fix is about releasin=
g
> > > > > > > > > > > > > > dc_link->remote_sinks while receiving a CSN mes=
sage
> > > > > > > > > > > > > > notifying
> > > > > > > > > > > > > > the connection status of a sst connector of a p=
ort
> > > > > > > > > > > > > > changed
> > > > > > > > > > > > > > from connected to disconnected. Not the connect=
ion
> > > > > > > > > > > > > > status
> > > > > > > > > > > > > > changed of a mst branch device.
> > > > > > > > > > > > > > e.g.
> > > > > > > > > > > > > > src - 1st_mstb - 2nd_mstb - sst_monitor =3D> sr=
c -
> > > > > > > > > > > > > > 1st_mstb
> > > > > > > > > > > > > > (disconnect) 2nd_mstb - sst_monitor
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > In above case, after receiving CSN, we will put
> > > > > > > > > > > > > > topology
> > > > > > > > > > > > > > references of 2nd mstb and its port which is
> > > > > > > > > > > > > > connected
> > > > > > > > > > > > > > with
> > > > > > > > > > > > > > the sst monitor. As the result of that, we can =
call
> > > > > > > > > > > > > > drm_dp_delayed_destroy_port() to unregister and=
 put
> > > > > > > > > > > > > > the
> > > > > > > > > > > > > > drm
> > > > > > > > > > > > > > connector.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > However, in below case:
> > > > > > > > > > > > > > e.g.
> > > > > > > > > > > > > > src - 1st_mstb - sst_monitor =3D> src - 1st_mst=
b
> > > > > > > > > > > > > > (disconnect)
> > > > > > > > > > > > > > sst_monitor
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > In this case, which is the case having problem,=
 it
> > > > > > > > > > > > > > definitely
> > > > > > > > > > > > > > won't decrease the topology references count of=
 the
> > > > > > > > > > > > > > port
> > > > > > > > > > > > > > which
> > > > > > > > > > > > > > was connected to the sst monitor to zero since =
the
> > > > > > > > > > > > > > port
> > > > > > > > > > > > > > is
> > > > > > > > > > > > > > still existing in the topology. Same as the mal=
loc
> > > > > > > > > > > > > > reference
> > > > > > > > > > > > > > since the port can't get destroyed. Hence, the =
port
> > > > > > > > > > > > > > still
> > > > > > > > > > > > > > exists  and we won't call
> > > > > > > > > > > > > > drm_dp_delayed_destroy_port() to unregister and=
 put
> > > > > > > > > > > > > > the
> > > > > > > > > > > > > > drm
> > > > > > > > > > > > > > connector.
> > > > > > > > > > > > > > I looked up the code and
> > > > > > > > > > > > > > drm_dp_delayed_destroy_port()
> > > > > > > > > > > > > > seems
> > > > > > > > > > > > > > like the only place to call drm_connector_put()
> > > > > > > > > > > > > > which
> > > > > > > > > > > > > > means
> > > > > > > > > > > > > > we
> > > > > > > > > > > > > > can't put reference count of drm connector unde=
r
> > > > > > > > > > > > > > this
> > > > > > > > > > > > > > case
> > > > > > > > > > > > > > and
> > > > > > > > > > > > > > can't release dc_sink resource by destroying dr=
m
> > > > > > > > > > > > > > connector.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > I would also like to point out that this resour=
ce
> > > > > > > > > > > > > > (remote_sinks) is specific to different stream
> > > > > > > > > > > > > > sinks. So
> > > > > > > > > > > > > > if
> > > > > > > > > > > > > > we're trying to release this dc_sink resource b=
y
> > > > > > > > > > > > > > destroying
> > > > > > > > > > > > > > the drm connector, it conflicts the idea that y=
ou
> > > > > > > > > > > > > > suggested
> > > > > > > > > > > > > > before that we should always keep the drm conne=
ctor
> > > > > > > > > > > > > > until
> > > > > > > > > > > > > > it's
> > > > > > > > > > > > > > no longer reachable in the topology.
> > > > > > > > > > > > > > Releasing dc_sink should be binding with the
> > > > > > > > > > > > > > disconnection
> > > > > > > > > > > > > > event.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > I understand your concern that we should not ju=
st
> > > > > > > > > > > > > > easily
> > > > > > > > > > > > > > change the logic here since it's the result aft=
er
> > > > > > > > > > > > > > solving
> > > > > > > > > > > > > > tons
> > > > > > > > > > > > > > of bugs before and might cause other side effec=
t.
> > > > > > > > > > > > > > So,
> > > > > > > > > > > > > > just
> > > > > > > > > > > > > > my
> > > > > > > > > > > > > > 2 cents, what I'm thinking is to register a cal=
lback
> > > > > > > > > > > > > > function
> > > > > > > > > > > > > > for our driver to notify us that the remote sin=
k is
> > > > > > > > > > > > > > detached.
> > > > > > > > > > > > > > This just aligns our flow handling long HPD eve=
nt of
> > > > > > > > > > > > > > legacy
> > > > > > > > > > > > > > (sst) DP.
> > > > > > > > > > > > > > For sst case, once we detect long HPD event
> > > > > > > > > > > > > > indicating
> > > > > > > > > > > > > > the
> > > > > > > > > > > > > > monitor is detached, we will immediately try to
> > > > > > > > > > > > > > release
> > > > > > > > > > > > > > the
> > > > > > > > > > > > > > dc_link->local_sink and fire hotplug event to u=
pper
> > > > > > > > > > > > > > layer.
> > > > > > > > > > > > > > Same as here, once receives a CSN message notif=
ying
> > > > > > > > > > > > > > a
> > > > > > > > > > > > > > drm
> > > > > > > > > > > > > > connector is changed from connected to disconne=
cted,
> > > > > > > > > > > > > > trigger
> > > > > > > > > > > > > > the callback function and we can try to release=
 the
> > > > > > > > > > > > > > dc_sink
> > > > > > > > > > > > > > resource.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Would like to know your thought and insight ple=
ase :
> > > > > > > > > > > > > > )
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Btw, I got some errors and warnings while build=
ing
> > > > > > > > > > > > > > and
> > > > > > > > > > > > > > have
> > > > > > > > > > > > > > some code adjustments as below : ) Thank you Ly=
ude
> > > > > > > > > > > > > > for
> > > > > > > > > > > > > > your
> > > > > > > > > > > > > > always kindly help!!
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Regards,
> > > > > > > > > > > > > > Wayne
> > > > > > > > > > > > > > > -----Original Message-----
> > > > > > > > > > > > > > > From: Lyude Paul <lyude@redhat.com>
> > > > > > > > > > > > > > > Sent: Wednesday, November 3, 2021 7:15 AM
> > > > > > > > > > > > > > > To: Lin, Wayne <Wayne.Lin@amd.com>
> > > > > > > > > > > > > > > Subject: [PATCH] WIP: drm/dp_mst: Add support=
 for
> > > > > > > > > > > > > > > dumping
> > > > > > > > > > > > > > > topology ref histories from debugfs
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > TODO:
> > > > > > > > > > > > > > > * Implement support for i915
> > > > > > > > > > > > > > > * Finish writing this commit message
> > > > > > > > > > > > > > > * ???
> > > > > > > > > > > > > > > * profit
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Hey wayne! SO-hopefully if I did this correct=
ly
> > > > > > > > > > > > > > > then
> > > > > > > > > > > > > > > this
> > > > > > > > > > > > > > > should just work on amdgpu. What this patch s=
hould
> > > > > > > > > > > > > > > do
> > > > > > > > > > > > > > > is
> > > > > > > > > > > > > > > add
> > > > > > > > > > > > > > > a debugfs file to amdgpu called
> > > > > > > > > > > > > > > "amdgpu_dp_mst_topology_refs", and when you r=
ead
> > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > file
> > > > > > > > > > > > > > > it
> > > > > > > > > > > > > > > should print out the topology reference histo=
ry of
> > > > > > > > > > > > > > > every
> > > > > > > > > > > > > > > MSTB and Port in memory, along with how many =
times
> > > > > > > > > > > > > > > we've
> > > > > > > > > > > > > > > hit
> > > > > > > > > > > > > > > the codepath in each backtrace. An example:
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Port DP-5 (0000000005c37748) topology ref his=
tory:
> > > > > > > > > > > > > > >   1 gets (last at    58.468973):
> > > > > > > > > > > > > > >      drm_dp_send_link_address+0x6a5/0xa00
> > > > > > > > > > > > > > > [drm_kms_helper]
> > > > > > > > > > > > > > >      drm_dp_check_and_send_link_address+0xad/=
0xd0
> > > > > > > > > > > > > > > [drm_kms_helper]
> > > > > > > > > > > > > > >      drm_dp_mst_link_probe_work+0x14e/0x1a0
> > > > > > > > > > > > > > > [drm_kms_helper]
> > > > > > > > > > > > > > >      process_one_work+0x1e3/0x390
> > > > > > > > > > > > > > >      worker_thread+0x50/0x3a0
> > > > > > > > > > > > > > >      kthread+0x124/0x150
> > > > > > > > > > > > > > >      ret_from_fork+0x1f/0x30
> > > > > > > > > > > > > > >   1 puts (last at    58.469357):
> > > > > > > > > > > > > > >      drm_dp_mst_topology_put_port+0x6a/0x210
> > > > > > > > > > > > > > > [drm_kms_helper]
> > > > > > > > > > > > > > >      drm_dp_send_link_address+0x39e/0xa00
> > > > > > > > > > > > > > > [drm_kms_helper]
> > > > > > > > > > > > > > >      drm_dp_check_and_send_link_address+0xad/=
0xd0
> > > > > > > > > > > > > > > [drm_kms_helper]
> > > > > > > > > > > > > > >      drm_dp_mst_link_probe_work+0x14e/0x1a0
> > > > > > > > > > > > > > > [drm_kms_helper]
> > > > > > > > > > > > > > >      process_one_work+0x1e3/0x390
> > > > > > > > > > > > > > >      worker_thread+0x50/0x3a0
> > > > > > > > > > > > > > >      kthread+0x124/0x150
> > > > > > > > > > > > > > >      ret_from_fork+0x1f/0x30
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > The idea here is that if stream resources are=
n't
> > > > > > > > > > > > > > > being
> > > > > > > > > > > > > > > released, my guess would be that we're not
> > > > > > > > > > > > > > > dropping
> > > > > > > > > > > > > > > topology
> > > > > > > > > > > > > > > references for the port which means the conne=
ctor
> > > > > > > > > > > > > > > never
> > > > > > > > > > > > > > > goes
> > > > > > > > > > > > > > > away. So, if that's really the case then once=
 we
> > > > > > > > > > > > > > > unplug
> > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > offending connector we should be able to find=
 a
> > > > > > > > > > > > > > > pair
> > > > > > > > > > > > > > > of
> > > > > > > > > > > > > > > gets/puts for the offending leaked connector =
where
> > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > get/put count doesn't match up. Also, if the =
frame
> > > > > > > > > > > > > > > count
> > > > > > > > > > > > > > > on
> > > > > > > > > > > > > > > the backtrace isn't long enough you can incre=
ase
> > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > value
> > > > > > > > > > > > > > > of STACK_DEPTH in
> > > > > > > > > > > > > > > drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > > > > > and
> > > > > > > > > > > > > > > recompile to get more frames.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > To enable this, first enable CONFIG_EXPERT fo=
r
> > > > > > > > > > > > > > > your
> > > > > > > > > > > > > > > kernel
> > > > > > > > > > > > > > > which will unhide
> > > > > > > > > > > > > > > CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS.
> > > > > > > > > > > > > > > Then just enable
> > > > > > > > > > > > > > > CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS,
> > > > > > > > > > > > > > > recompile, and it should be good to go.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Let me know if this works for you, and hopefu=
lly
> > > > > > > > > > > > > > > this
> > > > > > > > > > > > > > > should
> > > > > > > > > > > > > > > tell us exactly what the problem actually is =
here.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.=
c |
> > > > > > > > > > > > > > > 35
> > > > > > > > > > > > > > > ++++
> > > > > > > > > > > > > > >  drivers/gpu/drm/drm_dp_mst_topology.c       =
  |
> > > > > > > > > > > > > > > 173
> > > > > > > > > > > > > > > ++++++++++++++----
> > > > > > > > > > > > > > >  drivers/gpu/drm/nouveau/nouveau_debugfs.c   =
  |
> > > > > > > > > > > > > > > 35
> > > > > > > > > > > > > > > ++++
> > > > > > > > > > > > > > >  include/drm/drm_dp_mst_helper.h             =
  |
> > > > > > > > > > > > > > > 18
> > > > > > > > > > > > > > > ++
> > > > > > > > > > > > > > >  4 files changed, 228 insertions(+), 33
> > > > > > > > > > > > > > > deletions(-)
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > diff --git
> > > > > > > > > > > > > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgp=
u_dm_
> > > > > > > > > > > > > > > debu
> > > > > > > > > > > > > > > gf
> > > > > > > > > > > > > > > s.
> > > > > > > > > > > > > > > c
> > > > > > > > > > > > > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgp=
u_dm_
> > > > > > > > > > > > > > > debu
> > > > > > > > > > > > > > > gf
> > > > > > > > > > > > > > > s.
> > > > > > > > > > > > > > > c
> > > > > > > > > > > > > > > index 1a68a674913c..1a14732c52b4 100644
> > > > > > > > > > > > > > > ---
> > > > > > > > > > > > > > > a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgp=
u_dm_
> > > > > > > > > > > > > > > debu
> > > > > > > > > > > > > > > gf
> > > > > > > > > > > > > > > s.
> > > > > > > > > > > > > > > c
> > > > > > > > > > > > > > > +++
> > > > > > > > > > > > > > > b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgp=
u_dm_
> > > > > > > > > > > > > > > debu
> > > > > > > > > > > > > > > gf
> > > > > > > > > > > > > > > +++ s.c
> > > > > > > > > > > > > > > @@ -3063,6 +3063,37 @@ static int
> > > > > > > > > > > > > > > mst_topo_show(struct
> > > > > > > > > > > > > > > seq_file *m, void
> > > > > > > > > > > > > > > *unused)
> > > > > > > > > > > > > > >       return 0;
> > > > > > > > > > > > > > >  }
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > +#ifdef CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS
> > > > > > > > > > > > > > > +static int mst_topology_ref_dump_show(struct
> > > > > > > > > > > > > > > seq_file
> > > > > > > > > > > > > > > *m,
> > > > > > > > > > > > > > > +void
> > > > > > > > > > > > > > > +*unused) {
> > > > > > > > > > > > > > > +     struct amdgpu_device *adev =3D (struct
> > > > > > > > > > > > > > > amdgpu_device
> > > > > > > > > > > > > > > +*)m->private;
> > > > > > > > > > > > > > > +     struct drm_device *dev =3D adev_to_drm(=
adev);
> > > > > > > > > > > > > > > +     struct drm_connector *connector;
> > > > > > > > > > > > > > > +     struct drm_connector_list_iter conn_ite=
r;
> > > > > > > > > > > > > > > +     struct amdgpu_dm_connector *aconnector;
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +     drm_connector_list_iter_begin(dev,
> > > > > > > > > > > > > > > &conn_iter);
> > > > > > > > > > > > > > > +     drm_for_each_connector_iter(connector,
> > > > > > > > > > > > > > > &conn_iter)
> > > > > > > > > > > > > > > {
> > > > > > > > > > > > > > > +             if (connector->connector_type !=
=3D
> > > > > > > > > > > > > > > DRM_MODE_CONNECTOR_DisplayPort)
> > > > > > > > > > > > > > > +                     continue;
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +             aconnector =3D
> > > > > > > > > > > > > > > +to_amdgpu_dm_connector(connector);
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +             /* Ensure we're only dumping th=
e
> > > > > > > > > > > > > > > topology
> > > > > > > > > > > > > > > of
> > > > > > > > > > > > > > > a
> > > > > > > > > > > > > > > +root mst node
> > > > > > > > > > > > > > > */
> > > > > > > > > > > > > > > +             if (!aconnector-
> > > > > > > > > > > > > > > >mst_mgr.max_payloads)
> > > > > > > > > > > > > > > +                     continue;
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +             seq_printf(m, "\nMST topology f=
or
> > > > > > > > > > > > > > > connector
> > > > > > > > > > > > > > > +%d\n",
> > > > > > > > > > > > > > > aconnector->connector_id);
> > > > > > > > > > > > > > > +             drm_dp_mst_dump_topology_refs(m=
,
> > > > > > > > > > > > > > > +&aconnector->mst_mgr);
> > > > > > > > > > > > > > > +     }
> > > > > > > > > > > > > > > +     drm_connector_list_iter_end(&conn_iter)=
;
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +     return 0;
> > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +DEFINE_SHOW_ATTRIBUTE(mst_topology_ref_dump)=
;
> > > > > > > > > > > > > > > +#endif
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > >  /*
> > > > > > > > > > > > > > >   * Sets trigger hpd for MST topologies.
> > > > > > > > > > > > > > >   * All connected connectors will be rediscov=
ered
> > > > > > > > > > > > > > > and
> > > > > > > > > > > > > > > re
> > > > > > > > > > > > > > > started as needed if val of 1 is sent.
> > > > > > > > > > > > > > > @@ -3299,6 +3330,10 @@ void
> > > > > > > > > > > > > > > dtn_debugfs_init(struct
> > > > > > > > > > > > > > > amdgpu_device
> > > > > > > > > > > > > > > *adev)
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >       debugfs_create_file("amdgpu_mst_topolog=
y",
> > > > > > > > > > > > > > > 0444,
> > > > > > > > > > > > > > > root,
> > > > > > > > > > > > > > >                           adev, &mst_topo_fop=
s);
> > > > > > > > > > > > > > > +#ifdef CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > debugfs_create_file("amdgpu_dp_mst_topology_r=
efs",
> > > > > > > > > > > > > > > +0444, root, adev,
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > &mst_topology_ref_dump_fops);
> > > > > > > > > > > > > > > +#endif
> > > > > > > > > > > > > > >       debugfs_create_file("amdgpu_dm_dtn_log"=
,
> > > > > > > > > > > > > > > 0644,
> > > > > > > > > > > > > > > root,
> > > > > > > > > > > > > > > adev,
> > > > > > > > > > > > > > >                           &dtn_log_fops);
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > diff --git a/drivers/gpu/drm/drm_dp_mst_topol=
ogy.c
> > > > > > > > > > > > > > > b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > > > > > index 1aa8702383d4..0159828c494d 100644
> > > > > > > > > > > > > > > --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > > > > > +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> > > > > > > > > > > > > > > @@ -1366,23 +1366,6 @@ static int
> > > > > > > > > > > > > > > drm_dp_mst_wait_tx_reply(struct drm_dp_mst_br=
anch
> > > > > > > > > > > > > > > *mstb,
> > > > > > > > > > > > > > >       return ret;
> > > > > > > > > > > > > > >  }
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > -static struct drm_dp_mst_branch
> > > > > > > > > > > > > > > *drm_dp_add_mst_branch_device(u8 lct, u8
> > > > > > > > > > > > > > > *rad) -{
> > > > > > > > > > > > > > > -     struct drm_dp_mst_branch *mstb;
> > > > > > > > > > > > > > > -
> > > > > > > > > > > > > > > -     mstb =3D kzalloc(sizeof(*mstb), GFP_KER=
NEL);
> > > > > > > > > > > > > > > -     if (!mstb)
> > > > > > > > > > > > > > > -             return NULL;
> > > > > > > > > > > > > > > -
> > > > > > > > > > > > > > > -     mstb->lct =3D lct;
> > > > > > > > > > > > > > > -     if (lct > 1)
> > > > > > > > > > > > > > > -             memcpy(mstb->rad, rad, lct / 2)=
;
> > > > > > > > > > > > > > > -     INIT_LIST_HEAD(&mstb->ports);
> > > > > > > > > > > > > > > -     kref_init(&mstb->topology_kref);
> > > > > > > > > > > > > > > -     kref_init(&mstb->malloc_kref);
> > > > > > > > > > > > > > > -     return mstb;
> > > > > > > > > > > > > > > -}
> > > > > > > > > > > > > > > -
> > > > > > > > > > > > > > >  static void drm_dp_free_mst_branch_device(st=
ruct
> > > > > > > > > > > > > > > kref
> > > > > > > > > > > > > > > *kref)  {
> > > > > > > > > > > > > > >       struct drm_dp_mst_branch *mstb =3D @@ -=
1642,12
> > > > > > > > > > > > > > > +1625,20
> > > > > > > > > > > > > > > @@ topology_ref_type_to_str(enum
> > > > > > > > > > > > > > > drm_dp_mst_topology_ref_type type)
> > > > > > > > > > > > > > >               return "put";
> > > > > > > > > > > > > > >  }
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > +static const char
> > > > > > > > > > > > > > > *topology_ref_history_type_to_str(enum
> > > > > > > > > > > > > > > +drm_dp_mst_topology_history_type type) {
> > > > > > > > > > > > > > > +     if (type =3D=3D
> > > > > > > > > > > > > > > DRM_DP_MST_TOPOLOGY_HISTORY_PORT)
> > > > > > > > > > > > > > > +             return "Port";
> > > > > > > > > > > > > > > +     else
> > > > > > > > > > > > > > > +             return "MSTB"; }
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > >  static void
> > > > > > > > > > > > > > > -__dump_topology_ref_history(struct
> > > > > > > > > > > > > > > drm_dp_mst_topology_ref_history *history,
> > > > > > > > > > > > > > > -                         void *ptr, const ch=
ar
> > > > > > > > > > > > > > > *type_str)
> > > > > > > > > > > > > > > +dump_topology_ref_history(struct
> > > > > > > > > > > > > > > +drm_dp_mst_topology_ref_history *history, st=
ruct
> > > > > > > > > > > > > > > +drm_printer p)
> > > > > > > > > > > > > > >  {
> > > > > > > > > > > > > > > -     struct drm_printer p =3D
> > > > > > > > > > > > > > > drm_debug_printer(DBG_PREFIX);
> > > > > > > > > > > > > > > +     char *connector_name =3D NULL;
> > > > > > > > > > > > > > >       char *buf =3D kzalloc(PAGE_SIZE, GFP_KE=
RNEL);
> > > > > > > > > > > > > > > +     void *ptr;
> > > > > > > > > > > > > > >       int i;
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >       if (!buf)
> > > > > > > > > > > > > > > @@ -1656,14 +1647,29 @@
> > > > > > > > > > > > > > > __dump_topology_ref_history(struct
> > > > > > > > > > > > > > > drm_dp_mst_topology_ref_history *history,
> > > > > > > > > > > > > > >       if (!history->len)
> > > > > > > > > > > > > > >               goto out;
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > +     /* Get a pointer to the actual MSTB/por=
t so
> > > > > > > > > > > > > > > we
> > > > > > > > > > > > > > > can
> > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > +memory
> > > > > > > > > > > > > > > address to the kernel log */
> > > > > > > > > > > > > > > +     if (history->type =3D=3D
> > > > > > > > > > > > > > > DRM_DP_MST_TOPOLOGY_HISTORY_PORT)
> > > > > > > > > > > > > > > +             ptr =3D container_of(history, s=
truct
> > > > > > > > > > > > > > > +drm_dp_mst_port,
> > > > > > > > > > > > > > > topology_ref_history);
> > > > > > > > > > > > > > > +     else
> > > > > > > > > > > > > > > +             ptr =3D container_of(history, s=
truct
> > > > > > > > > > > > > > > +drm_dp_mst_branch, topology_ref_history);
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > >       /* First, sort the list so that it goes=
 from
> > > > > > > > > > > > > > > oldest
> > > > > > > > > > > > > > > to
> > > > > > > > > > > > > > > newest
> > > > > > > > > > > > > > >        * reference entry
> > > > > > > > > > > > > > >        */
> > > > > > > > > > > > > > >       sort(history->entries, history->len,
> > > > > > > > > > > > > > > sizeof(*history->entries),
> > > > > > > > > > > > > > >            topology_ref_history_cmp, NULL);
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > -     drm_printf(&p, "%s (%p) topology count
> > > > > > > > > > > > > > > reached
> > > > > > > > > > > > > > > 0,
> > > > > > > > > > > > > > > dumping history:\n",
> > > > > > > > > > > > > > > -                type_str, ptr);
> > > > > > > > > > > > > > > +     if (history->type =3D=3D
> > > > > > > > > > > > > > > DRM_DP_MST_TOPOLOGY_HISTORY_PORT)
> > > > > > > > > > > > > > > +{
> > > > > > > > > > > > > > > +             struct drm_dp_mst_port *port =
=3D ptr;
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +             if (port->connector)
> > > > > > > > > > > > > > > +                     connector_name =3D
> > > > > > > > > > > > > > > +port->connector->name;
> > > > > > > > > > > > > > > +     }
> > > > > > > > > > > > > > > +     if (connector_name)
> > > > > > > > > > > > > > > +             drm_printf(&p, "Port %s (%p)
> > > > > > > > > > > > > > > topology
> > > > > > > > > > > > > > > ref
> > > > > > > > > > > > > > > +history:\n",
> > > > > > > > > > > > > > > connector_name, ptr);
> > > > > > > > > > > > > > > +     else
> > > > > > > > > > > > > > > +             drm_printf(&p, "%s (%p) topolog=
y ref
> > > > > > > > > > > > > > > +history:\n",
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +topology_ref_history_type_to_str(history->ty=
pe),
> > > > > > > > > > > > > > > ptr);
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >       for (i =3D 0; i < history->len; i++) {
> > > > > > > > > > > > > > >               const struct
> > > > > > > > > > > > > > > drm_dp_mst_topology_ref_entry
> > > > > > > > > > > > > > > *entry =3D @@
> > > > > > > > > > > > > > > -
> > > > > > > > > > > > > > > 1682,24 +1688,92 @@
> > > > > > > > > > > > > > > __dump_topology_ref_history(struct
> > > > > > > > > > > > > > > drm_dp_mst_topology_ref_history *history,
> > > > > > > > > > > > > > >                          ts_nsec, rem_nsec / =
1000,
> > > > > > > > > > > > > > > buf);
> > > > > > > > > > > > > > >       }
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > -     /* Now free the history, since this is =
the
> > > > > > > > > > > > > > > only
> > > > > > > > > > > > > > > time
> > > > > > > > > > > > > > > we expose it */
> > > > > > > > > > > > > > > -     kfree(history->entries);
> > > > > > > > > > > > > > >  out:
> > > > > > > > > > > > > > >       kfree(buf);
> > > > > > > > > > > > > > >  }
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > +/**
> > > > > > > > > > > > > > > + * drm_dp_mst_dump_topology_refs - helper
> > > > > > > > > > > > > > > function
> > > > > > > > > > > > > > > for
> > > > > > > > > > > > > > > +dumping the topology ref history
> > > > > > > > > > > > > > > + * @m: File to print to
> > > > > > > > > > > > > > > + * @mgr: &struct drm_dp_mst_topology_mgr to =
use
> > > > > > > > > > > > > > > + *
> > > > > > > > > > > > > > > + * Prints the topology ref history of all po=
rts
> > > > > > > > > > > > > > > and
> > > > > > > > > > > > > > > MSTBs
> > > > > > > > > > > > > > > +on @mgr that are still in memory,
> > > > > > > > > > > > > > > + * regardless of whether they're actually st=
ill
> > > > > > > > > > > > > > > reachable
> > > > > > > > > > > > > > > +through the topology or not. Only enabled
> > > > > > > > > > > > > > > + * when %CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_RE=
FS is
> > > > > > > > > > > > > > > enabled.
> > > > > > > > > > > > > > > +Can be implemented by drivers to assist
> > > > > > > > > > > > > > > + * with debugging leaks in the DP MST helper=
s.
> > > > > > > > > > > > > > > + */
> > > > > > > > > > > > > > > +void drm_dp_mst_dump_topology_refs(struct
> > > > > > > > > > > > > > > seq_file
> > > > > > > > > > > > > > > *m,
> > > > > > > > > > > > > > > +struct drm_dp_mst_topology_mgr *mgr) {
> > > > > > > > > > > > > > > +     struct drm_dp_mst_topology_ref_history
> > > > > > > > > > > > > > > *history;
> > > > > > > > > > > > > > > +     struct drm_printer p =3D
> > > > > > > > > > > > > > > drm_seq_file_printer(m);
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +     mutex_lock(&mgr->topology_ref_history_l=
ock);
> > > > > > > > > > > > > > > +     list_for_each_entry(history,
> > > > > > > > > > > > > > > +&mgr->topology_ref_history_list,
> > > > > > > > > > > > > > > +node)
> > > > > > > > > > > > > > > +             dump_topology_ref_history(histo=
ry,
> > > > > > > > > > > > > > > p);
> > > > > > > > > > > > > > > +     mutex_unlock(&mgr-
> > > > > > > > > > > > > > > >topology_ref_history_lock);
> > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > +EXPORT_SYMBOL(drm_dp_mst_dump_topology_refs)=
;
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +static void
> > > > > > > > > > > > > > > +__init_topology_ref_history(struct
> > > > > > > > > > > > > > > +drm_dp_mst_topology_ref_history
> > > > > > > > > > > > > > > *history,
> > > > > > > > > > > > > > > +                         struct
> > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > +*mgr,
> > > > > > > > > > > > > > > +                         enum
> > > > > > > > > > > > > > > +drm_dp_mst_topology_history_type
> > > > > > > > > > > > > > > +type) {
> > > > > > > > > > > > > > > +     history->type =3D type;
> > > > > > > > > > > > > > > +     INIT_LIST_HEAD(&history->node);
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +     mutex_lock(&mgr->topology_ref_history_l=
ock);
> > > > > > > > > > > > > > > +     list_add(&history->node,
> > > > > > > > > > > > > > > +&mgr->topology_ref_history_list);
> > > > > > > > > > > > > > > +     mutex_unlock(&mgr-
> > > > > > > > > > > > > > > >topology_ref_history_lock);
> > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +static void
> > > > > > > > > > > > > > > +__destroy_topology_ref_history(struct
> > > > > > > > > > > > > > > +drm_dp_mst_topology_ref_history
> > > > > > > > > > > > > > > *history,
> > > > > > > > > > > > > > > +                            struct
> > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > +*mgr) {
> > > > > > > > > > > > > > > +     mutex_lock(&mgr->topology_ref_history_l=
ock);
> > > > > > > > > > > > > > > +     list_del(&mgr->topology_ref_history_lis=
t);
> > > > > > > > > > > > > > > +     mutex_unlock(&mgr-
> > > > > > > > > > > > > > > >topology_ref_history_lock);
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +     kfree(history->entries); }
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +static __always_inline void
> > > > > > > > > > > > > > > +init_port_topology_history(struct
> > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > +*mgr, struct drm_dp_mst_port *port) {
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +__init_topology_ref_history(&port-
> > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > +mgr,
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +DRM_DP_MST_TOPOLOGY_HISTORY_PORT);
> > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +static __always_inline void
> > > > > > > > > > > > > > > +init_mstb_topology_history(struct
> > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > +*mgr, struct drm_dp_mst_branch *mstb) {
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +__init_topology_ref_history(&mstb-
> > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > +mgr,
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +DRM_DP_MST_TOPOLOGY_HISTORY_MSTB);
> > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +static __always_inline void
> > > > > > > > > > > > > > > +destroy_port_topology_history(struct
> > > > > > > > > > > > > > > drm_dp_mst_port
> > > > > > > > > > > > > > > *port)
> > > > > > > > > > > > > > > +{
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +__destroy_topology_ref_history(&port-
> > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > +port->mgr); }
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +static __always_inline void
> > > > > > > > > > > > > > > +destroy_mstb_topology_history(struct
> > > > > > > > > > > > > > > drm_dp_mst_branch
> > > > > > > > > > > > > > > +*mstb) {
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +__destroy_topology_ref_history(&mstb-
> > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > +mstb->mgr); }
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > >  static __always_inline void
> > > > > > > > > > > > > > >  dump_mstb_topology_history(struct
> > > > > > > > > > > > > > > drm_dp_mst_branch
> > > > > > > > > > > > > > > *mstb)
> > > > > > > > > > > > > > > {
> > > > > > > > > > > > > > > -
> > > > > > > > > > > > > > > __dump_topology_ref_history(&mstb-
> > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > mstb,
> > > > > > > > > > > > > > > -                                 "MSTB");
> > > > > > > > > > > > > > > +     dump_topology_ref_history(&mstb-
> > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > +drm_debug_printer(DBG_PREFIX));
> > > > > > > > > > > > > > >  }
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >  static __always_inline void
> > > > > > > > > > > > > > >  dump_port_topology_history(struct drm_dp_mst=
_port
> > > > > > > > > > > > > > > *port)
> > > > > > > > > > > > > > > {
> > > > > > > > > > > > > > > -
> > > > > > > > > > > > > > > __dump_topology_ref_history(&port-
> > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > port,
> > > > > > > > > > > > > > > -                                 "Port");
> > > > > > > > > > > > > > > +     dump_topology_ref_history(&port-
> > > > > > > > > > > > > > > > topology_ref_history,
> > > > > > > > > > > > > > > +drm_debug_printer(DBG_PREFIX));
> > > > > > > > > > > > > > >  }
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >  static __always_inline void @@ -1729,6 +1803=
,14
> > > > > > > > > > > > > > > @@
> > > > > > > > > > > > > > > topology_ref_history_unlock(struct
> > > > > > > > > > > > > > > drm_dp_mst_topology_mgr *mgr)  }  #else  stat=
ic
> > > > > > > > > > > > > > > inline
> > > > > > > > > > > > > > > void
> > > > > > > > > > > > > > > +init_port_topology_history(struct
> > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > +*mgr, struct drm_dp_mst_port *port); static
> > > > > > > > > > > > > > > inline
> > > > > > > > > > > > > > > void
> > > > > > > > > > > > > > Should also add the bracket, otherwise will get
> > > > > > > > > > > > > > warnings.
> > > > > > > > > > > > > > =3D> static inline void
> > > > > > > > > > > > > > init_port_topology_history(struct
> > > > > > > > > > > > > > drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst=
_port
> > > > > > > > > > > > > > *port)
> > > > > > > > > > > > > > {};
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > +init_mstb_topology_history(struct
> > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > +*mgr, struct drm_dp_mst_branch *mstb); stati=
c
> > > > > > > > > > > > > > > inline
> > > > > > > > > > > > > > > void
> > > > > > > > > > > > > > Same as above
> > > > > > > > > > > > > > =3D> static inline void
> > > > > > > > > > > > > > init_mstb_topology_history(struct
> > > > > > > > > > > > > > drm_dp_mst_topology_mgr *mgr, struct
> > > > > > > > > > > > > > drm_dp_mst_branch
> > > > > > > > > > > > > > *mstb)
> > > > > > > > > > > > > > {};
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > +destroy_port_topology_history(struct
> > > > > > > > > > > > > > > +drm_dp_mst_topology_mgr *mgr, struct
> > > > > > > > > > > > > > > drm_dp_mst_port
> > > > > > > > > > > > > > > +*port); static inline void
> > > > > > > > > > > > > > destroy_port_topology_history() takes one param=
eter
> > > > > > > > > > > > > > only
> > > > > > > > > > > > > > which
> > > > > > > > > > > > > > is port.
> > > > > > > > > > > > > > =3D> destroy_port_topology_history(struct
> > > > > > > > > > > > > > drm_dp_mst_port
> > > > > > > > > > > > > > *port)
> > > > > > > > > > > > > > {};
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > +destroy_mstb_topology_history(struct
> > > > > > > > > > > > > > > +drm_dp_mst_topology_mgr *mgr, struct
> > > > > > > > > > > > > > > drm_dp_mst_branch
> > > > > > > > > > > > > > > +*mstb); static inline void
> > > > > > > > > > > > > > destroy_mstb_topology_history() takes one param=
eter
> > > > > > > > > > > > > > only
> > > > > > > > > > > > > > which
> > > > > > > > > > > > > > is mstb =3D> destroy_mstb_topology_history(stru=
ct
> > > > > > > > > > > > > > drm_dp_mst_branch
> > > > > > > > > > > > > > *mstb) {};
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > >  topology_ref_history_lock(struct
> > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > *mgr) {} static inline void
> > > > > > > > > > > > > > > topology_ref_history_unlock(struct
> > > > > > > > > > > > > > > drm_dp_mst_topology_mgr *mgr) {} @@ -1740,6
> > > > > > > > > > > > > > > +1822,25
> > > > > > > > > > > > > > > @@
> > > > > > > > > > > > > > > dump_port_topology_history(struct drm_dp_mst_=
port
> > > > > > > > > > > > > > > *port)
> > > > > > > > > > > > > > > {}
> > > > > > > > > > > > > > > #define save_port_topology_ref(port, type)  #=
endif
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > +static struct drm_dp_mst_branch *
> > > > > > > > > > > > > > > +drm_dp_add_mst_branch_device(struct
> > > > > > > > > > > > > > > drm_dp_mst_topology_mgr
> > > > > > > > > > > > > > > +*mgr,
> > > > > > > > > > > > > > > +u8 lct, u8 *rad) {
> > > > > > > > > > > > > > > +     struct drm_dp_mst_branch *mstb;
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +     mstb =3D kzalloc(sizeof(*mstb), GFP_KER=
NEL);
> > > > > > > > > > > > > > > +     if (!mstb)
> > > > > > > > > > > > > > > +             return NULL;
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +     mstb->lct =3D lct;
> > > > > > > > > > > > > > > +     if (lct > 1)
> > > > > > > > > > > > > > > +             memcpy(mstb->rad, rad, lct / 2)=
;
> > > > > > > > > > > > > > > +     INIT_LIST_HEAD(&mstb->ports);
> > > > > > > > > > > > > > > +     kref_init(&mstb->topology_kref);
> > > > > > > > > > > > > > > +     kref_init(&mstb->malloc_kref);
> > > > > > > > > > > > > > > +     init_mstb_topology_history(mgr, mstb);
> > > > > > > > > > > > > > > +     return mstb;
> > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > >  static void
> > > > > > > > > > > > > > > drm_dp_destroy_mst_branch_device(struct
> > > > > > > > > > > > > > > kref
> > > > > > > > > > > > > > > *kref) {
> > > > > > > > > > > > > > >       struct drm_dp_mst_branch *mstb =3D @@ -=
1747,6
> > > > > > > > > > > > > > > +1848,7
> > > > > > > > > > > > > > > @@
> > > > > > > > > > > > > > > static void
> > > > > > > > > > > > > > > drm_dp_destroy_mst_branch_device(struct
> > > > > > > > > > > > > > > kref *kref)
> > > > > > > > > > > > > > >       struct drm_dp_mst_topology_mgr *mgr =3D=
 mstb-
> > > > > > > > > > > > > > > >mgr;
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >       dump_mstb_topology_history(mstb);
> > > > > > > > > > > > > > > +     destroy_mstb_topology_history(mstb);
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >       INIT_LIST_HEAD(&mstb->destroy_next);
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > @@ -1856,6 +1958,7 @@ static void
> > > > > > > > > > > > > > > drm_dp_destroy_port(struct
> > > > > > > > > > > > > > > kref
> > > > > > > > > > > > > > > *kref)
> > > > > > > > > > > > > > >       struct drm_dp_mst_topology_mgr *mgr =3D=
 port-
> > > > > > > > > > > > > > > >mgr;
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >       dump_port_topology_history(port);
> > > > > > > > > > > > > > > +     destroy_port_topology_history(port);
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >       /* There's nothing that needs locking t=
o
> > > > > > > > > > > > > > > destroy
> > > > > > > > > > > > > > > an
> > > > > > > > > > > > > > > input port yet */
> > > > > > > > > > > > > > >       if (port->input) {
> > > > > > > > > > > > > > > @@ -2135,7 +2238,7 @@ drm_dp_port_set_pdt(str=
uct
> > > > > > > > > > > > > > > drm_dp_mst_port *port, u8 new_pdt,
> > > > > > > > > > > > > > >                       ret =3D
> > > > > > > > > > > > > > > drm_dp_mst_register_i2c_bus(port);
> > > > > > > > > > > > > > >               } else {
> > > > > > > > > > > > > > >                       lct =3D
> > > > > > > > > > > > > > > drm_dp_calculate_rad(port,
> > > > > > > > > > > > > > > rad);
> > > > > > > > > > > > > > > -                     mstb =3D
> > > > > > > > > > > > > > > drm_dp_add_mst_branch_device(lct, rad);
> > > > > > > > > > > > > > > +                     mstb =3D
> > > > > > > > > > > > > > > +drm_dp_add_mst_branch_device(mgr, lct, rad);
> > > > > > > > > > > > > > >                       if (!mstb) {
> > > > > > > > > > > > > > >                               ret =3D -ENOMEM=
;
> > > > > > > > > > > > > > >                               drm_err(mgr->de=
v,
> > > > > > > > > > > > > > > "Failed
> > > > > > > > > > > > > > > to
> > > > > > > > > > > > > > > create MSTB for port %p", port); @@ -2366,6
> > > > > > > > > > > > > > > +2469,8 @@
> > > > > > > > > > > > > > > drm_dp_mst_add_port(struct drm_device *dev,
> > > > > > > > > > > > > > >        */
> > > > > > > > > > > > > > >       drm_dp_mst_get_mstb_malloc(mstb);
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > +     init_port_topology_history(mgr, port);
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > >       return port;
> > > > > > > > > > > > > > >  }
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > @@ -3745,7 +3850,7 @@ int
> > > > > > > > > > > > > > > drm_dp_mst_topology_mgr_set_mst(struct
> > > > > > > > > > > > > > > drm_dp_mst_topology_mgr *mgr, bool ms
> > > > > > > > > > > > > > >               }
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >               /* add initial branch device at=
 LCT
> > > > > > > > > > > > > > > 1 */
> > > > > > > > > > > > > > > -             mstb =3D
> > > > > > > > > > > > > > > drm_dp_add_mst_branch_device(1,
> > > > > > > > > > > > > > > NULL);
> > > > > > > > > > > > > > > +             mstb =3D
> > > > > > > > > > > > > > > drm_dp_add_mst_branch_device(mgr,
> > > > > > > > > > > > > > > 1,
> > > > > > > > > > > > > > > +NULL);
> > > > > > > > > > > > > > >               if (mstb =3D=3D NULL) {
> > > > > > > > > > > > > > >                       ret =3D -ENOMEM;
> > > > > > > > > > > > > > >                       goto out_unlock; @@ -55=
12,14
> > > > > > > > > > > > > > > +5617,16
> > > > > > > > > > > > > > > @@ int drm_dp_mst_topology_mgr_init(struct
> > > > > > > > > > > > > > > drm_dp_mst_topology_mgr *mgr,
> > > > > > > > > > > > > > >       mutex_init(&mgr->delayed_destroy_lock);
> > > > > > > > > > > > > > >       mutex_init(&mgr->up_req_lock);
> > > > > > > > > > > > > > >       mutex_init(&mgr->probe_lock); -#if
> > > > > > > > > > > > > > > IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_R=
EFS)
> > > > > > > > > > > > > > > -     mutex_init(&mgr->topology_ref_history_l=
ock);
> > > > > > > > > > > > > > > -#endif
> > > > > > > > > > > > > > >       INIT_LIST_HEAD(&mgr->tx_msg_downq);
> > > > > > > > > > > > > > >       INIT_LIST_HEAD(&mgr->destroy_port_list)=
;
> > > > > > > > > > > > > > >       INIT_LIST_HEAD(&mgr-
> > > > > > > > > > > > > > > > destroy_branch_device_list);
> > > > > > > > > > > > > > >       INIT_LIST_HEAD(&mgr->up_req_list);
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > +#if
> > > > > > > > > > > > > > > IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_R=
EFS)
> > > > > > > > > > > > > > > +     mutex_init(&mgr->topology_ref_history_l=
ock);
> > > > > > > > > > > > > > > +     INIT_LIST_HEAD(&mgr-
> > > > > > > > > > > > > > > >topology_ref_history_list);
> > > > > > > > > > > > > > > +#endif
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > >       /*
> > > > > > > > > > > > > > >        * delayed_destroy_work will be queued =
on a
> > > > > > > > > > > > > > > dedicated
> > > > > > > > > > > > > > > WQ, so that any
> > > > > > > > > > > > > > >        * requeuing will be also flushed when
> > > > > > > > > > > > > > > deiniting
> > > > > > > > > > > > > > > the
> > > > > > > > > > > > > > > topology manager.
> > > > > > > > > > > > > > > diff --git
> > > > > > > > > > > > > > > a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > > > > > > > > > > > > > b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> > > > > > > > > > > > > > > index 1cbe01048b93..53ec7c1daada 100644
> > > > > > > > > > > > > > > --- a/drivers/gpu/drm/nouveau/nouveau_debugfs=
.c
> > > > > > > > > > > > > > > +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs=
.c
> > > > > > > > > > > > > > > @@ -29,9 +29,13 @@
> > > > > > > > > > > > > > >   */
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >  #include <linux/debugfs.h>
> > > > > > > > > > > > > > > +#include <drm/drm_dp_mst_helper.h> #include
> > > > > > > > > > > > > > > +<drm/drm_encoder.h>
> > > > > > > > > > > > > > >  #include <nvif/class.h>
> > > > > > > > > > > > > > >  #include <nvif/if0001.h>
> > > > > > > > > > > > > > > +#include <nouveau_encoder.h>
> > > > > > > > > > > > > > >  #include "nouveau_debugfs.h"
> > > > > > > > > > > > > > > +#include "nouveau_display.h"
> > > > > > > > > > > > > > >  #include "nouveau_drv.h"
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >  static int
> > > > > > > > > > > > > > > @@ -68,6 +72,34 @@
> > > > > > > > > > > > > > > nouveau_debugfs_strap_peek(struct
> > > > > > > > > > > > > > > seq_file *m, void
> > > > > > > > > > > > > > > *data)
> > > > > > > > > > > > > > >       return 0;
> > > > > > > > > > > > > > >  }
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > +#ifdef CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS
> > > > > > > > > > > > > > > +static int
> > > > > > > > > > > > > > > nouveau_debugfs_mst_topology_history(struct
> > > > > > > > > > > > > > > +seq_file *m, void *data) {
> > > > > > > > > > > > > > > +     struct drm_info_node *node =3D m->priva=
te;
> > > > > > > > > > > > > > > +     struct drm_device *dev =3D node->minor-=
>dev;
> > > > > > > > > > > > > > > +     struct drm_encoder *encoder;
> > > > > > > > > > > > > > > +     struct nouveau_display *disp =3D
> > > > > > > > > > > > > > > nouveau_display(dev);
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +     if (disp->disp.object.oclass < GF110_DI=
SP)
> > > > > > > > > > > > > > > +             return -EINVAL;
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +     drm_for_each_encoder(encoder, dev) {
> > > > > > > > > > > > > > > +             struct nv50_mstm *mstm;
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +             /* We need the real encoder for=
 each
> > > > > > > > > > > > > > > MST
> > > > > > > > > > > > > > > mgr
> > > > > > > > > > > > > > > +*/
> > > > > > > > > > > > > > > +             if (encoder->encoder_type !=3D
> > > > > > > > > > > > > > > +DRM_MODE_ENCODER_TMDS)
> > > > > > > > > > > > > > > +                     continue;
> > > > > > > > > > > > > > > +             mstm =3D nouveau_encoder(encode=
r)-
> > > > > > > > > > > > > > > > dp.mstm;
> > > > > > > > > > > > > > > +             if (!mstm)
> > > > > > > > > > > > > > > +                     continue;
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +             seq_printf(m, "MSTM on %s:\n",
> > > > > > > > > > > > > > > encoder-
> > > > > > > > > > > > > > > > name);
> > > > > > > > > > > > > > > +             drm_dp_mst_dump_topology_refs(m=
,
> > > > > > > > > > > > > > > &mstm-
> > > > > > > > > > > > > > > > mgr);
> > > > > > > > > > > > > > > +     }
> > > > > > > > > > > > > > > +     return 0;
> > > > > > > > > > > > > > > +}
> > > > > > > > > > > > > > > +#endif
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > >  static int
> > > > > > > > > > > > > > >  nouveau_debugfs_pstate_get(struct seq_file *=
m,
> > > > > > > > > > > > > > > void
> > > > > > > > > > > > > > > *data)
> > > > > > > > > > > > > > > { @@
> > > > > > > > > > > > > > > -213,6
> > > > > > > > > > > > > > > +245,9 @@ static const struct file_operations
> > > > > > > > > > > > > > > nouveau_pstate_fops =3D {  static struct
> > > > > > > > > > > > > > > drm_info_list
> > > > > > > > > > > > > > > nouveau_debugfs_list[] =3D {
> > > > > > > > > > > > > > >       { "vbios.rom",  nouveau_debugfs_vbios_i=
mage,
> > > > > > > > > > > > > > > 0,
> > > > > > > > > > > > > > > NULL
> > > > > > > > > > > > > > > },
> > > > > > > > > > > > > > >       { "strap_peek", nouveau_debugfs_strap_p=
eek,
> > > > > > > > > > > > > > > 0,
> > > > > > > > > > > > > > > NULL
> > > > > > > > > > > > > > > },
> > > > > > > > > > > > > > > +#ifdef CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS
> > > > > > > > > > > > > > > +     { "dp_mst_topology_refs",
> > > > > > > > > > > > > > > +nouveau_debugfs_mst_topology_history, 0, NUL=
L },
> > > > > > > > > > > > > > > #endif
> > > > > > > > > > > > > > >  };
> > > > > > > > > > > > > > >  #define NOUVEAU_DEBUGFS_ENTRIES
> > > > > > > > > > > > > > > ARRAY_SIZE(nouveau_debugfs_list)
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > diff --git a/include/drm/drm_dp_mst_helper.h
> > > > > > > > > > > > > > > b/include/drm/drm_dp_mst_helper.h index
> > > > > > > > > > > > > > > 78044ac5b59b..e3a73d8d97c0
> > > > > > > > > > > > > > > 100644
> > > > > > > > > > > > > > > --- a/include/drm/drm_dp_mst_helper.h
> > > > > > > > > > > > > > > +++ b/include/drm/drm_dp_mst_helper.h
> > > > > > > > > > > > > > > @@ -35,6 +35,11 @@ enum
> > > > > > > > > > > > > > > drm_dp_mst_topology_ref_type {
> > > > > > > > > > > > > > >       DRM_DP_MST_TOPOLOGY_REF_PUT,
> > > > > > > > > > > > > > >  };
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > +enum drm_dp_mst_topology_history_type {
> > > > > > > > > > > > > > > +     DRM_DP_MST_TOPOLOGY_HISTORY_PORT,
> > > > > > > > > > > > > > > +     DRM_DP_MST_TOPOLOGY_HISTORY_MSTB, };
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > >  struct drm_dp_mst_topology_ref_history {
> > > > > > > > > > > > > > >       struct drm_dp_mst_topology_ref_entry {
> > > > > > > > > > > > > > >               enum drm_dp_mst_topology_ref_ty=
pe
> > > > > > > > > > > > > > > type;
> > > > > > > > > > > > > > > @@
> > > > > > > > > > > > > > > -43,6
> > > > > > > > > > > > > > > +48,9 @@ struct drm_dp_mst_topology_ref_histo=
ry {
> > > > > > > > > > > > > > >               depot_stack_handle_t backtrace;
> > > > > > > > > > > > > > >       } *entries;
> > > > > > > > > > > > > > >       int len;
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +     enum drm_dp_mst_topology_history_type t=
ype;
> > > > > > > > > > > > > > > +     struct list_head node;
> > > > > > > > > > > > > > >  };
> > > > > > > > > > > > > > >  #endif /*
> > > > > > > > > > > > > > > IS_ENABLED(CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_R=
EFS)
> > > > > > > > > > > > > > > */
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > @@ -769,6 +777,12 @@ struct
> > > > > > > > > > > > > > > drm_dp_mst_topology_mgr {
> > > > > > > > > > > > > > >        * &drm_dp_mst_branch.topology_ref_hist=
ory.
> > > > > > > > > > > > > > >        */
> > > > > > > > > > > > > > >       struct mutex topology_ref_history_lock;
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > > +     /**
> > > > > > > > > > > > > > > +      * @topology_ref_history_list: contains=
 a
> > > > > > > > > > > > > > > list
> > > > > > > > > > > > > > > of
> > > > > > > > > > > > > > > +topology ref
> > > > > > > > > > > > > > > histories for any MSTBs or
> > > > > > > > > > > > > > > +      * ports that are still in memory
> > > > > > > > > > > > > > > +      */
> > > > > > > > > > > > > > > +     struct list_head topology_ref_history_l=
ist;
> > > > > > > > > > > > > > >  #endif
> > > > > > > > > > > > > > >  };
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > @@ -873,6 +887,10 @@ void
> > > > > > > > > > > > > > > drm_dp_mst_put_port_malloc(struct
> > > > > > > > > > > > > > > drm_dp_mst_port *port);
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >  struct drm_dp_aux
> > > > > > > > > > > > > > > *drm_dp_mst_dsc_aux_for_port(struct
> > > > > > > > > > > > > > > drm_dp_mst_port *port);
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > +#ifdef CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS
> > > > > > > > > > > > > > > +void drm_dp_mst_dump_topology_refs(struct
> > > > > > > > > > > > > > > seq_file
> > > > > > > > > > > > > > > *m,
> > > > > > > > > > > > > > > +struct drm_dp_mst_topology_mgr *mgr); #endif
> > > > > > > > > > > > > > > +
> > > > > > > > > > > > > > >  extern const struct drm_private_state_funcs
> > > > > > > > > > > > > > > drm_dp_mst_topology_state_funcs;
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >  /**
> > > > > > > > > > > > > > > --
> > > > > > > > > > > > > > > 2.31.1
> > > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > --
> > > > > > > > > > > > > Cheers,
> > > > > > > > > > > > >  Lyude Paul (she/her)
> > > > > > > > > > > > >  Software Engineer at Red Hat
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > Cheers, Lyude Paul (she/her) Software Engineer at Red Hat
> > > > > > > > --
> > > > > > > > Regards,
> > > > > > > > Wayne Lin
> > > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > Cheers,
> > > > > > >  Lyude Paul (she/her)
> > > > > > >  Software Engineer at Red Hat
> > > > > >
> > > > >
> > > >
> > >
> > > --
> > > Cheers,
> > >  Lyude Paul (she/her)
> > >  Software Engineer at Red Hat
> >
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat

--
Regards,
Wayne Lin

