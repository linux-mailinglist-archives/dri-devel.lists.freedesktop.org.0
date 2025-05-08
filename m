Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA54AAFA98
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 14:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0E110E8FB;
	Thu,  8 May 2025 12:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rDQRqRk8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9285810E8FB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 12:54:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DipqeubiV9eUHb81mWyNkWCX2QSktxS+oOXJ2NqYNp7VVGxPItbHoXv64HAPt+xq1FbmeAhDRXsyijwcG1s26sS+I/BN1qK+dX+AZI+L7DnlZs90eueFjjLRjNJhNRRd+oYULohufAc3v4lXbTKdHi/jZ/nD5s6YVyvobl2vd1zfqj+z8C/c2IDOr4szi8/rAnVhRHZPiaoQdBURzPR5CwcMMVTqzjb75fOiwtsrKsLRrWndmIqKsoJb8unPNGO225vVDiP8xUlhBNYAVHiK0pjGiD5slZAlB8Q7rbiR3Rsxl4xcQ041fG0c7qTxMmPDkPFGRg0+/ugbwOwieWcuvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EUlxyOX48WJ0yh3Tu7T9oymBPescaCAIWDjmim8qO4=;
 b=ka8N9Kmo2GIm79rCWkgSVBupzO0zZ28jwU80aeEh+HEHmkwb7qxsBX/HN8y1R/K07gZvLaT6vjD2tCyZLR5ucxR0motVrWa8NT/kVCoXKfQl+SiWyubxT5TPsqqEvBXcComnISNohrGSN34pqzQAeB6wRWR7ft+ZmIbF3pCWdrtTsWqye3Ol/yWVolQNKH5I30SIHoItOBoYx76/8txwhjE/yrrIRdB266Lk7/2TkohuLUBf4sU858fq/JfQd0ynszKbdG9H8BbCTqanCS8BYQcoKiYly+fHn+KbWyTJHIkVXvBCY3ntyKu67mYPIc+RiRELK73AGSaT65OeGcAdMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EUlxyOX48WJ0yh3Tu7T9oymBPescaCAIWDjmim8qO4=;
 b=rDQRqRk8TmXoQTWf5lXdFt0I9m359GTc+8MFWN4bRKoSRWQhMcUxVE+k/C+16HuBwDPEDP7oLmke+phIxpWEfRelsGiDDaevEXToCjPKulXHBotlBJx0Xq3Bo1jjdP+un9XBFG3e2rc4LWzUNkILfgkk0TU/JBSK3DIs+gJrq9k=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by MN2PR12MB4159.namprd12.prod.outlook.com (2603:10b6:208:1da::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Thu, 8 May
 2025 12:54:25 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282%7]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 12:54:25 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Jani Nikula <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] drm/dp: Fix Write_Status_Update_Request AUX request format
Thread-Topic: [PATCH] drm/dp: Fix Write_Status_Update_Request AUX request
 format
Thread-Index: AQHbt1nr3/aHG7++OkeNXsWgnC3TZLPIdQkAgAA2QmCAAAwOgIAACFZA
Date: Thu, 8 May 2025 12:54:25 +0000
Message-ID: <CO6PR12MB548976F0F1A7DA5FEDDAA901FC8BA@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20250427095053.875064-1-Wayne.Lin@amd.com>
 <877c2rv7k3.fsf@intel.com>
 <CO6PR12MB5489386C2D4F5D6DC49FF27AFC8BA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <878qn7ti02.fsf@intel.com>
