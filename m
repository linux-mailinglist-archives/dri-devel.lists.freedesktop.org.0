Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 571AB32AA53
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 20:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DCE6E048;
	Tue,  2 Mar 2021 19:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2FE6E96E;
 Tue,  2 Mar 2021 19:26:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eU21yAV5VICXy33x8+GHMwYgUzQyEmY1iCutnFjfCRmSD2zBxOZNxi3D8KpKxhHQyouJ+1nGPNSLn733vgeDR5syQYYQ/Z5RwYIezvk34zu44qjQitVA4WHDWxScGykQmCkJFta2gk3WdogB4SImWMKSoYZ+63fgzi0epmceie3fmyjT8kp1aM02p6ACIXCBqUpi2UzfVQa34NZwKkLB0igYXX70dpOme8d1YtPAQFtJ+VnpanWT9lrncqOqR4dqUHRpGRBt3nXQEjmKxJzhgBteJdxXfRqlsRv0xxKrlT3goQa/pJLl5XxPpT1ASvcjw8GMfXer2R0DqdqMNUc+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qx0u6khwR0MQ6oBoZhM7223XrkQePK9P0k8kBKx/quw=;
 b=FStAaqr22cwfPgtCzNU16Kr6/9BiLxxoGhgodgh2djHUSXhJlTCbWrcMyHuyQdWFTXfVhIrNkYw2jpXucMx0u8KoQpErs41ljY6M3oP68tVHrhpDxUK2FeQSjCdzNLMd6G5MCNW9o5oy6i5twL7nQTVuBGimCuLKk27pt8wwsxmXhmhk7c64eFqAL3UIFBEiDCHK4Ppz8f6/h5Iv1A0P7qC+41bv1qtkV0WzTsZT/d9V9cafBS/k5pJGuCVJDj39xH+yBCYhyVQE5HBPGA0NRBXJ6DFYpyTgTeMdJ6QFY1099cKE4Cy42GDd5xLfzYmDRGxV3pjBp1ZLRKURMYZGqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qx0u6khwR0MQ6oBoZhM7223XrkQePK9P0k8kBKx/quw=;
 b=VCzCG7f4fHpGamYDc2sPGuwcsuHxh6j5dL63l38+HdK9QYjF2tgzQAfkZWyc6Og6rKdzuc9sL3V4zjLACGUCNC+x54Zwt/GmU4m9pZXw9sMtTTrD6Gg/ozYbYxV4oq+93Lslq64IlXIVuLpasRta1z2YbKgFk3cbJsDXds6JoPs=
