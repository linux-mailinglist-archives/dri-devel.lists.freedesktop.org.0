Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D209DA00B40
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 16:17:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE22A10E03F;
	Fri,  3 Jan 2025 15:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YEe5l6yg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1879510E03F
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 15:17:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wAeHRWeR05blDUFrsq2hqW0V8uRXNLsOt69y5sy+wAHheI6JQmVdESDf0eykzZELPGXSMeIndonQtYR0oZN93ML5Cv0NUha7ahnSd7fY84NTWnnMhCTVuPY9tZ1nL2R0WmymrU0wgTObXtFWvadz0TwX1WLIqFrnh8RQtSPa3I75edbkrvl9N7NqBvcezDgnyAurPp9gS7bPY8/qq7fKZ6vBVI/lGG3lEXKPg2aPzVRizZIdcVi5GbmUuzztVs8TvsWli1BQLneb5rDflG6Vnj9rNLv7bWMTVY/maeoqSbOX1UX8pigFoMMg86R/MWqvO5J2lIYFarhaHo92cQS3xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1+XMh1hIPHfZ+qendKKEeZlstrU0iazCZopwQZpk/k=;
 b=kQW8mTUPCfObQpI0Y4iVrMWnDF0SrRxz8ACIwkF+3sZdpdkYIBtTMx97YwY7B51Bqz4KfmQuOEjlMJ6zeamfH0OIBX9Hk3oc9WOtNUHwbwzQuqm3J/yUfFCw/iJogNwG72NPKU2w4KO+raueoAEDGuM+cSX4FKYeCAXOCzoi/qGwz884NTvx7DwWcTPK6CPftXdl+17r/85xELxk76lyfCFPDcgYgCl1rNqDrs8lZxXq3YJcQyarvMzOQRT1Wux3M0w3IN+ELi/wMl+VaLk+A3wseYJHW775mUBy7SAgfbeIQE73GoC/4tHydlaeHx4kYxxkQBP0ZACo4W+9UPYQKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1+XMh1hIPHfZ+qendKKEeZlstrU0iazCZopwQZpk/k=;
 b=YEe5l6ygaiyqLw93xP0d6dux7l1meH6PUXsnQnpkgXLs3jFG34jwahcS2yhpdh5KIqbCctRvXedOP2MFCGQ8AjCaDkemAGA3KV53lZXHvEYTYEaZ0OJvYXhmL3IyKTJeUnswX1g7x3Zt/Jm2jK+zXLpD5xyyBynfXY+NWIP0eLw=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9169.namprd12.prod.outlook.com (2603:10b6:610:1a0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 15:16:56 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 15:16:56 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Tvrtko Ursulin <tursulin@igalia.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "kernel-dev@igalia.com" <kernel-dev@igalia.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, Danilo Krummrich <dakr@redhat.com>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <pstanner@redhat.com>
Subject: AW: [RFC 00/14] Deadline scheduler and other ideas
Thread-Topic: [RFC 00/14] Deadline scheduler and other ideas
Thread-Index: AQHbWttR/SkPSzVxqEKpxpl1ycLV6bMFLv31
Date: Fri, 3 Jan 2025 15:16:56 +0000
Message-ID: <PH7PR12MB568508440AB661A0B168721A83152@PH7PR12MB5685.namprd12.prod.outlook.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
In-Reply-To: <20241230165259.95855-1-tursulin@igalia.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-01-03T15:16:56.248Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5685:EE_|CH3PR12MB9169:EE_
x-ms-office365-filtering-correlation-id: d3692263-1e0f-4f72-8e65-08dd2c09a989
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Y9wznZihj9U2J3SG1Amb6xovzbdhQ1xUxRRGmY2DJ7R0UfVV1hsIV9XMAv?=
 =?iso-8859-1?Q?BSrSd9XYGerZif8fWsxFtkOdP3KxYT7X+WEwFw9bwEdDZLokuNR/G1KIk+?=
 =?iso-8859-1?Q?C/y6iUto2cyGMISCkLh/qLmdBOZAvwo7fmBi2uqOX3CZlWhlw4ncd+oQQ1?=
 =?iso-8859-1?Q?zPYpRuKUhfAjut1yOMxYYrVy+j+SBkAncLa7UHWpQj7FCR+u+p0zXJfRyk?=
 =?iso-8859-1?Q?n3yPJMed+EW4fA6HmYmMDZBXxAQbzaxwc86w7G1BqrLv4Fxn6CyNBWf+vy?=
 =?iso-8859-1?Q?gmiS+vzkJY1del5fbDJYEcKMzQfmzMANK+RED7plWNRL6qs3SoNCmfn1UQ?=
 =?iso-8859-1?Q?1i8/Jyitl+wJKl/bnLE6isiG1PbXkCNuU3roKwGPxA6ESo4Jx4YVGsZOsv?=
 =?iso-8859-1?Q?4FbbEEoRszDw51TgmKl2x6pS7QRwN6We36M0oYJlEoh3kr+UHkwXYA8X/p?=
 =?iso-8859-1?Q?MlG9CAJz3zQFnLzW0WwpYGhMxPqpdL6u4qgepuNv5RSTePXbhmmTeb/mQP?=
 =?iso-8859-1?Q?h9ISht0DbOmPjg/xTSyABKIlVoM77tNx6NobCFV7EnVOtbl4BVgv8lrDKU?=
 =?iso-8859-1?Q?C9SGHiJPZn1pqckVSliLYN1rHZ/VZxdXBunNA7w/UJxuF1XkmkBtNl3ff3?=
 =?iso-8859-1?Q?XukE6uAMxbGdzPVhkMI9alKKFXKbya0A2nIaGZQTLYFF+20c8bJm+v6SFE?=
 =?iso-8859-1?Q?n+/nzOoVnKLTHPVIg+R+iaJiQhBXZJ4Nd9CT27czNi0FLLX5Wp3XcP/+Yu?=
 =?iso-8859-1?Q?vE5CkFcmTL5MEOjp/7OhCnlLxKRRWZQ5HD+guXA7Xujb0TGhli9RajEh2R?=
 =?iso-8859-1?Q?ZGZKKdB/TRgzk5bzAUdkGkm9JVQXXKAXi2JUt6olJc5Eg2f0DFjFMrxXZQ?=
 =?iso-8859-1?Q?7am+RE0rkiZdlAh9JMGzPKvQQ4kT51+PJoBsVuFwdvLljmS2HryWd6x26M?=
 =?iso-8859-1?Q?tagUk9TtUHn0sUPrYG0h+XHMAobR60KERuaaVFyFQgVb2lV8Kobn2bKc8Z?=
 =?iso-8859-1?Q?VXYNeoRAhYLoOvhMYSQ5rn8P+vZ0GHTjDWCe9F+voKyMXE32tRu8xhINaf?=
 =?iso-8859-1?Q?W3ehyvYAP1LTCwmetCfLDF+kgr6xBU56ZuaNZdlfSSLaohihO/leYz2FCD?=
 =?iso-8859-1?Q?7PGlMNHa0fySuJ+BazxGFoobUXpcjTcmxRqGtSFKEBCNCj6P8loR/4inlj?=
 =?iso-8859-1?Q?CnxUIyYmZT3eHajMEIsmw9+Oj1brEZl04R8nKODe92Pofwr1RGJYvCnDOE?=
 =?iso-8859-1?Q?px64BhdiooDNk/234FOxOkSmg4s6UOFw7iDRThZrpYDAmxnDOrs3uljAEp?=
 =?iso-8859-1?Q?5cqHWqUXNRw7VHV3IsMew1ao5Z7TjAFvq3PLk6yi2/+kcSX6lALT9Ger6v?=
 =?iso-8859-1?Q?PpyxN/DZSGhghuU4TMj8ie1k5736R97ySpZH2Zt46fLrsMDlI+silSCxXh?=
 =?iso-8859-1?Q?1bEkSBLOfI1rpAQ3fxoIwDRL0SLDlY7LdNDlrmGcLn34G6STVHtBUiKFFV?=
 =?iso-8859-1?Q?KV+KpBE53I/s//d6eyhoRN?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?DbLIDnQC7NOQee0pCOEyQDaOZpUFzNoSBZTXKm73otutgAhJoXfjFZwhd8?=
 =?iso-8859-1?Q?Mo+CemAK6FlX5aPMZodUMixxxWN58W5uDNEN+gOji/Hpv6oSlUBgH1LSvK?=
 =?iso-8859-1?Q?p26t2Cy1soCG0ikOGzpb1atw8eNi4f7zuPz9N9xBFbuEnOacJl6gMrbp9F?=
 =?iso-8859-1?Q?Y7GKR/5ZULPg+ZCqbjv2G01P9scdb18QNI2GM4V7X+tou1i88WqgY+9P0n?=
 =?iso-8859-1?Q?A3FvJfPCcKbfpTP8WncvPXihleOfOsbPysuk+W93/T34m1EWokU5rHoGxx?=
 =?iso-8859-1?Q?oeH5JhgK5yfB+89PuyxRAPNH2FQORp1Jell8SRAYvI75h8uRaXFt5fK/D3?=
 =?iso-8859-1?Q?hppRk/8Ov7AXY3Lk7grArR1XS/ZaIUpeT/HMfHVKzQrmIYh+Xr0SRwckJ+?=
 =?iso-8859-1?Q?8nevsPqj5FAGpHkR7zWkX/wJH2JO0JG7rAYhkKgOPIThuKyrSlpNA2P+73?=
 =?iso-8859-1?Q?rvmV4Em/Fk/2xyYO9/epndXZGBqhZ1FvNhOMKhyawk6CI/NQkUulqVnUDa?=
 =?iso-8859-1?Q?ZekHooCDq2F/bJbQjrSCZVAttyPpOvzBKKw++bXPOBvLk2pjZJrbhySF7G?=
 =?iso-8859-1?Q?K/Kk6b/FVbFAMslxE7fxW/Pq2J0lzaV5VKAOblSi65CvujonT+CvK3iDSR?=
 =?iso-8859-1?Q?lXMRqUSdOekwuymK4uM+qQIhlVYKITQCXZ/17Wxx71lNO3IhgqG7khUv6U?=
 =?iso-8859-1?Q?oX+IkkCccx4q4FnviDMZraocLbpN0m7YirbryxxUbo+/BoQ/P4anU09rpY?=
 =?iso-8859-1?Q?nC1ZTdWwDXNgm7k/KxBsH5121ZrSdsNTAnAjMThyJeoGCWpNKLKNkEn/FE?=
 =?iso-8859-1?Q?btDBy6+k3ozj/geYAKWA2+slF5L143gtCtWOjm++q/jlMh22+Zmm1njv7w?=
 =?iso-8859-1?Q?Mzmg/2yFxETCNgKDiAShvMjr9VkdKQTgsWONpPDtu41viFt/SbfhpD2gjB?=
 =?iso-8859-1?Q?uAMa4j+NGCqWeBdIS6w5rlMN6cXp29PlWgsDgXXs69mhNDZscyGk6N3pdU?=
 =?iso-8859-1?Q?8gdCFcnDHO7PxBvLs/GSX1clg5EuKVC+6dy7kQwbRZUstfhFyLCQjQKHeT?=
 =?iso-8859-1?Q?ex46aJi3G/0U+AMPc607NSFz4OQkodeScT7YqWLDA70ckdPrhzOgaTpwRE?=
 =?iso-8859-1?Q?62da+4tzUJV6W+kLusVQwvYJevA3JBZbOit9sCbIDlcT9t7iNLhTxmPHte?=
 =?iso-8859-1?Q?KN6i23x0InUis3JbuN60B3m6kyVzXBTpVQsFDTAD6ZQ5xiOCu3flNeO9Hi?=
 =?iso-8859-1?Q?+z2qpgUpJj4EycmbI/Tc6dgOMUCUwGq1ZGoZ8tL5hDx14Tf9DX6CwqmKG+?=
 =?iso-8859-1?Q?lM24fsUYHpdBvCHkhTysngt4hR9QK19DZY4GUDekw2V/SDIpYsIQ7xuVMH?=
 =?iso-8859-1?Q?kfb6f3yNRbdWgR+4fltFzQdbNiIQybIwMno6ki17xdjj95pqD6yggTOFM2?=
 =?iso-8859-1?Q?GqZnqT8AD9Aqisxn8Fz3c6TTCUJbmVh/2ia/9NqhRLn7lIL8SBzD4YXhzG?=
 =?iso-8859-1?Q?DXkiDvhlmOLl/mRpgF/VeCkf0C327pqyDoIVoF7IgBCj9YPS5Ux9x5LMA0?=
 =?iso-8859-1?Q?80evJ3O0I0yjzy+nRcH3vKZ4xpkXboBuullK+H40dkZjPN8O0sESjINqEu?=
 =?iso-8859-1?Q?9gmcLs3h2qPis=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3692263-1e0f-4f72-8e65-08dd2c09a989
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2025 15:16:56.6877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uzc/5rEL3BArEgKIBYMLecqwLyC+gNHFx4ZHA5Et7Ktm7hl02CMM7PhY9oPSION7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9169
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

Could you send that whole patch set to me once more?

The AMD mails servers seem to have had a hickup over the holidays and all m=
ails received between ~25.12.2024 and 1.1.2025 are somehow mangled.

Thanks in advance,
Christian.

________________________________________
Von: Tvrtko Ursulin <tursulin@igalia.com>
Gesendet: Montag, 30. Dezember 2024 17:52
An: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com; Tvrtko Ursulin; Koenig, Christian; Danilo Krummr=
ich; Matthew Brost; Philipp Stanner
Betreff: [RFC 00/14] Deadline scheduler and other ideas

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

<tldr>
Replacing FIFO with a flavour of deadline driven scheduling and removing ro=
und-
robin. Connecting the scheduler with dma-fence deadlines. First draft and
testing by different drivers and feedback would be nice. I was only able to=
 test
it with amdgpu. Other drivers may not even compile.
</tldr>

If I remember correctly Christian mentioned recently (give or take) that ma=
ybe
round-robin could be removed. That got me thinking how and what could be
improved and simplified. So I played a bit in the scheduler code and came u=
p
with something which appears to not crash at least. Whether or not there ar=
e
significant advantages apart from maybe code consolidation and reduction is=
 the
main thing to be determined.

One big question is whether round-robin can really be removed. Does anyone =
use
it, rely on it, or what are even use cases where it is much better than FIF=
O.

See "drm/sched: Add deadline policy" commit message for a short description=
 on
what flavour of deadline scheduling it is. But in essence it should a more =
fair
FIFO where higher priority can not forever starve lower priorities.

"drm/sched: Connect with dma-fence deadlines" wires up dma-fence deadlines =
to
the scheduler because it is easy and makes logical sense with this. And I
noticed userspace already uses it so why not wire it up fully.

Otherwise the series is a bit of progression from consolidating RR into FIF=
O
code paths and going from there to deadline and then to a change in how
dependencies are handled. And code simplification to 1:1 run queue to sched=
uler
relationship, because deadline does not need per priority run queues.

There is quite a bit of code to go throught here so I think it could be eve=
n
better if other drivers could give it a spin as is and see if some improvem=
ents
can be detected. Or at least no regressions.

Cc: Christian K=F6nig <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>

Tvrtko Ursulin (14):
  drm/sched: Delete unused update_job_credits
  drm/sched: Remove idle entity from tree
  drm/sched: Implement RR via FIFO
  drm/sched: Consolidate entity run queue management
  drm/sched: Move run queue related code into a separate file
  drm/sched: Ignore own fence earlier
  drm/sched: Resolve same scheduler dependencies earlier
  drm/sched: Add deadline policy
  drm/sched: Remove FIFO and RR and simplify to a single run queue
  drm/sched: Queue all free credits in one worker invocation
  drm/sched: Connect with dma-fence deadlines
  drm/sched: Embed run queue singleton into the scheduler
  dma-fence: Add helper for custom fence context when merging fences
  drm/sched: Resolve all job dependencies in one go

 drivers/dma-buf/dma-fence-unwrap.c          |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |   6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  27 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h     |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h   |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c     |   8 +-
 drivers/gpu/drm/scheduler/Makefile          |   2 +-
 drivers/gpu/drm/scheduler/sched_entity.c    | 316 ++++++-----
 drivers/gpu/drm/scheduler/sched_fence.c     |   5 +-
 drivers/gpu/drm/scheduler/sched_main.c      | 587 +++++---------------
 drivers/gpu/drm/scheduler/sched_rq.c        | 199 +++++++
 include/drm/gpu_scheduler.h                 |  74 ++-
 include/linux/dma-fence-unwrap.h            |  31 +-
 14 files changed, 606 insertions(+), 678 deletions(-)
 create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c

--
2.47.1