In-Reply-To: <878qn7ti02.fsf@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=9198d5ac-fa6d-4051-a24f-e11975e6c6a4;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-05-08T12:48:42Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10, 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|MN2PR12MB4159:EE_
x-ms-office365-filtering-correlation-id: 73444827-2d0b-4b67-cf91-08dd8e2f7629
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?4v13SjJMA2B1I4lipo74KTVpnPPHW8hsHC77ydefyEztdEmoHTHDyxrnv9vi?=
 =?us-ascii?Q?CKQU4w2gS31jqGD+yjz25N3+3TH2OwEk6yzEzugAp7rohGsVoX7bGyFcbHHO?=
 =?us-ascii?Q?xZr7C2ACfErm+uJPMsLk4f9/BD5KbwmzgLK8qgaWkxZoOXTGqOlvGdz8ksQN?=
 =?us-ascii?Q?WG7p9OOWw4dyvuS84abnPr6tqv/tIMkJ7vPfqYp188EeBTWA7HEXRJnQ5YIA?=
 =?us-ascii?Q?I2UI/od1qICqRqxfPjqdQtZ7slEoJFLSpiAC2yo8JtxLdjIVM5QZ9HDN9apU?=
 =?us-ascii?Q?fl7GNGFG4SBcXDIRzQ0LmmRRo+9i32sybvRjzufwshJ17nvtDDWfebI3TMoL?=
 =?us-ascii?Q?wO4K8nAI4tZMUe6UpT2CkZd9dzwoVECqtmG+C9rZUd51xH8HQqWS/UeDsLdE?=
 =?us-ascii?Q?7ywP7incxtc2zS0Atcv5IQud8eMY4exhxUkIgHGXn/MmI42QSzrX0Qw7vgmo?=
 =?us-ascii?Q?lJaSGakRnx1Rzt8aY/6wIEpgt4NW6f8agaAelHSNgCPCqopnQpQdhN95EwFG?=
 =?us-ascii?Q?+/55vLx4vlKe2evV9qju5+j02CFMoIAGbJ4LLlD594M5JgWK7L1gqIM2TgAc?=
 =?us-ascii?Q?AciJwZgs9FyJ6LKUavTsESVcme/qzQ/hsAJuVHVN1I/XwoPuU070z5KNAoki?=
 =?us-ascii?Q?T7RUJ8Qc+zRogX/y1xM97M7gYbI09gRgT3uo7wcK/yDeTS4fmShDn5Vqz74c?=
 =?us-ascii?Q?A+PEBZIIyxgYttZ0T/3JGYx68brwSnP+Y+s85Z+Dw5BdeDnTb1tzLLFnyqM1?=
 =?us-ascii?Q?G3w1T8+PdADy0tDvw0Sy1lurEbBGzQStkYDvd7hxw65bE+e7i/R37hKxoyn+?=
 =?us-ascii?Q?yy44JBo8WFzbuW8WYUWi7g1399ctltyRE5Nx7ECVy3XC6roTL6Y79MQAFwzZ?=
 =?us-ascii?Q?uZW1HIBgYE5FeUupvflpN6p+iLoS0hU91+hprP6cXGjhfl1VEu/prmkXVd45?=
 =?us-ascii?Q?uUGa1UQfqiv2aJuvgtKw35yhI4vgW8BGULoHnbfHV/2YM3tMlfBmjLSYEEDS?=
 =?us-ascii?Q?mxz8KylrP6LfQX/6TF5lamrjoe3GOeeVUBHdFyWGN2CmzseVYOlCOMscxbYe?=
 =?us-ascii?Q?acumwhThnZrnRhac8A06kWAxwyNxDDhRVFGheFObDkzXtZjnHgQaeVRQASvF?=
 =?us-ascii?Q?jiG26ZCwSt1tftHWYK2qGWGKL5YiH8FLx3aM1gYcK4jqNVhDVYDUJG8fK9E/?=
 =?us-ascii?Q?Eu0G0LC1qtUIdFHQ0jNhCFWL98R/9AeZOycHsl05eSLBRHIi8m0HVxc9ufig?=
 =?us-ascii?Q?EQpkzq1KI6ixNq26Um+zEeAvWnQ57o7hvnOKqF4ZMoAlyBTauIMbP2r9DsEz?=
 =?us-ascii?Q?29XTKCig/YuhsVarpVQ2vYmiV0W3gNdZwZYIi8lBCEL2+tZ2NVL9QikBfYP3?=
 =?us-ascii?Q?pEUHOjJhsoeqJG7EPnYmC4pidqZAO3h1MIAZs/ckDwkNgi/BZNIeVS/RsmRY?=
 =?us-ascii?Q?7r7HfXFyzIcTbIItgiu0nwpLW3NOG+dm+/toMIf9K61l5AlR55SQw48JDhwm?=
 =?us-ascii?Q?Bl2oqECxbXn2dyA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?z4uCHrgQIuKfUcvY+aPijgHl/Xr48P2QgLAj47COIQf4gU2vqEWEDAoWK05W?=
 =?us-ascii?Q?cXe4KuDZfl3YEjtJyOvRXUDI3LdYl3OpxkxcrbSUQbftdurOwOM/qM8sp7zG?=
 =?us-ascii?Q?OLDkjxvb3P0mYbcKAIDTcYGNwk0S8r5y7zIPde/YO+GYv++S99tQIZUaWgV9?=
 =?us-ascii?Q?J1cuOrSV1rTFO/JMEeBML5ospLJgQiP5AR/ytPGS9prKQDjdzZ+4wU3upe59?=
 =?us-ascii?Q?YfxtuZqkxd+lx4zkkkiz1mJyRUmCjnECYRpvNdx8Xlpdqu9rF3HOHEzX4coF?=
 =?us-ascii?Q?PzfN03RL4WDpsbIo4F7Em54m2MV7Rf+ERBsalikTu91y5FITfrvsr5aGCEJT?=
 =?us-ascii?Q?h47IeB+S1aUVaWujZAinBUI8Aiwp8F9jLlfjiqar5LHSYYlZFeUTs0M9Xsw/?=
 =?us-ascii?Q?sGJFKRzPSIc6/tZOAn3MjUdYpmTcCBVOkdy0ZgNEGjii0eIhvmfxCG0QBJbh?=
 =?us-ascii?Q?atbiHhTJnJNacLrQ+bXw78Omxo35v5Pi7cnxzNpWKTeQLa89JfRXu+7GuID7?=
 =?us-ascii?Q?TbIaGuBlomHSGWLjlsUOl/iB5gE9D4FcTQ8YLGIfQAkKVpkNH8MVqN9q+z8b?=
 =?us-ascii?Q?85Sjz0Qc5SkHUd4CXr1cZ9qEZPDv5yjy3uBJYnSKcl0AiyFBTNrzdIy6Z2RG?=
 =?us-ascii?Q?HuGb86/5ZGKJET6etA0ns6k6O2x2jiFnUwnXhijmV6F/v9tI90xqNBVgfgXj?=
 =?us-ascii?Q?y8odcMUvJv8fph89eFg+bcDzRzQLXXhJ0e3fDNdbWLrSw1LF/ueapmkgz1mU?=
 =?us-ascii?Q?bwKfDfHehZAqRbCtIyjPuWB3e51Uyl92nTdrmWno5xfkmgSE/GYp+dBf57/3?=
 =?us-ascii?Q?YFcWR744NRPlpz5IuFYXDGpCf8w19H8I4JaEaF6HG1gMvi+7N4SXWmeK7FPs?=
 =?us-ascii?Q?ucqKwpWsfknHOpA4U24MDpd8MVquYo4WxBruKEjcKHZ1dat8fs3Y5uC5jMg/?=
 =?us-ascii?Q?LM/kduOPKRvqIxb5SeiboZJVn65fKg7Ga5a6Zpe+6MG5D4uLkgnF5U0M4FGC?=
 =?us-ascii?Q?LDo08je4edvj8UdLxzSALdW9qFrndnQ8NhYJ9JW2eUvkv5xDye3Pu6P8rmw6?=
 =?us-ascii?Q?fNkcPsapEYPwBUT/7rZe8M/1gjkuR3CHvl909o4eMUo5qny8KGpw2dxTrsJR?=
 =?us-ascii?Q?W9mwLmhKdBkwBEqxI68AXz8tOS5T4Zurl20n4rxgHTp2mgq6Rq3sZ5O0IsNh?=
 =?us-ascii?Q?p603NXGs54Jn19elJjWZgAd+MPfbzewBhgt/M+DOEpPGu7gKgTXyCREwhAEm?=
 =?us-ascii?Q?7vGaOn0+jLYUP9NocpvHMidi2CrILKJBPXh6sF4jK2jwEVBQ5svHPUNMEbYt?=
 =?us-ascii?Q?Kdyl8BGgCdXl78d+dE6ej2KU1jOiCARsvbZ7nR3ZMo2Mi55WDuHzEPrve8x/?=
 =?us-ascii?Q?khxnXByLB8V67Pcav+tFkutapC5XK83yHahve6dKKbyDZNzr5h98TCdnudEf?=
 =?us-ascii?Q?/MiT5sc4cRbM1UrcDYtZ8j8T/h7ptsmJXF2RoMnqkfIFmF9zKySaH/rV/Edb?=
 =?us-ascii?Q?DrsAOAKq/Onz1C+BF1ZYim8KI/HZ8yV+WnlEmclmtIDbYIwj5QqXM3zkXUZ/?=
 =?us-ascii?Q?p/QGhPSV3ITVPKOHg6M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73444827-2d0b-4b67-cf91-08dd8e2f7629
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2025 12:54:25.2955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xaGRgX/bgojwQIbIqb9lLbBwRFpVtJnqM75TuVDMo0RJJUjIG+44DttWB/pUe/DLeTTjk4pQQU/Wf5xN47DNZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4159
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

