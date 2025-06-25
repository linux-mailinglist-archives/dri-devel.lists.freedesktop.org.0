Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CBEAE879A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 17:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A71510E756;
	Wed, 25 Jun 2025 15:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oEQpnah+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0464410E6D6;
 Wed, 25 Jun 2025 15:13:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClSPZTyJA3Szw2qezfT5PJgFhUmpRV1kVQ0YSisRPqYNtg27PSJmYl6NMQxcjBoFQio+TjEXfEj6Ai39UwCr6CtEYOWjXz3lrYRB3lVR5I1k6Msws4VAO/5r7o7W/Cp6sYmpcgHbXFkbtebt0gre5Mrro4ttG9vLjL58otdsmASmkdm5sBFSfTNVx72IhjRo5w+XCJTGu21iSJyj1SlRVd2CbI2QS71dUA8+KswUwlpE8AwdqZKb35FAWkQFrwFkIsP666pENMRcNiThtOtBzevUN5ZMEV67MuSTWJ2Mqhgn971nzb5UrKqJYUVXqEAq4HdOxegYXsXA07zd6M6shA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLVOW8L2iECngUqlKfKjOfad/p3Pdn+XOp5Mev7uIC0=;
 b=KbTVOqqAbcFpZfUdNgkVHObVaeRjyusGs7bZ5PJQN3zYYmJ7f8FaDad0EXiovq1Rkeszj368AiQYGWCx1IV9AD4vZH6rW6UGo2lI4XL+9bZk3T0aI7O//5yK8Ly7sl5y05sNznqF9ucICNhCCOys8S3j2uA1P9TemEqiz+XlGG8R2gyKu1EBVKEBlwGZDuzX14Jh2gZf9wJtfYuYizlcVqYNtSjRd+Ldqdb7v632TA5Ac4PSe6xQqXjakQAPKJm8Qd21NxxHP6ZYOnoBKhleosWFPwqHvnPnjOCdu5vjn8k1nXTFtU5nXcizfsNKqiLi+mPue58WMXwIfW2Uft82VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLVOW8L2iECngUqlKfKjOfad/p3Pdn+XOp5Mev7uIC0=;
 b=oEQpnah+9WVrAn00PbCujAB2wfjIt/+wtMI1y+blKlD2Yq2g888n8Erost5Km05+yPdUg+zQirTs5sVg2vUR09k6dFlzmvAiWpeAiVg3Or8zrYbM8S2NpfeRoNYhCMYTX0MGqUlDggGZitNAWEcPB0LTcMw8D37vVUe1+LSqBA0=
