Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDB3AA4EE3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 16:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD83F10E7D1;
	Wed, 30 Apr 2025 14:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LL2PxIvX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8497E10E7BB
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 14:41:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJxUs6G5f43OgjF6mH/k2elqTw/Z6U/Jb1x7bVvrPFmL6UM2N+fBEcqb5N87SThv1BH1dSodVLVDIxBjanb7MGXAMGEoY40Oa/PcI6NOV/mOV2SSYdZ31rB5Tsqba3+th1/XPb5DJhtaSinN+Bt4QU5VpTHoJOKK9gR4Ws2dbTv/cXk44hQej3eIxsi6Qvq4kWOFvdyPqPWZsQUUSd0meFPn4axRwJGAcejV/dVpX3HAQlj0eUa75xCaNz9dpCFkF7SbMfIPRmTaKhcEObSkvV3MAIEjngEbh9KJ23o141dP/F6JSVkjhBkcsdEw4C3y9MaX9ILH0ZBUeHWHqT6ExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KxYQhc53Ygb3hfIMWrDzoi+xOUQEpSyz4NF2JJ2ZgI=;
 b=KTEYchUSxcY9CyAYZY3JAZXivp9Ao8U5xLJ5iePr8lHslgbtcfN8nJCM3lChDgVmI9f5J5FWWU0MLl4vOkmEcyjB5N6dxnsjvnA8pch7hmn+QKV6ytpR9pGg59fAjkBVHrevkeYpeMjE86pITRCjyEoMWLfcqpGWcrTcoB/O805Qq/KO6xTFiBNF2rw+UK7D35oQMtrSTxlkjkcRLYlZrW7uezJSCj6XDWAhTQjz9UcdRUKVuuhn51ZaIJaOy8+EQYBbLIsqIvtROUVsJ/lSzFy3McKo86qAlf9aoNspk4Fs2CCPP8TZVzwts50da3IQYY/uXB9rIo8MYGjq42nCQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KxYQhc53Ygb3hfIMWrDzoi+xOUQEpSyz4NF2JJ2ZgI=;
 b=LL2PxIvXR6AoZgE+4mbYRgYXCjSdenb9xHa5Vc92BRHDGTSX2MJI7LVqIMTf697a13p3FXYGA9Y9Y51G9Fv+K1sWCZnXVdotoDTsj8LY2EbKUh+mb2VoMSAH2hBHFgjvNW7PB/b+CNlO8w1aHf9CAxGVPRZF7fKc+IBfmqA/+58=
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by IA1PR12MB9061.namprd12.prod.outlook.com (2603:10b6:208:3ab::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Wed, 30 Apr
 2025 14:40:56 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 14:40:56 +0000
From: "Khatri, Sunil" <Sunil.Khatri@amd.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Simona
 Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, "Pelloux-Prayer, Pierre-Eric"
 <Pierre-eric.Pelloux-prayer@amd.com>
Subject: RE: [PATCH V8 1/5] drm: add drm_file_err function to add process info
Thread-Topic: [PATCH V8 1/5] drm: add drm_file_err function to add process info
Thread-Index: AQHbr7NQSYmJVBBrBUetHJZnZq7X/LOva3gAgAmZooCAAALBAIADU9Ew
Date: Wed, 30 Apr 2025 14:40:56 +0000
Message-ID: <BL1PR12MB57537FD6C36873EFC4744B3A93832@BL1PR12MB5753.namprd12.prod.outlook.com>
References: <20250417161042.120981-1-sunil.khatri@amd.com>
 <4b7a7016-7ad5-4d08-919e-9876f7da1ef2@amd.com>
 <f9c5edeb-ffc8-4a25-a80b-3ae8de9b62da@amd.com> <871ptcy089.fsf@intel.com>
In-Reply-To: <871ptcy089.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=79dbd13f-922b-42a9-947c-7bf237aa58f9;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-30T14:38:28Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5753:EE_|IA1PR12MB9061:EE_
x-ms-office365-filtering-correlation-id: da84abb5-6752-4784-45bb-08dd87f50411
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?I4wd2DU70Y0ZNyYRtwjWlKnNEayiK6S9MfSxjgA5pnY/e4eQD5dPAxV+Lk?=
 =?iso-8859-1?Q?/1hxuMD+LmvlxfrDxiUWjhFVcI9JZl7QEGqTKz6qI6DrheyHKVtgmitKc9?=
 =?iso-8859-1?Q?Wul1Pm+/jIRTZQ/EpatpOUE1kPZvOja1WoIh/LD6cGjRcRWB7IyBrT6Lf5?=
 =?iso-8859-1?Q?QLsuQgX4qvWCoqexdEuc/9pgjEo0AocglYtZYwM4a/Hh44bZZ5xggOx1Zj?=
 =?iso-8859-1?Q?XgkvCXnVFxfgba68bOncrQJaEG/wL3WsMpGNBwDQymeBgA/iWmWXDSn2ag?=
 =?iso-8859-1?Q?CapjAYeBRzqWzuZiocm6VYWORNSoPUqOv5joyOVB3TjR5sE+0L8QEeGCH1?=
 =?iso-8859-1?Q?QnlIPMR3bxBABNngh8uRwADYUhH/xK0rBsDowho7qsvFJRSjbDVzgUfZcF?=
 =?iso-8859-1?Q?z8VhWbeEP2NlQB7cyqy/nn5+dSeDrZ9kwxywS3SOFcPXQI5j1TDvDsdumj?=
 =?iso-8859-1?Q?NYvLZbBQTV4x2W/yhwSm4o0IX+9GbT1z5FB8WJvEYHokR/s8zMi9Smvda+?=
 =?iso-8859-1?Q?t4JI0fEJWQBegymuW+SECgEJqH6GOXDiK85WtcoggdSuRGxWSZR56dR4rX?=
 =?iso-8859-1?Q?OhOl00hpR/5i1YPxXhd2VbsW/TlYoGNULS4Mr+fEjqzA5tnP3Lsb7XcoAa?=
 =?iso-8859-1?Q?v3xEup17P/M2OTb4leT1OHL+XrqGVdBh9ArwLGxWnEtfcerkNfEEoaxgdy?=
 =?iso-8859-1?Q?P7tLfagZvtUXYRVYfP16wl4i9tqNVXkIp7lz7zrMGW78LoNVtI/2Ox92W3?=
 =?iso-8859-1?Q?C+9kjL+UiT6mljQ7EiopNDf8pp/dygGddbjMHHzXugybUCPAJk8kJdqMVB?=
 =?iso-8859-1?Q?9jlqZzEkdyOwU4iLNdLK28fsKTwrmpDnztMlA93sE3LmsFy1iGjTjq1VkP?=
 =?iso-8859-1?Q?MrCnAOXnAZ2g5TdYNcmAV1yOgrYXqvBiAln+CvnsA80rCgvcBujS9RUVz/?=
 =?iso-8859-1?Q?fHa15v3PvWgGg4UMSIYq9tnvwbL/Ddhl+2TbS5ggSK2nHWdXgObbpNXgnD?=
 =?iso-8859-1?Q?wo7s8dUErghDZpXq8xDyZxwpMtLK8bvbvsEKnFMMeIAdw0LBI1ZLxgOIX0?=
 =?iso-8859-1?Q?vDqMBR3xMdMUSOHkffcW+uM59C9EhrLBsWqrzjoDLTfgUQVqKwDfTyy47M?=
 =?iso-8859-1?Q?wLjs5g/ZGODjf/NUi+RS7xryNtDJGglQc5VrboApRTkNImEY9aSF2zJyzT?=
 =?iso-8859-1?Q?vF2tpUBFO/hSO0X2ZTvafFz0RrVdVUMaLy+ofOO5NJ+3/FxpE1cm53NcnL?=
 =?iso-8859-1?Q?iIKItLcZkXtQ+A7UrsoMT2BVokY2o8f8IfCnkhFofIDb8jtcKawwKEXaZr?=
 =?iso-8859-1?Q?63wJ5m8GXkU5mG+Ss8xplbgFMy3Ex0lZydRyUO7msiXUIdxfzDi1Zseo5Z?=
 =?iso-8859-1?Q?SOeHyC3j3sYzQ3l0LYVTNAX+kr2iidTWwEsuig8MkLJDOKNNZaAbgH0FQU?=
 =?iso-8859-1?Q?dEBLjB0AWYwmGCFghrd2EmAI8H7PG+zmq0Y6NzHXAbcv/VC38vYV0DFnSA?=
 =?iso-8859-1?Q?TjQnXRkK1TzLV8KRGiIGEXrEnKbXPPu8KAVSj9cY9GoAlfgLmNrQtQ/n25?=
 =?iso-8859-1?Q?hcF3egQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?v/CqPwq38ILcahr6ZXUTIPJFXy9Gf8KMRbT7DO8JK7caIE74mjC8+PuMQh?=
 =?iso-8859-1?Q?NXzsv4JAHlFYEPye1V99lP/uANIfcXzoTTRy3UXnO58y8o7tDu9+sBaLX7?=
 =?iso-8859-1?Q?o6KuZLZl1IcrNgMsNI+Ri1tpudGMRB7yRx23KMwdSIjr63nIWEEpCXCmHQ?=
 =?iso-8859-1?Q?VhHF0rJ9jMwLJ6XLt0NnDZMbupwmYiJFeb6y/zfXkeOIoWfQQNdfsD9yu7?=
 =?iso-8859-1?Q?A4fZ04GS7r7S1CHzilow8TFD33Vf/oNIO4mGR5T2Tkfithrjbs8/Ivys5M?=
 =?iso-8859-1?Q?H5Aln0Bja4OcYgSNZry5XJ8opcHaaFSDhzkRGE1nT/fPSCGI7TFK5LxeLh?=
 =?iso-8859-1?Q?b9zWhOMBLGQH8SWyK0emyxOEBSX9RT9vNJmBR+fadD29kXsqhwL4XvO1VT?=
 =?iso-8859-1?Q?1yhVav2EQFn7tjVMZrTTJgqo6Yw/GSkeT27m6C3OFEaWeH4BhCLjJ0Ey8x?=
 =?iso-8859-1?Q?MM6jpBMu4/fXALzq0DfFEZfEyJLmXq+vIg0FTF7QF/uNMTVlYyxPMYSPfk?=
 =?iso-8859-1?Q?QJZkdzZmYcaBWHLizywkUyf+C66+cF+59ITrVgSaCvhK9ENbvJOR3P0naR?=
 =?iso-8859-1?Q?JLtscN+IvXL2JfroZtZPjy9yudC17y6OGHpyQiNqlZTMJH6lS+mqhntFmh?=
 =?iso-8859-1?Q?OGAlsZbBR7oMkKPhf4d2s8dBTutuZRkF4ajE9jT20jM+291Gl94q8VKBxV?=
 =?iso-8859-1?Q?PhuvbZgV664ydSx+/uevnmb6mBkvb9CRpMx2dVuFsXHm9vLRxuLYTB2bWy?=
 =?iso-8859-1?Q?dB96YiXJYxC3yyyieQhuaLaa0x5XwG2k4l/rRwPWq4jvfWZ/1/UYSUE9XX?=
 =?iso-8859-1?Q?CLVlKkQ76lhYwBo2afOIs3qMMUwSAX1XT/JUhIjU2RVo6gPuJULtsCzXCI?=
 =?iso-8859-1?Q?DPWtUr09lUZqgZcVkq1xFCK7NrsddrARjs2lZgRN4djiUyVaUTFidcojmB?=
 =?iso-8859-1?Q?WcdTCKi/LShPe2W4c/Jv7LkTifLCKMZvljSe9yyADTDJm6LoPAb2gPK7GH?=
 =?iso-8859-1?Q?47VzsLMHkTOqelorPhuRO5OTgSsz5y4kuimtdY8uSN7WdHl20ruBEApM2F?=
 =?iso-8859-1?Q?FWdvw0hs1h4EUs04U0e2cSLaLndgtzTXMWe0EEydyWFAhmTAVb3OoIU2dv?=
 =?iso-8859-1?Q?Hy9+YwXNXPe7UqRJQURYU48H4VDVaZ2V4Ar83OwdvRAm8zebO6428Z0vZG?=
 =?iso-8859-1?Q?P7K7aC3cIhUHvw5FaJJN9HJf81np3iiOOgKlPMVG1+Rjl8ZyQeQa0U922I?=
 =?iso-8859-1?Q?1Lo9JLC0w59VzHfdNkxVsv8/3+W2r9Nh23TLVJJk8yQE1OnGVsCb1CDJcW?=
 =?iso-8859-1?Q?m40dLBr5qaK3nW2F7uTIR1sAlpGv+4ZqGXyw5+GTOPdkjCpBMx5sGfksL8?=
 =?iso-8859-1?Q?25uox/hB0MGT4Gj3ANi/1AQmTnltT4IEVGDrsebne4CL+ujA1kubP7b6g9?=
 =?iso-8859-1?Q?QYdgJmLEDYL27FbszLpfcpTjNR0MnFRJyolnVSPqpW65ob/fHiRZZkV/6f?=
 =?iso-8859-1?Q?o5LRiTPwWhNyu8MgNlPM0rw4uINKo1+huuZFF5ISIw5pHp6ATRP3z4+GDv?=
 =?iso-8859-1?Q?Fh6PLA6dq3tCeKRXPbOpHZhz4lLKZRpffb3dkJhv8n4owg+kWXFF3kB/IH?=
 =?iso-8859-1?Q?wpg1cxGytltN8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da84abb5-6752-4784-45bb-08dd87f50411
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 14:40:56.0908 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +1dduT2YkGNllnmcJBVSjKsl6mKgMMW2xpsYgjvCyp22RrPF3Xe+LcPgtKLe155U5HlO8HQj6t5KbD4pwlJrJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9061
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

I am not very familiar with the process here but looking forward to some re=
sponse based.

"Any objections to merge this through amd-staging-drm-next?

The follow up amdgpu patches all depend on stuff in there which is not yet =
merged to drm-misc-next.

Christian "

-----Original Message-----
From: Jani Nikula <jani.nikula@linux.intel.com>
Sent: Monday, April 28, 2025 5:20 PM
To: Khatri, Sunil <Sunil.Khatri@amd.com>; Koenig, Christian <Christian.Koen=
ig@amd.com>; Khatri, Sunil <Sunil.Khatri@amd.com>; dri-devel@lists.freedesk=
top.org; amd-gfx@lists.freedesktop.org; David Airlie <airlied@linux.ie>; Si=
mona Vetter <simona@ffwll.ch>; Maxime Ripard <mripard@kernel.org>; Maarten =
Lankhorst <maarten.lankhorst@linux.intel.com>; Thomas Zimmermann <tzimmerma=
nn@suse.de>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Tvrtko Ursulin <tvrtko.=
ursulin@igalia.com>; Pelloux-Prayer, Pierre-Eric <Pierre-eric.Pelloux-praye=
r@amd.com>
Subject: Re: [PATCH V8 1/5] drm: add drm_file_err function to add process i=
nfo

On Mon, 28 Apr 2025, "Khatri, Sunil" <sukhatri@amd.com> wrote:
> On 4/22/2025 2:33 PM, Christian K=F6nig wrote:
>> Am 17.04.25 um 18:10 schrieb Sunil Khatri:
>>> Add a drm helper function which appends the process information for
>>> the drm_file over drm_err formatted output.
>>>
>>> v5: change to macro from function (Christian Koenig)
>>>      add helper functions for lock/unlock (Christian Koenig)
>>>
>>> v6: remove __maybe_unused and make function inline (Jani Nikula)
>>>      remove drm_print.h
>>>
>>> v7: Use va_format and %pV to concatenate fmt and vargs (Jani Nikula)
>>>
>>> v8: Code formatting and typos (Ursulin tvrtko)
>>>
>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Any objections to merge this through amd-staging-drm-next?
> Gentle reminder here folks ??

It might help to Cc the drm-misc maintainers, though even that doesn't alwa=
ys guarantee a reply. ;D

Done now.

Anyway, since I commented on an earlier version, and my feedback was addres=
sed,

Acked-by: Jani Nikula <jani.nikula@intel.com>

even though that does not help you merge via the amd tree.


BR,
Jani.


>> The follow up amdgpu patches all depend on stuff in there which is not y=
et merged to drm-misc-next.
>>
>> Thanks,
>> Christian.
>>
>>> ---
>>>   drivers/gpu/drm/drm_file.c | 34 ++++++++++++++++++++++++++++++++++
>>>   include/drm/drm_file.h     |  3 +++
>>>   2 files changed, 37 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>> index c299cd94d3f7..dd351f601acd 100644
>>> --- a/drivers/gpu/drm/drm_file.c
>>> +++ b/drivers/gpu/drm/drm_file.c
>>> @@ -986,6 +986,40 @@ void drm_show_fdinfo(struct seq_file *m, struct fi=
le *f)
>>>   }
>>>   EXPORT_SYMBOL(drm_show_fdinfo);
>>>
>>> +/**
>>> + * drm_file_err - log process name, pid and client_name associated
>>> +with a drm_file
>>> + * @file_priv: context of interest for process name and pid
>>> + * @fmt: printf() like format string
>>> + *
>>> + * Helper function for clients which needs to log process details
>>> +such
>>> + * as name and pid etc along with user logs.
>>> + */
>>> +void drm_file_err(struct drm_file *file_priv, const char *fmt, ...)
>>> +{
>>> +   va_list args;
>>> +   struct va_format vaf;
>>> +   struct pid *pid;
>>> +   struct task_struct *task;
>>> +   struct drm_device *dev =3D file_priv->minor->dev;
>>> +
>>> +   va_start(args, fmt);
>>> +   vaf.fmt =3D fmt;
>>> +   vaf.va =3D &args;
>>> +
>>> +   mutex_lock(&file_priv->client_name_lock);
>>> +   rcu_read_lock();
>>> +   pid =3D rcu_dereference(file_priv->pid);
>>> +   task =3D pid_task(pid, PIDTYPE_TGID);
>>> +
>>> +   drm_err(dev, "comm: %s pid: %d client: %s ... %pV", task ? task->co=
mm : "Unset",
>>> +           task ? task->pid : 0, file_priv->client_name ?: "Unset", &v=
af);
>>> +
>>> +   va_end(args);
>>> +   rcu_read_unlock();
>>> +   mutex_unlock(&file_priv->client_name_lock);
>>> +}
>>> +EXPORT_SYMBOL(drm_file_err);
>>> +
>>>   /**
>>>    * mock_drm_getfile - Create a new struct file for the drm device
>>>    * @minor: drm minor to wrap (e.g. #drm_device.primary) diff --git
>>> a/include/drm/drm_file.h b/include/drm/drm_file.h index
>>> 94d365b22505..5c3b2aa3e69d 100644
>>> --- a/include/drm/drm_file.h
>>> +++ b/include/drm/drm_file.h
>>> @@ -446,6 +446,9 @@ static inline bool drm_is_accel_client(const struct=
 drm_file *file_priv)
>>>     return file_priv->minor->type =3D=3D DRM_MINOR_ACCEL;
>>>   }
>>>
>>> +__printf(2, 3)
>>> +void drm_file_err(struct drm_file *file_priv, const char *fmt,
>>> +...);
>>> +
>>>   void drm_file_update_pid(struct drm_file *);
>>>
>>>   struct drm_minor *drm_minor_acquire(struct xarray *minors_xa,
>>> unsigned int minor_id);

--
Jani Nikula, Intel
