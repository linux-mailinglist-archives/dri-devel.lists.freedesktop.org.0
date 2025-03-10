Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3B6A59580
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 14:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661A910E435;
	Mon, 10 Mar 2025 13:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Wt9tNwfH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2047.outbound.protection.outlook.com [40.107.101.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B333A10E435;
 Mon, 10 Mar 2025 13:01:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qr1JnYoKN2UMq/KfnO7ZqE6E3MyeDWbXFca7HgO0H0Es6mpSO4+S3uGpco56pJwHTlsVedp2yPn7a4jKgw6RxDe6hbqBv2N46fYbjWXvTTPBxUsivqg9LsFwzo4iGe/JhG3k412mfiF+QykPtXXmrLe+UCGuIzG9Ei2PwGOhQNnWUlZbJwoM1jj1An395rkvjYABMNugOznZ8vCl3nUH7Khwpx7rJ0k0wz6gzoU1ovBA86EFWG8A+35e+05n2uBZVo5aSGjoz+pvLkSZwhklK9jIHjuQLUM9HQKaYHdVOB1H+TQjdSzJWqZ4GvIkjjXsuWOnpXJFRj+8sQ32jgCuvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKfJY2qhhehgh+mG9wIC/Jb/LJcN4lujIh5kgoPY4IY=;
 b=LzPuCHCAO2fJ6ts/2WhzteQ81s1fHtHQWScsLPqItVA/9jXrd8mQeiiZiDuUqQsxSsrIMkfH2pKtu53/Jk3415yClkbK4RfgGqNBUdy6B+w3XC4itI079fPzzPn0mXD44QnJvqBPK36Gq5ey+IYkn85L3NFrDp/6Noub0wPNA+ZlsQ66e6cFAfmUdZitZ+xcmSXTQgI5uiaUlyUhb0YOrqIGxNQMUZWiw41h4SPeYRlBff4okDK/2zdHK+e0E0UcicvUQMZmPOzo/d5iRLja8QgTKRf3KEOafKYspSo5HRYwlv2V2Q+t7Y5tAAbt1+Kh7DwQ34vmcgaPJ9na0NQivQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKfJY2qhhehgh+mG9wIC/Jb/LJcN4lujIh5kgoPY4IY=;
 b=Wt9tNwfHx1Bh2OIspu4bymGPMdaRaNJUZz5w1kROSePxaZYQJqtROa5FvSOhHXVrw89mQcZlEf2nX/s1uOJ2FRYvuFTYwQ0uRN2jPXZeJ41RkxO31i/cFce5932BcYEPirLuBNTyvaPNA9aHubdHXRlToETvfSdId3aadg/R1i0=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by DS4PR12MB9659.namprd12.prod.outlook.com (2603:10b6:8:27f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Mon, 10 Mar
 2025 13:01:25 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282%4]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 13:01:25 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "imre.deak@intel.com" <imre.deak@intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Lyude
 Paul <lyude@redhat.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] drm/dp_mst: Fix locking when skipping CSN before topology
 probing
Thread-Topic: [PATCH] drm/dp_mst: Fix locking when skipping CSN before
 topology probing
Thread-Index: AQHbj482QRprfF/0iEK8Px6Ys6YLELNsC6BwgAAsaoCAAB6fMA==
Date: Mon, 10 Mar 2025 13:01:25 +0000
Message-ID: <CO6PR12MB548903C49BF9AD7F335E3EC8FCD62@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20250307183152.3822170-1-imre.deak@intel.com>
 <CO6PR12MB5489FF5590A559FD1B48A34EFCD62@CO6PR12MB5489.namprd12.prod.outlook.com>
 <Z87GNTziGPAl6UCv@ideak-desk.fi.intel.com>