Received: from DM4PR12MB5295.namprd12.prod.outlook.com (2603:10b6:5:39f::23)
 by DM4PR12MB7600.namprd12.prod.outlook.com (2603:10b6:8:108::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 15:13:33 +0000
Received: from DM4PR12MB5295.namprd12.prod.outlook.com
 ([fe80::d3bf:1e93:439d:294b]) by DM4PR12MB5295.namprd12.prod.outlook.com
 ([fe80::d3bf:1e93:439d:294b%3]) with mapi id 15.20.8857.019; Wed, 25 Jun 2025
 15:13:33 +0000
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
To: "Wentland, Harry" <Harry.Wentland@amd.com>, Melissa Wen <mwen@igalia.com>, 
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
CC: Michel Daenzer <michel.daenzer@mailbox.org>, Xaver Hugl
 <xaver.hugl@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "kernel-dev@igalia.com"
 <kernel-dev@igalia.com>
Subject: Re: [PATCH] drm/amd/display: disable CRTC degamma LUT for DCN401
Thread-Topic: [PATCH] drm/amd/display: disable CRTC degamma LUT for DCN401
Thread-Index: AQHbwr0fU9sXjGoWpkaqoXJGyaoMtbQULX8AgAAUPwY=
Date: Wed, 25 Jun 2025 15:13:33 +0000
Message-ID: <DM4PR12MB52959B28B8A9F944FF097BC88B7BA@DM4PR12MB5295.namprd12.prod.outlook.com>
References: <20250511213847.61930-1-mwen@igalia.com>
 <c128d6d1-560d-4b97-b448-f7bdff464602@amd.com>
In-Reply-To: <c128d6d1-560d-4b97-b448-f7bdff464602@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-06-25T15:13:32.7380000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5295:EE_|DM4PR12MB7600:EE_
x-ms-office365-filtering-correlation-id: 323c5374-f8fc-46a1-57ec-08ddb3fad9b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|921020|8096899003|13003099007|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?2/7MZprf+You33VDWVrQR8tN6A6HXoHs5rMuWMOwcfJpMUchXmo/jP+FFA3f?=
 =?us-ascii?Q?/6g/EI+Zn7O0zk8VYLGjwwvEI99h9D6wSAwOfZhRMO4Is02F0lC7uu0IzzSH?=
 =?us-ascii?Q?4ngMEizdFhiwDLXfverBQzz+n9zYpui8b03ImFMxMwnnIa9GrxvJXI2cmNM2?=
 =?us-ascii?Q?TzBipNZKgOxFRjwKErq1640QFW4XXv4AIZoVXIaSNwdzcuISAhGXRJ/QC1vk?=
 =?us-ascii?Q?uxszXf8f5C1gtp5Xo16xgI2qGqujMkbX71vAYqJ21CJwckDDiLNo3Fl21xVH?=
 =?us-ascii?Q?KTkGUJS0eLn8YGO239dHBzVMNmrk3yqmS5nrzOWVyZH1Mw6H6ab4Evqf9m+i?=
 =?us-ascii?Q?y28XbQY78Fv57LparLHv4+SOENf1AvLTsvIUEN3pU+tq1aQC8+yIyqHbeS/i?=
 =?us-ascii?Q?XlykCVvdxjvQeXxKHaUq+CRHY7tKCUyJWqgKG1uerm/29sX7zgoOSqPIUufL?=
 =?us-ascii?Q?P06Rl8E9u6SoLHYWo/cm3CpOOzDd1dQSXzoFIYK3DIFbTRuo8uI/vID/bvHY?=
 =?us-ascii?Q?z5tFTPr0ydtFhYgeN/e14pbXsWzKWNbQfMNtEI23jVAJxIW2XyEFRfBHL5+V?=
 =?us-ascii?Q?KsjVy5ZcodbyGyMk5ZWk8/Qp93eY6Q2GH+4AdFl876htOX9rgjWl5OHgFlIS?=
 =?us-ascii?Q?nXorc5X3rjdSrCmNAFtI7iHYimK5ERq1HTTFqpWqYnTqoXfbvjv0JoaeTV+3?=
 =?us-ascii?Q?HDlXeuz/tlSMGFKJZSfvJ/QA641vhhuxH7ElcCltNEbRUGhxMMBPeIfCPid/?=
 =?us-ascii?Q?+wyNpDY3doOKw6WvQ91RSxl+SfkB569yqzfioAkEnvdlEG94SO0CkHCqXU89?=
 =?us-ascii?Q?+gT2O84p4aJDwjdXmlHkhtBOM/kOT0CHe11buGghfnQ55RFiOodzU+7DCH8x?=
 =?us-ascii?Q?fdhWFY7a7kp9QENt+E0czMRahB5yzJwBlrEFYVcymJgiRQbulKfvljY5XRfR?=
 =?us-ascii?Q?giTf1NcRXjZ9ORm2yH+8r81sG7D5EG+Tsvh5AN0upbAt0GpQEDvfcBADFRH+?=
 =?us-ascii?Q?GGZDfd0X9pH0qVnZ+GhHAQVfDseV+9xW3N+m1+8DkrK8/0VZtI1AOCtoUecn?=
 =?us-ascii?Q?WAL12hLOD8Ib/A5fABqp2xr5XvPR+oE6K1Y1kN3mBRFoSbB/GJSJ7yQLioG+?=
 =?us-ascii?Q?cabJGjV738PAj/wjQvj4OX9Rer3q2L0ySpEDGgOr1DtLsFw3LnOzyI9Ork1Z?=
 =?us-ascii?Q?C06GB5PTnzO7LtPQutxrxn3wtChos/ZQi3MQbrnL+56x5fQNJKqxQ2pJoliU?=
 =?us-ascii?Q?4gH4aCaxy3AQehTAN67UvxgcFqBvhr5Jk14YwlovwfxHBtLMveOqlT0kQ8YR?=
 =?us-ascii?Q?KT0aKLgsTdY03V/ZtroO8kVc/BnxF4CjG288TZ1dJvDjOv5V3lCN0s+Si9eU?=
 =?us-ascii?Q?3sMHoUeSXCI1cK72j4k188PnwG39CPj5V5uEOmFI8fhFR7qKrl4NGdsVqp0i?=
 =?us-ascii?Q?YUe0ihrX2ozZ7q2Kg20kkyBnevrifhi9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5295.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(921020)(8096899003)(13003099007)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eUJHmBbfRCogDP2u3rZg2GcpZo7gWzXh4cKwZ2xOXJ3eMUQf5gwWZ9BUBCD7?=
 =?us-ascii?Q?9iavJHMbH0Vuc+0BPb7IweHFLG09zY36G14oq0KSkHAE1+aqTH2PXeo1cCs8?=
 =?us-ascii?Q?frhBIMSy7cGnUn13M3DEebWMqIP9citBXd7BHSxOdrrxLtSxVetWOXxia5IR?=
 =?us-ascii?Q?ti6Kld6oo+EIOmR/VCE1ExXFFq1TDQPVJnylX6knsXZWux1CIUzoZoi9oNbq?=
 =?us-ascii?Q?7gEMKfrRGVL/yiqzY/0sTA7FeoCRRLVJol2BMazHtBJNYaM0QIfR7jW68+9s?=
 =?us-ascii?Q?EU6ZlUOtxmgr0wPGSrZ2ENudtE17bpziXjhDfXccj3PlnEd58zdqE0mem2fG?=
 =?us-ascii?Q?f/wPDG7Ze3Z5ZtHwdhTQ92jmnGobkJfqU36Kdqfw+ChlIN4Ywf6N0Z/ONFD+?=
 =?us-ascii?Q?YGPP5eS3ZOInp07B5ypyyujKLcH7md31ftzjJ3BUKYdPxqb9V6G0MOLA2H5r?=
 =?us-ascii?Q?H3p9+BQCgK4UxHHv/MR1ZwoaKfqMA7+8uC5geb8NYHqULV7On55n0Ok5HhLI?=
 =?us-ascii?Q?aVSgHxB/h8/eRkHeuzn4lBoBIekX42LfWmQZkUSOjG/OQWIhp/z4n+MXcqme?=
 =?us-ascii?Q?/nssb/4iBQj+C7TMjyNHztoiqF36eHrrkqYK5VwtAOhnxMX16RFPF9GNQGX0?=
 =?us-ascii?Q?oXEOHNJZTmy0Vab2z5yW7fHpcAYS0/956h2PxXMX6kZJPdr52d23RrOrT2bv?=
 =?us-ascii?Q?FW99HdR746Cp6UZXLHpW7J/tMz7a92wx2Pl8vhKi8CMKKUq2sPXoebr0fQtf?=
 =?us-ascii?Q?B3k2+B03qz3vkfHi59bNgGt3BF1MJ9s2y8GfZ8MrSGrlVAlncYa14eUvR2Xy?=
 =?us-ascii?Q?vgNO1R6TxfyuxqABG4zEzHN8Ro2n9e+qHquFQJ+S4DJLLa13y34uhTgzGOAo?=
 =?us-ascii?Q?zvuv2K2xCBBV9boodkZ0iDofJH1/nLin6vDT5E8XNMWudPWufZswAR1ZD86T?=
 =?us-ascii?Q?Wah02L9RXNB9CjiKJkwEYVJtFCbZ0ktxMiJnNPWaZ9BxpoyJ9swC+VxJ11kH?=
 =?us-ascii?Q?imcXzLO2ZDB/TzZXM/ako03Sz30fajkBGJkOECn/8g82TmKM0Cxh6xaVV/PW?=
 =?us-ascii?Q?+loU6RHQ3UL78pAKjJAdvQaoZn1nXnqH7eoFZ7GiUQQosQRiaq2IXqeb2N0z?=
 =?us-ascii?Q?q7yySoD9qFFWf9z1QEHKwPeoKTTcnuTCieV3yQIoJ5DUY4zMq4wVyncrqCPQ?=
 =?us-ascii?Q?ZBdVpihdlEBNwlWATxO1VclQffAww0ADnGUscKGtp5JkspTU63YZNzZ1X2yn?=
 =?us-ascii?Q?kdtAjeSx7xda5GvqZTMptcm6YPyJh0jpOErD1e/YbvqZQarNIralEMBqKRuJ?=
 =?us-ascii?Q?mBTuGAfUkZDExpLIO3Cg/P7w9opMe+IbbRGyXVbJc9n4AhMv9UTd7HWf4WDy?=
 =?us-ascii?Q?nREgL/HldmrtFR2xc98a7q7UKE7Bjd/N6EhFvqG2Xr865BKU9dkgeFXC0tZW?=
 =?us-ascii?Q?5JIFbXtqUdAOtHHj3Vxqbd+Ja257dyUlSLIgnRqTnihK1TZ+34+de4HtifbW?=
 =?us-ascii?Q?a9doa6VbJhMliRgfgdpvou6Q3XvIHVMcBpZuokGbY0v2X72j+suVbvvAV9Nd?=
 =?us-ascii?Q?EJUnpk6VnzAqE7m8NOc=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DM4PR12MB52959B28B8A9F944FF097BC88B7BADM4PR12MB5295namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5295.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 323c5374-f8fc-46a1-57ec-08ddb3fad9b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 15:13:33.2300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xgGcAypCD+fGyMJXk9IBPXOagsu8qHrKqzPbOnzzQwwt9MAyq81d4FEyS0pCZTJuAFfn7/oxw5rqceEEqOr79Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7600
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

--_000_DM4PR12MB52959B28B8A9F944FF097BC88B7BADM4PR12MB5295namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Thanks Melissa! We will add the patch to next week's testing.

--

Regards,
Jay
________________________________
From: Wentland, Harry <Harry.Wentland@amd.com>
Sent: Wednesday, June 25, 2025 10:00 AM
To: Melissa Wen <mwen@igalia.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>;=
 Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christi=
an.Koenig@amd.com>; airlied@gmail.com <airlied@gmail.com>; simona@ffwll.ch =
<simona@ffwll.ch>
Cc: Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; Michel Daenzer <michel.da=
enzer@mailbox.org>; Xaver Hugl <xaver.hugl@gmail.com>; amd-gfx@lists.freede=
sktop.org <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org =
<dri-devel@lists.freedesktop.org>; kernel-dev@igalia.com <kernel-dev@igalia=
.com>
Subject: Re: [PATCH] drm/amd/display: disable CRTC degamma LUT for DCN401



On 2025-05-11 17:22, Melissa Wen wrote:
> In DCN401 pre-blending degamma LUT isn't affecting cursor as in previous
> DCN version. As this is not the behavior close to what is expected for
> CRTC degamma LUT, disable CRTC degamma LUT property in this HW.
>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/4176
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Sorry, Melissa, for the late response. I though we dealt with
this patch already but it looks like we didn't.

Thanks for the fix and your detailed explanation.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>
> Hi,
>
> When enabling HDR on KDE, it takes the first CRTC 1D LUT available and
> apply a color transformation (Gamma 2.2 -> PQ). AMD driver usually
> advertises a CRTC degamma LUT as the first CRTC 1D LUT, but it's
> actually applied pre-blending. In previous HW version, it seems to work
> fine because the 1D LUT was applied to cursor too, but DCN401 presents a
> different behavior and the 1D LUT isn't affecting the hardware cursor.
>
> To address the wrong gamma on cursor with HDR (see the link), I came up
> with this patch that disables CRTC degamma LUT in this hw, since it
> presents a different behavior than others. With this KDE sees CRTC
> regamma LUT as the first post-blending 1D LUT available. This is
> actually more consistent with AMD color pipeline. It was tested by the
> reporter, since I don't have the HW available for local testing and
> debugging.
>
> Melissa
>
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/dri=
vers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index e8bdd7f0c460..db157b38f862 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -737,7 +737,16 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manage=
r *dm,
>         * support programmable degamma anywhere.
>         */
>        is_dcn =3D dm->adev->dm.dc->caps.color.dpp.dcn_arch;
> -     drm_crtc_enable_color_mgmt(&acrtc->base, is_dcn ? MAX_COLOR_LUT_ENT=
RIES : 0,
> +     /* Dont't enable DRM CRTC degamma property for DCN401 since the
> +      * pre-blending degamma LUT doesn't apply to cursor, and therefore
> +      * can't work similar to a post-blending degamma LUT as in other hw
> +      * versions.
> +      * TODO: revisit it once KMS plane color API is merged.
> +      */
> +     drm_crtc_enable_color_mgmt(&acrtc->base,
> +                                (is_dcn &&
> +                                 dm->adev->dm.dc->ctx->dce_version !=3D =
DCN_VERSION_4_01) ?
> +                                  MAX_COLOR_LUT_ENTRIES : 0,
>                                   true, MAX_COLOR_LUT_ENTRIES);
>
>        drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_EN=
TRIES);


--_000_DM4PR12MB52959B28B8A9F944FF097BC88B7BADM4PR12MB5295namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks Melissa! We will add the patch to next week's testing.</div>
<div id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
--</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Jay<br>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Wentland, Harry &lt;H=
arry.Wentland@amd.com&gt;<br>
<b>Sent:</b> Wednesday, June 25, 2025 10:00 AM<br>
<b>To:</b> Melissa Wen &lt;mwen@igalia.com&gt;; Li, Sun peng (Leo) &lt;Sunp=
eng.Li@amd.com&gt;; Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; K=
oenig, Christian &lt;Christian.Koenig@amd.com&gt;; airlied@gmail.com &lt;ai=
rlied@gmail.com&gt;; simona@ffwll.ch &lt;simona@ffwll.ch&gt;<br>
<b>Cc:</b> Pillai, Aurabindo &lt;Aurabindo.Pillai@amd.com&gt;; Michel Daenz=
er &lt;michel.daenzer@mailbox.org&gt;; Xaver Hugl &lt;xaver.hugl@gmail.com&=
gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; d=
ri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;;
 kernel-dev@igalia.com &lt;kernel-dev@igalia.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amd/display: disable CRTC degamma LUT for D=
CN401</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
<br>
On 2025-05-11 17:22, Melissa Wen wrote:<br>
&gt; In DCN401 pre-blending degamma LUT isn't affecting cursor as in previo=
us<br>
&gt; DCN version. As this is not the behavior close to what is expected for=
<br>
&gt; CRTC degamma LUT, disable CRTC degamma LUT property in this HW.<br>
&gt; <br>
&gt; Link: <a href=3D"https://gitlab.freedesktop.org/drm/amd/-/issues/4176"=
>https://gitlab.freedesktop.org/drm/amd/-/issues/4176</a><br>
&gt; Signed-off-by: Melissa Wen &lt;mwen@igalia.com&gt;<br>
<br>
Sorry, Melissa, for the late response. I though we dealt with<br>
this patch already but it looks like we didn't.<br>
<br>
Thanks for the fix and your detailed explanation.<br>
<br>
Reviewed-by: Harry Wentland &lt;harry.wentland@amd.com&gt;<br>
<br>
Harry<br>
<br>
&gt; ---<br>
&gt; <br>
&gt; Hi,<br>
&gt; <br>
&gt; When enabling HDR on KDE, it takes the first CRTC 1D LUT available and=
<br>
&gt; apply a color transformation (Gamma 2.2 -&gt; PQ). AMD driver usually<=
br>
&gt; advertises a CRTC degamma LUT as the first CRTC 1D LUT, but it's<br>
&gt; actually applied pre-blending. In previous HW version, it seems to wor=
k<br>
&gt; fine because the 1D LUT was applied to cursor too, but DCN401 presents=
 a<br>
&gt; different behavior and the 1D LUT isn't affecting the hardware cursor.=
<br>
&gt; <br>
&gt; To address the wrong gamma on cursor with HDR (see the link), I came u=
p<br>
&gt; with this patch that disables CRTC degamma LUT in this hw, since it<br=
>
&gt; presents a different behavior than others. With this KDE sees CRTC<br>
&gt; regamma LUT as the first post-blending 1D LUT available. This is<br>
&gt; actually more consistent with AMD color pipeline. It was tested by the=
<br>
&gt; reporter, since I don't have the HW available for local testing and<br=
>
&gt; debugging.<br>
&gt; <br>
&gt; Melissa<br>
&gt; <br>
&gt;&nbsp; .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c&nbsp;&nbsp;&n=
bsp; | 11 ++++++++++-<br>
&gt;&nbsp; 1 file changed, 10 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c<br>
&gt; index e8bdd7f0c460..db157b38f862 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c<br>
&gt; +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c<br>
&gt; @@ -737,7 +737,16 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_man=
ager *dm,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * support programmable=
 degamma anywhere.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; is_dcn =3D dm-&gt;adev-&gt;d=
m.dc-&gt;caps.color.dpp.dcn_arch;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; drm_crtc_enable_color_mgmt(&amp;acrtc-&gt;ba=
se, is_dcn ? MAX_COLOR_LUT_ENTRIES : 0,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Dont't enable DRM CRTC degamma property f=
or DCN401 since the<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * pre-blending degamma LUT doesn't app=
ly to cursor, and therefore<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * can't work similar to a post-blendin=
g degamma LUT as in other hw<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * versions.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * TODO: revisit it once KMS plane colo=
r API is merged.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; drm_crtc_enable_color_mgmt(&amp;acrtc-&gt;ba=
se,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (is_dcn &amp;&amp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dm-&gt;adev-&gt;dm.dc-&gt;=
ctx-&gt;dce_version !=3D DCN_VERSION_4_01) ?<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAX_COLOR_LUT_ENTRIE=
S : 0,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; true, MAX_COLOR_=
LUT_ENTRIES);<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_mode_crtc_set_gamma_size=
(&amp;acrtc-&gt;base, MAX_COLOR_LEGACY_LUT_ENTRIES);<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM4PR12MB52959B28B8A9F944FF097BC88B7BADM4PR12MB5295namp_--
