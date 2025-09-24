Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B26B99282
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 11:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3704A10E6CF;
	Wed, 24 Sep 2025 09:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="257UNBKe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010037.outbound.protection.outlook.com [52.101.61.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DFB10E6CF
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 09:32:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yz+ylSOoFN64jGjhe9T2SvujHxsAHbmRHhdvpj2MzFBf2L0YqPxH/ekj2EOgjN+9q3OkFbPYQRdBTGBQUWdKDOGaNlPzYFAC4UIjrmVBOXsSL5N5ur10rRBr2f6jjuUMh+ijLJwk70hrZtKrY8q/ckKDeSiUWnKDG4757sSNy84jARX5W8L69u5dNC1C4uciec0C0JFSUa9wCr32kutpBNCFbp842476BGCdEKuf+URY5iZcwlIme5punoYx7jn41Hizs+gyfgfX8BaxnSG3MpbCZ+TKtQ9Vm8lsEjmwpA8TRUcUxM5k0/zSyA0z38VNASfp9qEx7RFCsuR3LRE8zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fa3uZc+Zhdc8jNiRlZKyuyG8FU6Kd3EPLZ15L9lCzyE=;
 b=imdhAZBNSAezX83QVZODJilVT5ePpowDOVopzHNqUH4/ftZ5vavwpIT8pGlbLJlYAO8HboLmexURS8p6kwUaft2nbC7jT7xJrmxwEC/xRwWGwYZzxOmSf1jZjizQ9Pc6qsI0JUOri3cBBdjoy2VY+KteeMQEnlhbtbldszwYpusuKzO/1nEFpKd5Qe5z5Y0RUjHcsvoGGmcV77dHGlopv3KkSUwJsVJxfHCvkBN2aphZe110oRFStzKP2SLCVI9ZznCg54LBYH2FiPsbQ4VHEvUS7dc8eFwoIhTWspgT/N8Y8jAiITPdEFIZPBwGjGj7/NoSKrjRsREiQCjOYHSDTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fa3uZc+Zhdc8jNiRlZKyuyG8FU6Kd3EPLZ15L9lCzyE=;
 b=257UNBKeXf4k7Sw+/V/gkv07pEtpjNBYqMD+g7IQzZl2/UXIUaBwiKGO5IiX30Ixjb6UoSYyBtXB0Bvr/HLXPhY0/4ooJ2fCzMi9iV9UADaCsZT6uofjpDbfHs/bupzyinNKCA4OVz//+yN0CpwLPM+aWl53FFKMgXB0UYze6uE=