[Public]

> -----Original Message-----
> From: Jani Nikula <jani.nikula@intel.com>
> Sent: Thursday, May 8, 2025 8:16 PM
> To: Lin, Wayne <Wayne.Lin@amd.com>; dri-devel@lists.freedesktop.org
> Cc: ville.syrjala@linux.intel.com; Limonciello, Mario <Mario.Limonciello@=
amd.com>;
> Wentland, Harry <Harry.Wentland@amd.com>; stable@vger.kernel.org
> Subject: RE: [PATCH] drm/dp: Fix Write_Status_Update_Request AUX request
> format
>
> On Thu, 08 May 2025, "Lin, Wayne" <Wayne.Lin@amd.com> wrote:
> > [Public]
> >
> >> -----Original Message-----
> >> From: Jani Nikula <jani.nikula@intel.com>
> >> Sent: Thursday, May 8, 2025 4:19 PM
> >> To: Lin, Wayne <Wayne.Lin@amd.com>; dri-devel@lists.freedesktop.org
> >> Cc: ville.syrjala@linux.intel.com; Limonciello, Mario
> >> <Mario.Limonciello@amd.com>; Wentland, Harry
> >> <Harry.Wentland@amd.com>; Lin, Wayne <Wayne.Lin@amd.com>;
> >> stable@vger.kernel.org
> >> Subject: Re: [PATCH] drm/dp: Fix Write_Status_Update_Request AUX
> >> request format
> >>
> >> On Sun, 27 Apr 2025, Wayne Lin <Wayne.Lin@amd.com> wrote:
> >> > +                   /*
> >> > +                    * When I2C write firstly get defer and get ack =
after
> >> > +                    * retries by wirte_status_update, we have to re=
turn
> >> > +                    * all data bytes get transferred instead of 0.
> >> > +                    */
> >>
> >> My brain gives me syntax and parse error here. ;)
> >
> > Appreciate for the feedback, Jani.
> > Could you elaborate more on your concerns please?
> >
> > Since Write_Status_Update_Request is address only request. Data length
> > is 0. When I2C write request completes, reply for
> > Write_Status_Update_Request from DPRx will be ACK only (i.e. data
> > length is 0).
> >
> > Is your concern about returning 0 from aux->transfer?
> > My thoughts is drm_dp_i2c_do_msg() is designed to handle I2C-Over-Aux
> > reply data, and aux->transfer() is handling hw specific manipulation
> > and return transferred bytes. For Write_Status_Update_Request request
> > itself, nothing new to be transferred. I think drm_dp_i2c_do_msg()
> > should be responsible for determining the correct transferred data
> > bytes under this case. Or do you expect aux->transfer to memorize the
> > data length of write request?
>
> My concern is that I don't understand what the comment is trying to say.
>
> "when i2c write firstly get defer" - what does it mean?
>
> "wirte_status_update" - typo
>
> "we have to" - why?
>
> "return all data bytes get transferred" - what does it mean?

I see. Thanks!
We can't reply 0 since drm_dp_i2c_drain_msg() take 0 returned from
drm_dp_i2c_do_msg() as error. And it actually completes transferring all
data bytes.

I'll refine the comment. Thanks again.

>
> >
> > Thanks!
> >>
> >> BR,
> >> Jani.
> >>
> >> --
> >> Jani Nikula, Intel
> > --
> > Wayne Lin
>
> --
> Jani Nikula, Intel

--
Wayne Lin
