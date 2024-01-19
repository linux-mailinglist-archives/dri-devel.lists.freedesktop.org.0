Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDA183245F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 06:50:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7525B10E04F;
	Fri, 19 Jan 2024 05:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6348D10E04F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 05:50:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VV+4ALLuU4HxYT1zilEO5RtBIWpN7EySLPH1iBLvH0D0RkdFOL/hTEMsaoE9ihW6K7SKwgPfRTETDVEKBYDjCnXYg0NIRad2wKkbg+oCq4S9DeIOd7nRll7SnfuFQyhqauGNrqq90Y9AD0euDIFdccQpSOC+TlN/o2kcz2gYOQnw+lzPkS6aBF5H4nNX3B8k+j0YafOND2HCn8nsI/+3psBSMb5Ga8MaIcScmUsvrzkWeyyHVNkhtIVGA5qYsbLNhhWiTFcWrDbPLPrLpcWusdPuYKZuVsbnkVitLpA1bTtif1oVpptQYmE7zCW93bfHZnykp2B3vKTJe+gs4xrYVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlar8cZXaurNjxpdrBlld/kbpuDsh8m3esuXf/q10Js=;
 b=ZcCTL+dhNH65RYzJjNmfWxpW7cRz+tDciSdnzlX85uMNXYCkNYKwyWY9td+CoSFuNnO4labEsIrCNHHI+Mrmb0vrLTda+0pn0RQGwv8WeMlInDN7YW3PCPwhZI/5n/iopaIeoximhNo7445hfYPfkKdJQHAyzgWxzr60L0OczNrAnJkYo8yFMSepg6NQ8Mx/Q4rzUF5/9Uw8fhnRA9DBDl5pv/4EdVANLPW97XUX08A9+1bMYQXk1IuT72RUXdK0lf8bG6axpbjutDmIAfZyJdzaFbVIlhipYSMRikQ9ytfKVUaeWuhZapGFbQ1DoFFy8na3kaprGpCw26Rng4im0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlar8cZXaurNjxpdrBlld/kbpuDsh8m3esuXf/q10Js=;
 b=cAxK1HXhtUJEHRFd6CsEWtFe3FyPLESh/Itailq5LowwmlMe0Zi4ezyL/rG20zViAqyTqLCRhst0BaB5/5xDzgzJEycp1joa4AUrAqkmW0DXbZH0uYYGzYzKYZ1TvcviCQsrn515ix9BLYg8Dx7Q4s9gOxKHQyi4bHCemz4ExF0=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by DM6PR12MB4217.namprd12.prod.outlook.com (2603:10b6:5:219::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 05:49:41 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::374b:e99d:5ba7:1ec0]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::374b:e99d:5ba7:1ec0%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 05:49:41 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Maxime Ripard
 <mripard@kernel.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Simek, Michal" <michal.simek@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] Fixing live video input in ZynqMP DPSUB