In-Reply-To: <Z87GNTziGPAl6UCv@ideak-desk.fi.intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=53778b97-bbae-46c6-a1db-d46197d1c55e;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-03-10T12:49:52Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10, 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|DS4PR12MB9659:EE_
x-ms-office365-filtering-correlation-id: 4891fe14-d015-4341-f5ed-08dd5fd3aa21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?VId/MQ2uhESY4CFk5U7JI7xe7m3kV4yYnZT1rDCb4T35BPJimz8qgtzkpViG?=
 =?us-ascii?Q?UXzb6gk94cEYgB6VV/CzY0kzH8lBjqZPC7DZN6rt+sLc6ixJlZkXPSpsqLBE?=
 =?us-ascii?Q?tNlpqD2Dqmc7VgBPXFuCTneKz7kaUEKpoTbUgXheFIncQPPQoM7d+9HZrtwB?=
 =?us-ascii?Q?/cJnX6oC+mMb+8Xn2D1VmpK8TJA+rl39NmPR+BVOnOQXWJCCgeMvJ5ymKQ2e?=
 =?us-ascii?Q?4IJJQ9/+gZYR87mb9rBGDDZUfjfeifcxLwFzpTS+ZGzMuhuj6/VZv5EAekTK?=
 =?us-ascii?Q?3yRepGhGx8SbNrLIya61XycSeFY2zgTwPY7H9UtpWjGYg5hLehhCNlQiH6ly?=
 =?us-ascii?Q?KwvfVguu5ize6voxXFTCyz1HFVTCAPPb7a50KS1ZswgYcQ05jPhWPwFG8nOk?=
 =?us-ascii?Q?Q3STvYBnIUQErgwd/zpgOuxpYQiX6EIKby4kjdt2p7UBsL5BgVoFxG63L8VX?=
 =?us-ascii?Q?AE1+ThlL8i68EdDvJ1lCNj0uWjqYaXssJ5zmB3O+5I1fo4XjMA6oDQQdpwRI?=
 =?us-ascii?Q?lwMq05faZy9eFU8XmDOE8vGe2Vx3nZs47ia7HqmASBD3PdU0/RyG0rHGJc9G?=
 =?us-ascii?Q?uPWTIu7VE5P2ckrahjiSSdPLZBsyqodycczTY+CDDyI4cxEP/NlldcyFKFmV?=
 =?us-ascii?Q?6Kzne0OPUCXqHG2p9DM56WxsrIIEMbhANCb43y5aSBZgtaLvVnyvZ7RDh+XM?=
 =?us-ascii?Q?fjkKvaVjZpeX0PNTXSLxe+CrmPwgBP/4swrJ/9NYfU7QMRCT9cxWKRT31fp5?=
 =?us-ascii?Q?vyv+wqRQkjEfJ4hTRRdwjj7o0xEHtyrxJMSJZxZTYviyRnD5JiG823X1XxpD?=
 =?us-ascii?Q?yA0ap0laRGVnu3qQftjsE4jwYjHS6lep0olvjf42cLApJiadOuEcMc4PogqC?=
 =?us-ascii?Q?UhkgUqKB4NeZ1jKj4SeWfle04Vcx7mRxkgCoayKzp9tz0PsqYgynkm84tHOg?=
 =?us-ascii?Q?WLr0E0dDFNwrwY3JSG+YR40erKck7O6GLMuyzVW+XfRGGjuP6+/Pj2ratb2j?=
 =?us-ascii?Q?zJXN5Oq3NmXpOm/DMh0DD/rMsoQHjAFmHgloqT+wG7NWOJhUvd1z3SBQNmJo?=
 =?us-ascii?Q?KSIF5tvKvsmss+gc/4jnjI0pGKBHqhxSZTM8a4ErJ5v6ukeOtbTaoKx8f0kB?=
 =?us-ascii?Q?DjobXB81pYWpwhq5yejY/GGgCU/3d9AuZMSZyGJotPlMPPx77TuolKYa9xoF?=
 =?us-ascii?Q?AKq6aKxDna3f6PEcX/gUPUWJWy5KYhiO3N5+toCBC55R1FOqEedCIuTP9KZ+?=
 =?us-ascii?Q?u6p73kXPLivkayd3U3hMon5zasCYD1HRyT7IS5y4VQPKKvOJ9L28dXHeh0xf?=
 =?us-ascii?Q?/BJ1y97qnj2U+4HrTYhKEYcNW4zva1DLVkzGJOHGAybFcP4XlGEJAd0czdJM?=
 =?us-ascii?Q?xhZDJNerch0zqQGYr6zsN1d9cHcNIXqBiTCOC/R1t8c7lOmnpfKxmONU/66N?=
 =?us-ascii?Q?RKD651BZJ0IRq97bduSq9Bo9S9nivzms?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Go4l53jU1WHIwUhAP5rP5BfMSRou+QVskBNCeBtiVY6cDCMpMqUMg11sB/QX?=
 =?us-ascii?Q?9P/EfzhasRvnJ4XRVqioxfCfEsyrVfKeOZB7c5tWFKEcqyMIKoeKLQjyl+7r?=
 =?us-ascii?Q?fc6IWjh8wQCZlBGHAMt4Kz5dK837GdJWEenAqE1bsjqz9WcsyN3dXS3rH4LY?=
 =?us-ascii?Q?yE05dEiveO6eMcWJi067wRHUnpEk2v62dwwAqVVbR6AHkxoAzMxMFMychnNy?=
 =?us-ascii?Q?lNDw7rg5MA9/MbP/AKwDsy35QhSKfLMaAPvOxXjpt903CjMYyY5+stkWX9/D?=
 =?us-ascii?Q?jrUS9g0/fzcqTnJZ/7Pd+eCQFr8E1aVuKjXX/8ARs3Z276k3/6arj+pTUFkd?=
 =?us-ascii?Q?HbU8fEOMRFW45eY5HfmumxjpARaItU7lWMTw4D4buYpgoinodcXsMUY9TNcU?=
 =?us-ascii?Q?Ah+3mfrANvpOSAGpVVhNsxISk65JjtdWhIGYM6u/2sx8IUS4m62M9BWcnXoA?=
 =?us-ascii?Q?uO3Ip+BAWZZrainiq09Cg0DFZFMcFJmOC3ly+bRG8815ASzVvpVi+sjWqo0+?=
 =?us-ascii?Q?JXKkTvrRQ7+ot3x6IudzvwOk+RqwJ5QBSNkF9Yf0V0Cb+0feFlom9oDNaRtK?=
 =?us-ascii?Q?ojrlRnTIZqiVA0FpcleuNn4WMurRgeY/np3YfGq+YHFMiX7U42oeo4tXfKeE?=
 =?us-ascii?Q?jKfjtvCYWRuypPTc8aSHkuAYsiGZfG7GIMRMx3V/83xq5Yv6kdOn5HSccDhu?=
 =?us-ascii?Q?gbheNYMIYVddIhB9K1tfF07Uo2o+RSbEcxpvO+IKBvkqoDlro98poV9cgR6q?=
 =?us-ascii?Q?3uhCLm8/AhzxwngUTEeE1d8Y5CTt7DUFJ0hjaqTSkeWUQasXvokMzv647UnA?=
 =?us-ascii?Q?oG9UCztjIeZUK0TGNlh9hefcEaTyX4GAx3jzSBn358fdvUZDkV99DKkYGGOm?=
 =?us-ascii?Q?ao+ACNvfEKMQLvAiqz1a7j00TvhgHwSCFchlj57f7PAhv4yiqA79qJm4d2AP?=
 =?us-ascii?Q?mo1vqpVLk9rV48lLVRVZoXJOzxHPEC5+n7LUgxTZZ7+HhieENoarfSBZTsko?=
 =?us-ascii?Q?JQ8XLKAH8l65YSbT0QPJRoQvOP1feD0BKl4NBnt9j7lYDwPVln6EQBzDzLsP?=
 =?us-ascii?Q?vhT51h1T4SJdWk/6q2uOpWmLhbY2gxRRwWrjfvDjDsG6yYtLpgUcx8AbPpTW?=
 =?us-ascii?Q?on84lKtP+Zqz3IerQPDgE6XFvuOLva/Z5YjvOpS8owcOt9efzCd9E4GjCx6p?=
 =?us-ascii?Q?jB9skqEUxvQHOKMQSUz6SQ/VgRRncS7KK2S+BDeExwypioQaRFyiPnECWo69?=
 =?us-ascii?Q?ATTdMRiZe30C64h6knHQg+yyYVoIanrQNgZl/OWOxQvlpzmCPOjpy40AFU+b?=
 =?us-ascii?Q?/Do1CB/+a78wQAfdNiGM5YAVWoGGdbwRo+IMMM3ulJAncg5Akyn4ak1oHlDh?=
 =?us-ascii?Q?OhEOe0Ybkb67e/yRjrX/xUMsURfa5RJquVene8SSmRkPS6Sr0TfdM6hFN7ZL?=
 =?us-ascii?Q?BVJx4lRHkFzF5cmbSbGmHFv29p9kocoBUNmNYnU7/TAMW5DK7bW4Be7NENaz?=
 =?us-ascii?Q?YZKhOw0Zw5tHZblU07zjdnpJA0YdP7rhWIw8WWe+Q1xsL7nu1eIaziIxTCjs?=
 =?us-ascii?Q?twGcO/wAm1RTmjthRYA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4891fe14-d015-4341-f5ed-08dd5fd3aa21
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2025 13:01:25.3160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DarhhXbcTxxo2EAwJCfvgv6sptMZ1tvj6rakcHfy2zky5kubOoVBzzNEr3Dhzok41btYZHl/+E3CcMiTz+HClg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9659
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
> From: Imre Deak <imre.deak@intel.com>
> Sent: Monday, March 10, 2025 7:00 PM
> To: Lin, Wayne <Wayne.Lin@amd.com>
> Cc: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org; Lyude Paul <lyude@redhat.com>;
> stable@vger.kernel.org
> Subject: Re: [PATCH] drm/dp_mst: Fix locking when skipping CSN before top=
ology
> probing
>
> On Mon, Mar 10, 2025 at 08:59:51AM +0000, Lin, Wayne wrote:
> >
> > > -----Original Message-----
> > > From: Imre Deak <imre.deak@intel.com>
> > > Sent: Saturday, March 8, 2025 2:32 AM
> > > To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org;
> > > dri- devel@lists.freedesktop.org
> > > Cc: Lin, Wayne <Wayne.Lin@amd.com>; Lyude Paul <lyude@redhat.com>;
> > > stable@vger.kernel.org
> > > Subject: [PATCH] drm/dp_mst: Fix locking when skipping CSN before
> > > topology probing
> > >
> > > The handling of the MST Connection Status Notify message is skipped
> > > if the probing of the topology is still pending. Acquiring the
> > > drm_dp_mst_topology_mgr::probe_lock
> > > for this in
> > > drm_dp_mst_handle_up_req() is problematic: the task/work this
> > > function is called from is also responsible for handling MST
> > > down-request replies (in drm_dp_mst_handle_down_rep()). Thus
> > > drm_dp_mst_link_probe_work() - holding already probe_lock - could be
> > > blocked waiting for an MST down-request reply while
> > > drm_dp_mst_handle_up_req() is waiting for probe_lock while
> > > processing a CSN message. This leads to the probe work's down-request
> message timing out.
> > >
> > > A scenario similar to the above leading to a down-request timeout is
> > > handling a CSN message in drm_dp_mst_handle_conn_stat(), holding the
> > > probe_lock and sending down-request messages while a second CSN
> > > message sent by the sink subsequently is handled by
> drm_dp_mst_handle_up_req().
> > >
> > > Fix the above by moving the logic to skip the CSN handling to
> > > drm_dp_mst_process_up_req(). This function is called from a work
> > > (separate from the task/work handling new up/down messages), already
> > > holding probe_lock. This solves the above timeout issue, since
> > > handling of down-request replies won't be blocked by probe_lock.
> > >
> > > Fixes: ddf983488c3e ("drm/dp_mst: Skip CSN if topology probing is
> > > not done yet")
> > > Cc: Wayne Lin <Wayne.Lin@amd.com>
> > > Cc: Lyude Paul <lyude@redhat.com>
> > > Cc: stable@vger.kernel.org # v6.6+
> > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > ---
> > >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 40
> > > +++++++++++--------
> > >  1 file changed, 24 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > index 8b68bb3fbffb0..3a1f1ffc7b552 100644
> > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > @@ -4036,6 +4036,22 @@ static int drm_dp_mst_handle_down_rep(struct
> > > drm_dp_mst_topology_mgr *mgr)
> > >       return 0;
> > >  }
> > >
> > > +static bool primary_mstb_probing_is_done(struct
> > > +drm_dp_mst_topology_mgr
> > > +*mgr) {
> > > +     bool probing_done =3D false;
> > > +
> > > +     mutex_lock(&mgr->lock);
> >
> > Thanks for catching this, Imre!
> >
> > Here I think using mgr->lock is not sufficient for determining probing
> > is done or not by mst_primary->link_address_sent. Since it might still
> > be probing the rest of the topology with mst_primary probed. Use
> > probe_lock instead? Thanks!
>
> mgr->lock is taken here to guard the mgr->mst_primary access.
>
> probe_lock is also held, taken already by the caller in drm_dp_mst_up_req=
_work().


Oh I see. It looks good to me. Feel free to add:

Reviewed-by: Wayne Lin <Wayne.Lin@amd.com>

Thanks!
>
> > > +
> > > +     if (mgr->mst_primary && drm_dp_mst_topology_try_get_mstb(mgr->
> >mst_primary)) {
> > > +             probing_done =3D mgr->mst_primary->link_address_sent;
> > > +             drm_dp_mst_topology_put_mstb(mgr->mst_primary);
> > > +     }
> > > +
> > > +     mutex_unlock(&mgr->lock);
> > > +
> > > +     return probing_done;
> > > +}
--
Regards,
Wayne Lin