Received: from CY1PR12MB9583.namprd12.prod.outlook.com (2603:10b6:930:fe::18)
 by BY5PR12MB4115.namprd12.prod.outlook.com (2603:10b6:a03:20f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 09:32:27 +0000
Received: from CY1PR12MB9583.namprd12.prod.outlook.com
 ([fe80::ac1b:c950:a7d9:7d54]) by CY1PR12MB9583.namprd12.prod.outlook.com
 ([fe80::ac1b:c950:a7d9:7d54%7]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 09:32:27 +0000
From: "Tseng, Chuan Yu (Max)" <ChuanYu.Tseng@amd.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 =?iso-8859-1?Q?Michel_D=E4nzer?= <michel.daenzer@mailbox.org>
CC: Derek Foreman <derek.foreman@collabora.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, "victoria@system76.com"
 <victoria@system76.com>, "seanpaul@google.com" <seanpaul@google.com>, "Li,
 Sun peng (Leo)" <Sunpeng.Li@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [RFC PATCH] drm/uapi: Indroduce a VRR Range Control Interface
Thread-Topic: [RFC PATCH] drm/uapi: Indroduce a VRR Range Control Interface
Thread-Index: AQHcI7gZf8Th5B5kL0uR/XQemuhkAbSPj50AgAR4RICAAF3egIANrtcAgAABZQCAAAdCAIAABK6A
Date: Wed, 24 Sep 2025 09:32:27 +0000
Message-ID: <CY1PR12MB95832CDC0C7D41D10E2A3149E51CA@CY1PR12MB9583.namprd12.prod.outlook.com>
References: <20250912073305.209777-1-Chuanyu.Tseng@amd.com>
 <010201993e2cb26f-089ce007-9e30-4b79-b487-c16c360309fd-000000@eu-west-1.amazonses.com>
 <d8694d69-62b3-4418-9fcb-d37c1daa1f9f@mailbox.org>
 <010201994e05ce63-85ad5afd-fc09-48fc-bd6e-f3716c8ba09f-000000@eu-west-1.amazonses.com>
 <aNOtCLd9rzKuqMSb@intel.com>
 <cdb28aea-e647-4b2a-a5e3-1ec60f05a4aa@mailbox.org>
 <aNO0Snb9m5Nsf3H6@intel.com>
In-Reply-To: <aNO0Snb9m5Nsf3H6@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-09-24T09:21:59.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY1PR12MB9583:EE_|BY5PR12MB4115:EE_
x-ms-office365-filtering-correlation-id: fb85dd7e-2817-4ddb-e6d7-08ddfb4d468c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?GKASDpSMLyUu3MYxAOg06kdsx2xQ1xOhUjHG8L6bBtZlmp59Ae/UswePRy?=
 =?iso-8859-1?Q?I77z+vK52R0pht6mYF1dd6LG14X1TmZmop5eSBS7JpEyTc7CRT4E23gijn?=
 =?iso-8859-1?Q?u8VLMkkkZkuy1KN1aN7RL6GnY3jom1s2FCKf+c0i+k3wo95Einy6OhDKmD?=
 =?iso-8859-1?Q?QKxlXby/OHnWQvUrl3vmdZxmeObC28CC5thO+3DJdBZ64J0iwlbQCrNID5?=
 =?iso-8859-1?Q?MIl9Yrx347tdQb3tpJc7cu8FqwYG4VIQOZi0f6i7uKWdTSHMlHP1MN/GWq?=
 =?iso-8859-1?Q?FdZMaNSiVMcdodx9Wh1FAYLwImbHHhjR2rn2OVtnn70hzXs8jNgOtmS7u8?=
 =?iso-8859-1?Q?dwcMnzxFY6MEMIM4Sc83FHlWY2xQ386lK6Hw7fhKnfKk+8lzBvhfCWgIQz?=
 =?iso-8859-1?Q?WAvrH0zU5Fn7aZG9ctwCjI81qFkR4HCn2ZXTnAg12FX+gC/FZQMRt3aX/u?=
 =?iso-8859-1?Q?mfWmmaIqo83TwrRQ57J9QW2TYeiswROmp5JtqewwJQc7N+M1W89tM70jKX?=
 =?iso-8859-1?Q?6eZpHOpuPu2Tk0RKyO7JOtw9Mfh71y42RtPbJUy1c/4+QkuoiCbg8IUNk9?=
 =?iso-8859-1?Q?fW5ul3SDRSz6ynr/K7/GbtCt1BTzvT9rLaWDDjRch8Bk7jeDmy5wkP62Qa?=
 =?iso-8859-1?Q?4+VOF4CJmdnc/be4wyW95CeC5jZlhdNPdZ5r6h2O27mKb7Q7wsDQBWQp0X?=
 =?iso-8859-1?Q?OifETqHULNbjUx7a3RBphOIzngxYuIYvSgOvQdDPu5R8tuKUsi88i+iJvo?=
 =?iso-8859-1?Q?TO77b8ocsm91dhgkSt1pnMTWv1OTg0+gsCSy2VQ0oWFAtIiXttu2zpgTR6?=
 =?iso-8859-1?Q?Ofzqp6wHwPkoKjnrhwWXgekG4ZjYRLrbwkpYpehW0gEM0otuBUTsC175Kk?=
 =?iso-8859-1?Q?rIN3iIJOs9+gKeYShK3UByAxPosxapHyi/RZ9bRhaYMkJxgtNerQUtDtoF?=
 =?iso-8859-1?Q?8caBtz7yvtMH93iyk73bo3r7MyuAhKLTUDPNRTkILSM048fS9q/fIrddDp?=
 =?iso-8859-1?Q?gthEX/qWI/Vu96/SNnETocDOYuLaDJWc79kkxYeoSxKlCm7owbhfKCpF+/?=
 =?iso-8859-1?Q?WwdA0Gk1PcYFJweTl4LKmDrYYhzHsNpwGEc2/RQL6FFL/RIQ83v0cmIs57?=
 =?iso-8859-1?Q?yrgTC7qSwW+InT54zYDlyePZSQfvtkvtOFGQGSC6oxtT7/6g4W37nOyVZg?=
 =?iso-8859-1?Q?WAulPUIMU8dFMu1BN6g8Scic2H1oCsRXUi1RfTWZwfEge5GqRNL5eG0hPA?=
 =?iso-8859-1?Q?3fEEQvacGSq0+GKiHhjzD8+Ixk+rZAt1c8TNMOIBdhQbOoJ4hvjcws22q4?=
 =?iso-8859-1?Q?HR6O93FmYbs6z8jV+gsAc9jUM2CFsBimTmSp7mbcaPGwzNT9wwksia/b2l?=
 =?iso-8859-1?Q?PeZM9ojhZD7PR4rIL2z2JV5O2vFy0UZZv7yGCTfUtnOK1iZJCvsDUZSxTp?=
 =?iso-8859-1?Q?7W4H1aASOI5lG3sEuJyNGMD1ODGAVzKaPr/UC6ppMW8haqntUNd+9tWmMF?=
 =?iso-8859-1?Q?nJyQFz8p++c9nvyDad9MZryx1yDgcdezeAGSst6megM+l4sLgwuqSM72BU?=
 =?iso-8859-1?Q?E5MEb3M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY1PR12MB9583.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?qR3G7rK4jkWOYBWoKnomXbk+1hMIoEguYX7Cta3EmSAD3D/Rmv+sFGVMcX?=
 =?iso-8859-1?Q?JXrR2cN3sMRAuxBIRuHbUTM074VVK2biI66tMOHf7hzUkP0UDWeuT9F5dI?=
 =?iso-8859-1?Q?bSXxje9YVr3UsDO84DJTl7PHLjZX0DTloagbWVaFomMz6WrqCKNBgLZB26?=
 =?iso-8859-1?Q?tP9mbUzNBTztz+SXQapCBsDl72ygZ0ReW55sP+FHldemIAd+zCXPqa6CO4?=
 =?iso-8859-1?Q?9+dkrT66OjEC7ztVd4OLKBCuiz4nSaIxsxfPbKSK/qqts2n2+1xjRuHqUT?=
 =?iso-8859-1?Q?D7UAWJ1GNh30/edc+ObvxdDEPLh4pc5VMrWNfQVUABRBZAVJ2ZZsuXzeUR?=
 =?iso-8859-1?Q?1m1Cibx1hFShiG+E76YJAG1je6HfnPJMRPQRCb2Kfas04rrVZgA501m480?=
 =?iso-8859-1?Q?k/zEbvRrqO1du5Gl3QQ5wMWDfEQIK2kYCTgvw3PjmJGHnEB8OaebmlK7eX?=
 =?iso-8859-1?Q?Nz6NoWIOi3RT+lj8mBAIwy58j+jTx/BKAVcsZCRAgb9XMvOmfTiGfggVlo?=
 =?iso-8859-1?Q?0ubcih3C9bF6jbflVrRmCGhjjipYOtNwXl6haa4JBVCCGmQNqKFsyUOopW?=
 =?iso-8859-1?Q?RL458Czx5/fc9eWKhh3RT8Oe3A5mnbWCOQnvNMPzbL3NH3Uy2z1wpNN5p6?=
 =?iso-8859-1?Q?p53xRrDli0hugD+QzLmhmoh33kJOFDHIJ4NMtsFJsq1qFyB2ic/0vtUCIB?=
 =?iso-8859-1?Q?pTeFobmLNaGOLowHJfpc1R7r3wIRrnoesyJ0edUdFI8RN431azuoe4nwZ2?=
 =?iso-8859-1?Q?+Hn6gz7ayC0OvZx9VGj/zRrZBm9iB/QEq84lSpWdLOtfbeo3Vg7bIhzSao?=
 =?iso-8859-1?Q?Oi1WajGkeIDjH9opQIbqcQeiW4LO7orK9c57CeMRxQBCuW1xjYgU6JFj/h?=
 =?iso-8859-1?Q?wKMs2DrNLL6Pu1xVTpcwLkiBK0TOqHa/GSQorIcb2WRlmuOGbXH0RhBJJf?=
 =?iso-8859-1?Q?BBu6MUj9lpyf9hU3bpXO+T9Vzy1n/6EWNZCmxZwDPaeAfgOTYv+i100w/c?=
 =?iso-8859-1?Q?O56zf5ZaK+S6oXTyYFDZb9x/b+Nb5NpCerJmgm93Y7u/24sbM5U2sYs1Z5?=
 =?iso-8859-1?Q?r6PK8/PRUDDs1tT1VY0BKGZenjsc1hJVCZmYrmoduZ1X61+bpOHJYjJ69Q?=
 =?iso-8859-1?Q?4KT0xOjuGQTePQp36OjhYLpaAA3hpk98HsJKL4NAlhzmmbHQXNyJ50hIhq?=
 =?iso-8859-1?Q?tMSFAyBHqikXKBGhSh6GwuRs5EMC2Zh3fr30Oq4dYeD2awqU7q4GSt3Z1c?=
 =?iso-8859-1?Q?DQEvi/0IeTatRMux0YXgSS2YFebz7XtHqLGGHLPsKlhIfsJpG5g0Ktqe+Y?=
 =?iso-8859-1?Q?Zbf0OgvfwCC9qDZStOSrtSM05HWJGJ85T8XiEGGLbgpq4JZgjs74qKNqsq?=
 =?iso-8859-1?Q?qBUm7Nl1L2ncXXoBLBIOs+bKTS1n6R5hTomX+IGsu5z7e/44NJX7qksOko?=
 =?iso-8859-1?Q?aNv0Y4rPEjEPBq7y5Cc4ihzsWLgw6ZA+c9mXeDvdwbjJZVlWxmx2SF9Awo?=
 =?iso-8859-1?Q?3lfGt+e/5o3daJcrrO2uP2MNQOQpswq6qDuoNRKgQVl5Nt9XZXE/cQ7107?=
 =?iso-8859-1?Q?EDktTMEQSxdKvmS4jkhVOnQjiI3xaKJlU29/Jf87a2l4rlLcF8UEXI6Jpk?=
 =?iso-8859-1?Q?0zT2VzyR97icM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9583.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb85dd7e-2817-4ddb-e6d7-08ddfb4d468c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 09:32:27.0959 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AlWVaGXY4KmB/ZWlzjeIvbSMFT0cY49U60YeSTHcPZyGNPsWVrNVsOZkVL9Ulc0tkvAkocQOmzqFUldoT7XHlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4115
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

[AMD Official Use Only - AMD Internal Distribution Only]

n Wed, Sep 24, 2025 at 10:39:16AM +0200, Michel D=E4nzer wrote:
>> On 24.09.25 10:34, Ville Syrj=E4l=E4 wrote:
>> > On Mon, Sep 15, 2025 at 03:37:07PM +0000, Derek Foreman wrote:
>> >> On 9/15/25 5:01 AM, Michel D=E4nzer wrote:
>> >>> On 12.09.25 15:45, Derek Foreman wrote:
>> >>>> On 9/12/25 2:33 AM, Chuanyu Tseng wrote:
>> >>>>> Introduce a DRM interface for DRM clients to further restrict
>> >>>>> the VRR Range within the panel supported VRR range on a
>> >>>>> per-commit basis.
>> >>>>>
>> >>>>> The goal is to give DRM client the ability to do frame-doubling/
>> >>>>> ramping themselves, or to set lower static refresh rates for
>> >>>>> power savings.
>> >>>> I'm interested in limiting the range of VRR to enable HDMI's QMS/Ci=
nemaVRR features - ie: switching to a fixed rate for media playback without=
 incurring screen blackouts/resyncs/"bonks" during the switch.
>> >>>>
>> >>>> I could see using an interface such as this to do the frame rate li=
miting, by setting the lower and upper bounds both to a media file's framer=
ate. However for that use case it's not precise enough, as video may have a=
 rate like 23.9760239... FPS.
>> >>>>
>> >>>> Would it be better to expose the limits as a numerator/denominator =
pair so a rate can be something like 24000/1001fps?
>> >>> I was thinking the properties could allow directly specifying the mi=
nimum and maximum number of total scanlines per refresh cycle, based on the=
 assumption the driver needs to program something along those lines.
>> >>
>> >> Surprisingly, this would also not be precise enough for exact media
>> >> playback, as the exact intended framerate might not result in an
>> >> integer number of scan lines. When that happens a QMS/CinemaVRR
>> >> capable HDMI source is expected to periodically post a frame with a
>> >> single extra scan line to minimize the error.
>> >
>> > Intel VRR hardware has a "CMRR" feature where it can automagically
>> > tweak the vtotal between frames to maintain a non integer average.
>>
>> Neat.
>>
>>
>> > As for knobs to limit the min/max refresh rates, technically you
>> > wouldn't need the max knob because that is ultimately defined by the
>> > vtotal of the supplied timings. But I guess if you have a knob to
>> > limit the min then a max knob might be convenient as well.
>>
>> It allows the compositor to limit the maximum refresh rate without chang=
ing the mode (which can involve visual glitches).

>I think the driver should be able to handle the two cases in exactly the s=
ame way (assuming nothing else in the mode changes). But I'm not opposed to=
 having a max alongside the min.

>IMO the min and max could be straight integers, if specified as vtotals (t=
hat's what the hardware takes for us at least). And for the CMRR thing we'd=
 need another property to indicate the target refresh rate somehow.

>I suppose another option would be to have non-integer min/max, and then en=
able CMRR if min=3D=3Dmax=3D=3D<non-integer value>. Not sure I quite like t=
hat idea though.

>Also not sure what the rules for such properties should be.
>Should they be allowed to be specified outside the legal range and the dri=
ver just clamps them, or should that be an error?

It's possible that compositor set the value which is not acceptable to sink=
 vrr range.
It would be better to clamp the false value.


--
Chuanyu(Max)
AMD