Thread-Topic: [PATCH 0/4] Fixing live video input in ZynqMP DPSUB
Thread-Index: AQHaSptLK8WV8aU0/UeE/Qp+In1IcQ==
Date: Fri, 19 Jan 2024 05:49:41 +0000
Message-ID: <MW4PR12MB716560EDEF35C59F77D7156FE6702@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <mailman.1627.1705504032.2418.dri-devel@lists.freedesktop.org>
In-Reply-To: <mailman.1627.1705504032.2418.dri-devel@lists.freedesktop.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|DM6PR12MB4217:EE_
x-ms-office365-filtering-correlation-id: 16510a7c-5a4a-4f2f-24fc-08dc18b26e5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A+qjnIFZNU5PuUqmBZEgVjSYUiDNOkbiuqURM9k6znZBOotkauZhTFO6Lfx0/weutKaByxZN32eKqv4YngXmNXZF64XbGJ8x1WQTryO1Gnl8eUDnFaFK1OGgGrXDo27uC4ihI8P3AxBIhAzR8vxkkXUwHp0B580FF3tHrkBOH4aX6Px6o9G3v5KdDXR1tBZ7RU+31P3kAsJKKqPottv9B1Rw46fZl1xFneGzvVdG0/rRfm2t2N+ZEfDfmfRybyI3YYCdMoNVfrIFly4BhqfHPd5af5F+wY5WFufUqG3QRd7J46pkvSUy/oOBiVkuxVpE/mx/gOK3zxBAJJRNm1cIg9TtkszBxRmxMH9YxZmMv+gyndRleVJ4ibQkMV4jHXwMx7NQpPmWl+rbownu2VNqwCFwS2l229Kr2amtNpY1nargdW13GvXHe3DTuuxNfV1DigjwD/o+UAfGPkfGrNMpt7rJyp7wqNu/a1z7/DCShHFUkds6ib3HVQ8R8UknT4tOk823LHB7RZ1+CgljLFVc4Kyu8ZWkhyOSBeK9w4Wuyxz5gTsEbdFw3OEEru2RhEbSGKdAHUQubtA7w0WPZNQLcu6ibz/Z1LvxOg/fZo2jgAAjDkNnf9cUEFhNr85LA4ntsQd/ta4jPS/Sr+srHGaTIA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(396003)(376002)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(71200400001)(26005)(478600001)(7696005)(83380400001)(6506007)(9686003)(5660300002)(2906002)(52536014)(921011)(41300700001)(110136005)(76116006)(8936002)(8676002)(66946007)(66446008)(316002)(64756008)(66556008)(66476007)(33656002)(86362001)(38100700002)(122000001)(38070700009)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AvdLjxIqRnGYCwJoup2zfNPPuMwTsc6UGxDNTudHfLmFXNaLo+QWK2rehKuc?=
 =?us-ascii?Q?LBNutaX6uL5kZPyI/gJSzeiT0NtHDRFScOGXkSeSGEQgJibhPQCh9GuCV8Nm?=
 =?us-ascii?Q?OzId02m7ZMLVz/f7inDyF1as4ZxsQC+j+xQ+NPE8U9cjBacQc3mOssKkve6P?=
 =?us-ascii?Q?kSPaDZ+WYZSSYZU87rnSibWxcfzUxQsKLZ/uiKng9yhM2fgJazql4q0UJncC?=
 =?us-ascii?Q?yjNzW9dFj1wQp7c5sd2w1CatWm2eLOH5EIS9F0wblTL9kVUbwuWkGsbLfktn?=
 =?us-ascii?Q?eHevFDyCGr/G7csaruO9lweYvGuh9QtV6UKZsSpH2RMGQ0AKeW6PLGnABu1v?=
 =?us-ascii?Q?U8in5KXhnYwW5mb5zOChmsZAAsKUJsSkYzfCEja2hwfWhVTf9V75w0GEpQfL?=
 =?us-ascii?Q?xz/QXI5h8XfFB/p6DiZ2VtOFxQFS+H/Dz2ZDS+RXbP47JCiYGBzOJdcQIqDq?=
 =?us-ascii?Q?VNf5/hHDv7A+dtm2BcRIKEI2xQe5o3txGxZo2zfeEa1eYRVyuc7CxnuzipOG?=
 =?us-ascii?Q?ELU4cLDJOnpixzWXAknGc/ZGPdOWCi6VM//ESyn4wjF4ffUFzVETcSsvde1S?=
 =?us-ascii?Q?q3/6Is3Dqabsef8klxIrCbCkXicLrtLHy/BGylMHbtUgC48YdW29Fq2CBem8?=
 =?us-ascii?Q?50lsARXOqBImLhJLBrHsYQxThsFDh1cwS1jtJgZxuTiCIHTp/wfpjcx6h4Lm?=
 =?us-ascii?Q?yZ4qBUdabKyS3xicIME6k2ik5q6nvyo7xUqIhAq0QnXTG0yjrluOxz9dYYWL?=
 =?us-ascii?Q?KYRXZSBS74xxGTm+u9ueZgy+GOtZY2lGbBcUwmH2ThlD6uPRuuHW6pchPrWS?=
 =?us-ascii?Q?ttM2p8r3M3wPIS4t4ykKmGHddtFgtOEYJk2po3UKTaNhhCOPNiw4PTaxvuSG?=
 =?us-ascii?Q?OtbkJ5HLx8mU1D8TVr/3gVni1K/VHDJk9o1gou1VzSg490H/NN9Zy3Y4WChL?=
 =?us-ascii?Q?ti2uCh0/bmNKTugl4fjG4jj/YzFhHNMGI0LHYuvJFXr2drnC0kVj2vXNnpbA?=
 =?us-ascii?Q?69sYd7rxYHUk0Isw2LMrK2JVtPzqlV/hNZAfkCNEt93QY3RhC0PhBclhMyBh?=
 =?us-ascii?Q?pO7w1JkgUQ4DlhiCgSEX72OvgqJOKoRC2wJS2rnPoYW1PF/Sf0BVQiVpust1?=
 =?us-ascii?Q?lBD0Yfm8sx6pmfNfxfM2DllCmF7A6pL4zpr56AqivJ2nqSajK3wnbwTrKCg+?=
 =?us-ascii?Q?YjGcc4skrrxDF+hFJkZYI/giMit7a0/V2ic+FmhUy5mjgLEIou3w+NgdIsSn?=
 =?us-ascii?Q?zFCT6x0bx25hprShfQx0kvOfbEIpGzA/nXpMHO+uAAWb/J0yjJ/hWzLH4rZq?=
 =?us-ascii?Q?0PDVyFWEpziwteN4v0GcDSvBPUQ3pO18eLMWWcDNTl+ZawZmyf2+KOlBUj/2?=
 =?us-ascii?Q?TmUIfYtnICBxe12jhHN/f0gR46/3nbA63PSeybIpRHHLPn7VmUUkdRrFFSuy?=
 =?us-ascii?Q?c0CyylhSFH9TEtHNK7fc0I3OzRE4sHO+9BCFj0j6GVJtmc6YLK9Kw1FJIBbF?=
 =?us-ascii?Q?jMp351Y7SYJu6dfYYt1c9k7z3Gl2YQ4McH5rNsTGCmtfbZgvHfs5ZoH0PTIo?=
 =?us-ascii?Q?wLM+NAj1+2C4PsPhpf4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16510a7c-5a4a-4f2f-24fc-08dc18b26e5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2024 05:49:41.4305 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GQe2CHbDQc8frbCAmg1C63I7NeIEHb1JVGGfgi5RrpI9vHsxtY2YvA+lsqgFr/tq37bLVZlE/ccZwm75MIRpLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4217
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent and Maxime,