Received: from MW3PR12MB4554.namprd12.prod.outlook.com (2603:10b6:303:55::21)
 by MWHPR12MB1166.namprd12.prod.outlook.com (2603:10b6:300:7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Tue, 2 Mar
 2021 19:26:02 +0000
Received: from MW3PR12MB4554.namprd12.prod.outlook.com
 ([fe80::c82a:d3b3:9d54:5037]) by MW3PR12MB4554.namprd12.prod.outlook.com
 ([fe80::c82a:d3b3:9d54:5037%6]) with mapi id 15.20.3890.029; Tue, 2 Mar 2021
 19:26:02 +0000
From: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>
Subject: Re: [PATCH] drm/amd/display: Fix off by one in
 hdmi_14_process_transaction()
Thread-Topic: [PATCH] drm/amd/display: Fix off by one in
 hdmi_14_process_transaction()
Thread-Index: AQHXD1V44T+pECvyQU2Vq16WQlFAjqpxFNci
Date: Tue, 2 Mar 2021 19:26:02 +0000
Message-ID: <MW3PR12MB45540A69909BB5556C6E1C11F9999@MW3PR12MB4554.namprd12.prod.outlook.com>
References: <YD4eZLCFU+fbTGIp@mwanda>
In-Reply-To: <YD4eZLCFU+fbTGIp@mwanda>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-03-02T19:26:03.677Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [173.33.192.144]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2a1bd5e3-bdb8-4298-8462-08d8ddb10466
x-ms-traffictypediagnostic: MWHPR12MB1166:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1166E9E6D17FCA164FEC4190F9999@MWHPR12MB1166.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3iExlYOKb9TXMLdHjFOQLD8iwadURsQAKWSVfJVLmM2B/FG4oU22iFRRtpiiii3UuFMprpkYkjDEKzATcdpSC55TWwV5StKe/nt4PbU2/3qJwpmPvPh6TkgUv7s0KO5hbTO20Kb3+d1pESBLPsYks52YJR3RdF8YpyUASSgrtzIJJLZhZmmiI26tJgLbzdZq/itVr2VZ6Fp3BpmADGd5nXhNnh2OaYWeHqzhzZ6oDLMefJAlULPnlmJs9ELQwM2uGYrpu4nSPCMOU2ob2DgdKPgUZ/uHM89PCOPqODYPBo+wS3zWv/vU5pi4hhhmCSSmXRgnYHqtMQOqVB5t3NdOZvZE/Lx01YJgVolA48oVa/Ve7h22gVhDsP3JLtTX1YmQbAxSBnWgzNWjCxrmEZ4dqU4vxLfC8LOD0nmAVlT+p/722/CUNniJKyBsncT2BaNM/A3u2OFHtZGcV5urGkh71JqoaHDwDQX6Kti2JrOwwgvddK9cdc/ChndjwTjRkcYxpAR5ElTZN2xTXBIgyZzCAQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4554.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(54906003)(55016002)(66476007)(66446008)(66556008)(6636002)(76116006)(9686003)(86362001)(64756008)(91956017)(110136005)(5660300002)(52536014)(71200400001)(8676002)(33656002)(4326008)(53546011)(83380400001)(316002)(7696005)(66946007)(6506007)(19627405001)(26005)(478600001)(2906002)(186003)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?GEC9vJNGbK6SQcVEHeQ2YOYdbmzJDP3F6cHy3VCHQcS9MUxiOlEmDA1e8Z9l?=
 =?us-ascii?Q?cbEmbZqwGs5QvR0Lwb9bqspSWrJ20OmhAjxTeotttGLOACk8lFAagXXAxxja?=
 =?us-ascii?Q?uUP9fcGzXfRu4t8wqmEnVgaPwMy6crx8x15EtYRJgEmii1eHjryzNzs1sC0X?=
 =?us-ascii?Q?2G+SgLsiMNhz+Y+dRErWur2lJfgD2Kzc8AGFdQ3jNNCQmT65OsIqZKHRPMNa?=
 =?us-ascii?Q?PubBxF0XJWlT25uTZPOiX5BzXbjoV+wBbEOL5qljBIJlaCQwtE1PWuiagcFj?=
 =?us-ascii?Q?XriDM1Y/Gy4FHj/zkNHamhg6vQQE3qCGcoMcxvN7lxA+1Nz5ZocD8N1d9C/9?=
 =?us-ascii?Q?LbnRfuRuOTZLElx/5iYibzIuF+FdiIej3UloctL763c2Lfb0q+EdFmkhNkSx?=
 =?us-ascii?Q?sxfNKTpNLTmM6ec/HExZnuBdynsLjaYeb4/i9MpO/+rMvV6BA2BbTKNlLqO5?=
 =?us-ascii?Q?hJp+NpzdJaNS61y6VaQ5FBW6MGfNPQi6NSe+nZiQkxQk9KVmMZLcmIVIxrRz?=
 =?us-ascii?Q?O4HNHjNLcOsyXxBq+e4uxgiajNrOtpr6SePIAFFzLyPiGY9XPvqdknPt59Yk?=
 =?us-ascii?Q?kc0LEKjRwFvpVsTD2IE2vm0LAcjqW7fgJYepjpo1dyc8B8U7BSJFeVjZGjrH?=
 =?us-ascii?Q?V8myLuXnCP3euEbf0lC4uEBA4Mic0mksPCFzy9R4j2LASdLzVODNOuWmk3Dt?=
 =?us-ascii?Q?oLFr9NaRiu5vVS+6mHkp2HFNt+ssV/rB0Az+6O553iQYv/C+yi7/beNJKlig?=
 =?us-ascii?Q?78jYbeBPs4054+SaiAkbWS6Ul9EA4Oi1uz6PzlMrP0nSj5rx/SJeipCRe+7n?=
 =?us-ascii?Q?9UWfNvRg5mgLvmTfGcij5QM6NyvvEiSJqfXu2muaqdY/yMqDxc+6Nj2AVQkF?=
 =?us-ascii?Q?c1AV4S7jtZ83C4SdqsDDYCuZG2fl2LCptnIZVvJ7hZyYdkqS7ftAxb4Io/UJ?=
 =?us-ascii?Q?5rjjlHgzfWQ7mxMOrmGey0d4UAAG7+LeP7jMoOnuA0OcF5Cx1ysUM52Og+ob?=
 =?us-ascii?Q?MD50BnWSvQXQXAiF4KJmTuIYle8dcPu/fsFTV0kYFsQgJHxS/2JMHkSJe20h?=
 =?us-ascii?Q?1HwjWw6LnOGvc+OS3mETbuamF8gUbdLrNOr0zr2oEhyAEidWR88PVCJJvsHy?=
 =?us-ascii?Q?PMtqtBTPEl98G4UzIYTftMln6Blm5SDUFDq8xqBmT0fnbATGh9e5UYtDYGly?=
 =?us-ascii?Q?FxlqNzmVmT/ADUvHTts1QJKEsHIqP2PfkQdFPcp+OFWKfSigolCC0+vijBOU?=
 =?us-ascii?Q?ElHbPxn7Ew+zj3XWXh0ODI0U8ajT5y07lRLWQUI8MpohecnZwXAab1cNV0M3?=
 =?us-ascii?Q?pRBuuh5YVbZI4fXK3Hu7sgXB?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4554.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1bd5e3-bdb8-4298-8462-08d8ddb10466
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2021 19:26:02.4457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qPx8lFOrVq8oYGFt684fkkp7saMjYaox3mQfqV/NIDttEI38hJ8v5GMU2dzNmSGS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1166
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Liu, Wenjing" <Wenjing.Liu@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1790291295=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1790291295==
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_MW3PR12MB45540A69909BB5556C6E1C11F9999MW3PR12MB4554namp_"

--_000_MW3PR12MB45540A69909BB5556C6E1C11F9999MW3PR12MB4554namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

Thanks

Reviewed-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
________________________________
From: Dan Carpenter <dan.carpenter@oracle.com>
Sent: March 2, 2021 6:15 AM
To: Wentland, Harry <Harry.Wentland@amd.com>; Lakha, Bhawanpreet <Bhawanpre=
et.Lakha@amd.com>
Cc: Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Deucher, Alexander <Alexander.=
Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; David Airli=
e <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Dan Carpenter <dan.c=
arpenter@oracle.com>; Lakha, Bhawanpreet <Bhawanpreet.Lakha@amd.com>; Sique=
ira, Rodrigo <Rodrigo.Siqueira@amd.com>; Liu, Wenjing <Wenjing.Liu@amd.com>=
; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-devel@=
lists.freedesktop.org <dri-devel@lists.freedesktop.org>; kernel-janitors@vg=
er.kernel.org <kernel-janitors@vger.kernel.org>
Subject: [PATCH] drm/amd/display: Fix off by one in hdmi_14_process_transac=
tion()

The hdcp_i2c_offsets[] array did not have an entry for
HDCP_MESSAGE_ID_WRITE_CONTENT_STREAM_TYPE so it led to an off by one
read overflow.  I added an entry and copied the 0x0 value for the offset
from similar code in drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c.

I also declared several of these arrays as having HDCP_MESSAGE_ID_MAX
entries.  This doesn't change the code, but it's just a belt and
suspenders approach to try future proof the code.

Fixes: 4c283fdac08a ("drm/amd/display: Add HDCP module")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis, as mentioned in the commit message the offset
is basically an educated guess.

I reported this bug on Apr 16, 2020 but I guess we lost take of it.

 drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c b/drivers/gpu/d=
rm/amd/display/dc/hdcp/hdcp_msg.c
index 5e384a8a83dc..51855a2624cf 100644
--- a/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c
+++ b/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c
@@ -39,7 +39,7 @@
 #define HDCP14_KSV_SIZE 5
 #define HDCP14_MAX_KSV_FIFO_SIZE 127*HDCP14_KSV_SIZE

-static const bool hdcp_cmd_is_read[] =3D {
+static const bool hdcp_cmd_is_read[HDCP_MESSAGE_ID_MAX] =3D {
         [HDCP_MESSAGE_ID_READ_BKSV] =3D true,
         [HDCP_MESSAGE_ID_READ_RI_R0] =3D true,
         [HDCP_MESSAGE_ID_READ_PJ] =3D true,
@@ -75,7 +75,7 @@ static const bool hdcp_cmd_is_read[] =3D {
         [HDCP_MESSAGE_ID_WRITE_CONTENT_STREAM_TYPE] =3D false
 };

-static const uint8_t hdcp_i2c_offsets[] =3D {
+static const uint8_t hdcp_i2c_offsets[HDCP_MESSAGE_ID_MAX] =3D {
         [HDCP_MESSAGE_ID_READ_BKSV] =3D 0x0,
         [HDCP_MESSAGE_ID_READ_RI_R0] =3D 0x8,
         [HDCP_MESSAGE_ID_READ_PJ] =3D 0xA,
@@ -106,7 +106,8 @@ static const uint8_t hdcp_i2c_offsets[] =3D {
         [HDCP_MESSAGE_ID_WRITE_REPEATER_AUTH_SEND_ACK] =3D 0x60,
         [HDCP_MESSAGE_ID_WRITE_REPEATER_AUTH_STREAM_MANAGE] =3D 0x60,
         [HDCP_MESSAGE_ID_READ_REPEATER_AUTH_STREAM_READY] =3D 0x80,
-       [HDCP_MESSAGE_ID_READ_RXSTATUS] =3D 0x70
+       [HDCP_MESSAGE_ID_READ_RXSTATUS] =3D 0x70,
+       [HDCP_MESSAGE_ID_WRITE_CONTENT_STREAM_TYPE] =3D 0x0,
 };

 struct protection_properties {
@@ -184,7 +185,7 @@ static const struct protection_properties hdmi_14_prote=
ction =3D {
         .process_transaction =3D hdmi_14_process_transaction
 };

-static const uint32_t hdcp_dpcd_addrs[] =3D {
+static const uint32_t hdcp_dpcd_addrs[HDCP_MESSAGE_ID_MAX] =3D {
         [HDCP_MESSAGE_ID_READ_BKSV] =3D 0x68000,
         [HDCP_MESSAGE_ID_READ_RI_R0] =3D 0x68005,
         [HDCP_MESSAGE_ID_READ_PJ] =3D 0xFFFFFFFF,
--
2.30.1


--_000_MW3PR12MB45540A69909BB5556C6E1C11F9999MW3PR12MB4554namp_
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
<p style=3D"font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Reviewed-by: <font size=3D"2"><span style=3D"font-size:11pt">Bhawanpreet La=
kha &lt;Bhawanpreet.Lakha@amd.com&gt;</span></font><br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Dan Carpenter &lt;dan=
.carpenter@oracle.com&gt;<br>
<b>Sent:</b> March 2, 2021 6:15 AM<br>
<b>To:</b> Wentland, Harry &lt;Harry.Wentland@amd.com&gt;; Lakha, Bhawanpre=
et &lt;Bhawanpreet.Lakha@amd.com&gt;<br>
<b>Cc:</b> Li, Sun peng (Leo) &lt;Sunpeng.Li@amd.com&gt;; Deucher, Alexande=
r &lt;Alexander.Deucher@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig=
@amd.com&gt;; David Airlie &lt;airlied@linux.ie&gt;; Daniel Vetter &lt;dani=
el@ffwll.ch&gt;; Dan Carpenter &lt;dan.carpenter@oracle.com&gt;; Lakha,
 Bhawanpreet &lt;Bhawanpreet.Lakha@amd.com&gt;; Siqueira, Rodrigo &lt;Rodri=
go.Siqueira@amd.com&gt;; Liu, Wenjing &lt;Wenjing.Liu@amd.com&gt;; amd-gfx@=
lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; dri-devel@list=
s.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;; kernel-janitors@=
vger.kernel.org
 &lt;kernel-janitors@vger.kernel.org&gt;<br>
<b>Subject:</b> [PATCH] drm/amd/display: Fix off by one in hdmi_14_process_=
transaction()</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">The hdcp_i2c_offsets[] array did not have an entry=
 for<br>
HDCP_MESSAGE_ID_WRITE_CONTENT_STREAM_TYPE so it led to an off by one<br>
read overflow.&nbsp; I added an entry and copied the 0x0 value for the offs=
et<br>
from similar code in drivers/gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c.<b=
r>
<br>
I also declared several of these arrays as having HDCP_MESSAGE_ID_MAX<br>
entries.&nbsp; This doesn't change the code, but it's just a belt and<br>
suspenders approach to try future proof the code.<br>
<br>
Fixes: 4c283fdac08a (&quot;drm/amd/display: Add HDCP module&quot;)<br>
Signed-off-by: Dan Carpenter &lt;dan.carpenter@oracle.com&gt;<br>
---<br>
From static analysis, as mentioned in the commit message the offset<br>
is basically an educated guess.<br>
<br>
I reported this bug on Apr 16, 2020 but I guess we lost take of it.<br>
<br>
&nbsp;drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c | 9 +++++----<br>
&nbsp;1 file changed, 5 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c b/drivers/gpu/d=
rm/amd/display/dc/hdcp/hdcp_msg.c<br>
index 5e384a8a83dc..51855a2624cf 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c<br>
+++ b/drivers/gpu/drm/amd/display/dc/hdcp/hdcp_msg.c<br>
@@ -39,7 +39,7 @@<br>
&nbsp;#define HDCP14_KSV_SIZE 5<br>
&nbsp;#define HDCP14_MAX_KSV_FIFO_SIZE 127*HDCP14_KSV_SIZE<br>
&nbsp;<br>
-static const bool hdcp_cmd_is_read[] =3D {<br>
+static const bool hdcp_cmd_is_read[HDCP_MESSAGE_ID_MAX] =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [HDCP_MESSAGE_ID_READ_BKSV=
] =3D true,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [HDCP_MESSAGE_ID_READ_RI_R=
0] =3D true,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [HDCP_MESSAGE_ID_READ_PJ] =
=3D true,<br>
@@ -75,7 +75,7 @@ static const bool hdcp_cmd_is_read[] =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [HDCP_MESSAGE_ID_WRITE_CON=
TENT_STREAM_TYPE] =3D false<br>
&nbsp;};<br>
&nbsp;<br>
-static const uint8_t hdcp_i2c_offsets[] =3D {<br>
+static const uint8_t hdcp_i2c_offsets[HDCP_MESSAGE_ID_MAX] =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [HDCP_MESSAGE_ID_READ_BKSV=
] =3D 0x0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [HDCP_MESSAGE_ID_READ_RI_R=
0] =3D 0x8,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [HDCP_MESSAGE_ID_READ_PJ] =
=3D 0xA,<br>
@@ -106,7 +106,8 @@ static const uint8_t hdcp_i2c_offsets[] =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [HDCP_MESSAGE_ID_WRITE_REP=
EATER_AUTH_SEND_ACK] =3D 0x60,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [HDCP_MESSAGE_ID_WRITE_REP=
EATER_AUTH_STREAM_MANAGE] =3D 0x60,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [HDCP_MESSAGE_ID_READ_REPE=
ATER_AUTH_STREAM_READY] =3D 0x80,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [HDCP_MESSAGE_ID_READ_RXSTATUS] =3D 0=
x70<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [HDCP_MESSAGE_ID_READ_RXSTATUS] =3D 0=
x70,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [HDCP_MESSAGE_ID_WRITE_CONTENT_STREAM=
_TYPE] =3D 0x0,<br>
&nbsp;};<br>
&nbsp;<br>
&nbsp;struct protection_properties {<br>
@@ -184,7 +185,7 @@ static const struct protection_properties hdmi_14_prote=
ction =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .process_transaction =3D h=
dmi_14_process_transaction<br>
&nbsp;};<br>
&nbsp;<br>
-static const uint32_t hdcp_dpcd_addrs[] =3D {<br>
+static const uint32_t hdcp_dpcd_addrs[HDCP_MESSAGE_ID_MAX] =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [HDCP_MESSAGE_ID_READ_BKSV=
] =3D 0x68000,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [HDCP_MESSAGE_ID_READ_RI_R=
0] =3D 0x68005,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [HDCP_MESSAGE_ID_READ_PJ] =
=3D 0xFFFFFFFF,<br>
-- <br>
2.30.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MW3PR12MB45540A69909BB5556C6E1C11F9999MW3PR12MB4554namp_--

--===============1790291295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1790291295==--