Laurent, thank you very much for clear and comprehensive description of the=
 "live video input" feature.

Maxime, sure, I will elaborate more in the next version of cover letter.

> Date: Wed, 17 Jan 2024 16:23:43 +0200
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> To: Maxime Ripard <mripard@kernel.org>
> Cc: Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
>         maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
>         airlied@gmail.com, daniel@ffwll.ch, michal.simek@amd.com,
>         dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead=
.org,
>         linux-kernel@vger.kernel.org
> Subject: Re: [PATCH 0/4] Fixing live video input in ZynqMP DPSUB
> Message-ID: <20240117142343.GD17920@pendragon.ideasonboard.com>
> Content-Type: text/plain; charset=3Dutf-8
>=20
> On Mon, Jan 15, 2024 at 09:28:39AM +0100, Maxime Ripard wrote:
> > On Fri, Jan 12, 2024 at 03:42:18PM -0800, Anatoliy Klymenko wrote:
> > > Patches 1/4,2/4,3/4 are minor fixes.
> > >
> > > DPSUB requires input live video format to be configured.
> > > Patch 4/4: The DP Subsystem requires the input live video format to
> > > be configured. In this patch we are assuming that the CRTC's bus
> > > format is fixed and comes from the device tree. This is a proposed
> > > solution, as there are no api to query CRTC output bus format.
> > >
> > > Is this a good approach to go with?
> >
> > I guess you would need to expand a bit on what "live video input" is?
> > Is it some kind of mechanism to bypass memory and take your pixels
> > straight from a FIFO from another device, or something else?
>=20
> Yes and no.
>=20
> The DPSUB integrates DMA engines, a blending engine (two planes), and a D=
P
> encoder. The dpsub driver supports all of this, and creates a DRM device.=
 The DP
> encoder hardware always takes its input data from the output of the blend=
ing
> engine.
>=20
> The blending engine can optionally take input data from a bus connected t=
o the
> FPGA fabric, instead of taking it from the DPSUB internal DMA engines. Wh=
en
> operating in that mode, the dpsub driver exposes the DP encoder as a brid=
ge, and
> internally programs the blending engine to disable blending. Typically, t=
he FPGA
> fabric will then contain a CRTC of some sort, with a driver that will acq=
uire the DP
> encoder bridge as usually done.
>=20
> In this mode of operation, it is typical for the IP cores in FPGA fabric =
to be
> synthesized with a fixed format (as that saves resources), while the DPSU=
B
> supports multiple input formats. Bridge drivers in the upstream kernel wo=
rk the
> other way around, with the bridge hardware supporting a limited set of fo=
rmats,
> and the CRTC then being programmed with whatever the bridges chain needs.
> Here, the negotiation needs to go the other way around, as the CRTC is th=
e
> limiting factor, not the bridge.
>=20
> Is this explanation clear ?
>=20
> --
> Regards,
>=20
> Laurent Pinchart
>=20
>=20

Thank you,
Anatoliy
