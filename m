Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5607AB1ACB6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 05:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF99710E081;
	Tue,  5 Aug 2025 03:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SNABKdSX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D119310E013;
 Tue,  5 Aug 2025 03:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754364243; x=1785900243;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sKJ52MEM+IiTlX7zUQl4UISXy2kZSmhLXvMLzf2UIX4=;
 b=SNABKdSX1mWGz8+7AmrGMB6jZn7kWpGqHcdNgU6zjpyUoPAdlLgFEK8G
 AeDOxr5dTCxEYBQu5I9U8ps59rSSTddDsEQSDXHU9j/rUcvcSLmKDoolS
 GETLWWdh41MNLlVmLDsjVnKr9B1wJwI49HBzBYsOtDZrAilYPRq/3c/Nj
 eZAfDdwWkCrJoX/TBV1y5moBFyClyT1dWDEEDdEBt50aOwYehM9Y5oun0
 Vj5NMk6veJW5tCpnb/2Git9Z76wHBFCItpnJ9xNU38pFN5GNTd+jAL57+
 msyGeJpsN+5JJh2uytXKiUk108ueGhBeuHp9etS+eVCy5gz6OMz8/PPcY g==;
X-CSE-ConnectionGUID: WMhHtVDLQly1NGkSGQQgTQ==
X-CSE-MsgGUID: jwJkBPduRIyRFcjZR4eCmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56561068"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="56561068"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:24:02 -0700
X-CSE-ConnectionGUID: CM5bHTjwT/+KkOER9vn7dw==
X-CSE-MsgGUID: BwcqpT1PTOuKEDtBWFOc4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="165134797"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:24:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:24:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 20:24:01 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.86)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:24:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eX8lLPKdI6ywMPMskNjLIUKqd873pKMsPzfUlthkX9Ol74ypOMbnN2NeALsNKL13bdWTYlg4aM2+vz8I6Gm6GO7oBnUoY+/VVshl/Hs9WVIishGP0AktU4TkFTOp3KNEWW6WilpZdGSrl6VPBX5k+t+3ENVdurA45GejVkzSgjLEfkHzFE7IrWOLnJ/6UvM3Qk6aN2O8CEyi8sSQu1QUaeFJqs482Stue0Nio0/Jt4khVa60k3twkM4yOZXE0iEHXccxOni1DnVbWv/5Hfq8CLSWXjrdItvdyh1PWqbGj4pHQGvWcPVeUCKMq0+1SsuHY/sTZny0GLOMKMhjy7DMzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKJ52MEM+IiTlX7zUQl4UISXy2kZSmhLXvMLzf2UIX4=;
 b=XKUzrYby3Uz1mDVe7m33Md51mPszEO1aco7P/5ppGGApe85JAZ7kJC7zuM7UWAHctZ8UTkJb6UVNDFtKf71SJy2MTbfb5SmrJciWgzZuZkfsV/JxCQH5ieAIc4zdp8WQZwiH7Ni+J4pzLes3a7JUtaYSQkQKb8KTNTlYXDssrk0pOZ0WZJ5/t+doJhGNYnb8dV3f6uJqUgrSXw5yDuy4ugHwRgd/2H7oOY2Jk1ei6dAEmE+t/8JHVeTu//aWDLdJHwYwZYJ+141kvj01ynjxJpynvfxdnbgG6q58optfkKeUzEqreK8g+sDZW7582OVALYN3KFFKCtvc3H+7lq1qdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5290.namprd11.prod.outlook.com (2603:10b6:408:137::5)
 by BL3PR11MB6338.namprd11.prod.outlook.com (2603:10b6:208:3b2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 03:23:17 +0000
Received: from BN9PR11MB5290.namprd11.prod.outlook.com
 ([fe80::99ac:37b3:de42:5594]) by BN9PR11MB5290.namprd11.prod.outlook.com
 ([fe80::99ac:37b3:de42:5594%5]) with mapi id 15.20.8989.017; Tue, 5 Aug 2025
 03:23:17 +0000
From: "Kumar, Naveen1" <naveen1.kumar@intel.com>
To: Xaver Hugl <xaver.hugl@kde.org>, "Murthy, Arun R" <arun.r.murthy@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>, "chris@kode54.net"
 <chris@kode54.net>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "mdaenzer@redhat.com" <mdaenzer@redhat.com>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "alexdeucher@gmail.com" <alexdeucher@gmail.com>
Subject: RE: [PATCH v3] drm: don't run atomic_async_check for disabled planes
Thread-Topic: [PATCH v3] drm: don't run atomic_async_check for disabled planes
Thread-Index: AQHcAuXFK+bpMrt3/EOn1U6huUbFW7RSRW4AgADDV4CAAFs/4A==
Date: Tue, 5 Aug 2025 03:23:17 +0000
Message-ID: <BN9PR11MB529028C2BFB87E7751ED42B7A722A@BN9PR11MB5290.namprd11.prod.outlook.com>
References: <20250801131053.6730-1-xaver.hugl@kde.org>
 <ad9b68cc-4a33-406a-9512-ff5f5460bf99@intel.com>
 <CAFZQkGwviMAshk5gSF0pDmkqbfZT=6FHCfNq6PWj8srNEXjX7w@mail.gmail.com>
In-Reply-To: <CAFZQkGwviMAshk5gSF0pDmkqbfZT=6FHCfNq6PWj8srNEXjX7w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5290:EE_|BL3PR11MB6338:EE_
x-ms-office365-filtering-correlation-id: 4884d7df-3723-4eb3-6a2c-08ddd3cf6bae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RXZPaTVDWU9wdmJDZzQ1SHo4T1k5dGdqMVFPcWcyV2NoT2JvMmtSNW1JV28y?=
 =?utf-8?B?Mkh3N1d3ekttUnc0b2VDRjk1MjREcnN6eUJ3NFZiaGdqVVZpbVdWTzdlQzkz?=
 =?utf-8?B?YW94TkdZQnlPNXd2OVBrZHpBai9jaVQ4K2FIMGR1dUVSTEExL3pXcHdNdGdR?=
 =?utf-8?B?ZWpFV3Njckh1Y0JjRUEvbFR6MlZMNnpQSm1LQ2FZS3JiWG1TSlB1cEYzZExK?=
 =?utf-8?B?Y0J0dHAwNm9NbVdMeG5sUDhXNTlRREF3V2VEbm5XMUdCYi9hYmd6enFVaHM2?=
 =?utf-8?B?WVN5eFA2M2Z2VzVXVThPNUNGcnN4RGc5MHBaMldZclNYVkFXNGc5ZGkwMWxT?=
 =?utf-8?B?SjhOTnF0WUtUK054S1lTNy90Z2J2K1RRcnBsSUJ3dTlBU3A5SjBtTWZlQ25M?=
 =?utf-8?B?MEx4cExzdFF3ZU82aUFrK3NjQi9MYytvdVRyZjNXMUpHOENaVXQ0SGhFbFNT?=
 =?utf-8?B?TVgxcHI2NzliRnZYWmNyUlBUb2pSaVFiR0VjTjVldjY5OC9uY2RlcUNqSzM2?=
 =?utf-8?B?QnlqYk81bjFIQjJsTnYrNkRKZFo3MlkxckhkMlFYZnc3cUQ5em9VWVE5NlZY?=
 =?utf-8?B?aVU2V05qeS8wOXp3OVJtV3ZoR1dUYnptQkpGVDVCb2NLbWg1aWI5eUxCMVAv?=
 =?utf-8?B?QW5XS2NCT2p5MWh2QVdIdW5RUFFNMDJXTmpTZmhVa2FOY1REVzVrTjI3bUxB?=
 =?utf-8?B?dEVNOUFkZEUrbDh5QnE0Rm9xK1FOVnlrMWFlVjhTZCtoMDE0QnZrYVlJVFZi?=
 =?utf-8?B?N1NucWpqQmNSUFArSzJmSVc0OHBGNUpQU2VsRzhmY2pXRk5MakNQQ1RkZTAx?=
 =?utf-8?B?VDdQY29PTFBnWE9SRk01cnRtSjBkQ1lWeWZHcGRERkpUbEJ6dmZjbFYrRU15?=
 =?utf-8?B?Z05qalQvWkxnME9yRUpXK0JBOEdqSkxYbnZhRlZlSFpiNzRwUHVNcy96Q0sx?=
 =?utf-8?B?bWhqRUoveHdPUVdOSzg0cHZtV3JkbnQ1U0dFS1daR1BtVTRNSWpLSzdNOVN4?=
 =?utf-8?B?ckhoUXZ2SkNCSlZ1Rno5VWdEUDR6ZkF6N1R1WHNYZldMN3U4RTRDTVovd0w0?=
 =?utf-8?B?NVFaMkhtUXU1OVFqangwbGlibS9sMXM2UmR6QWFReFNWSU9RdkZ4Znc2VGRl?=
 =?utf-8?B?cEtGMHJsQzNWbkF6dGVSMEExaWNHaXRiSUhkUWx3Ny84OFpMUXRONmJ4ZWlq?=
 =?utf-8?B?M2JiZWxzRlY4QTUyNDBqcmNRNnl4bjlPMWRWTFhqUE9CVmZkZHhpNjlGaDlU?=
 =?utf-8?B?Q0xoN0FmZW95MjcxZ3hUSDNXYWdGVjB5WlR1c3o2d2JOaTl1TXFhd1I1MnB5?=
 =?utf-8?B?WUpINlJWUGgrdjh5SFVBbzY4dVRtZkhNK0pMcmZ3Y2I0endLenUwaThob3l4?=
 =?utf-8?B?OG00ZnIvY1RxSVl5dHk1b00vd2VSOEhzWTlwMmx4NVFoRlNQVjQ4Q2s0QW5G?=
 =?utf-8?B?eitBNjQyT0tYdTZZZWgxQXlsc2N1UjloWisyTEJjQy9NZWtHTTdHbXcycTEz?=
 =?utf-8?B?Q0l3MmMvcU9nZ1c0THZ4VXR5WlUxZm9XVklwMTI1RzFJU3Z3MDRzMkJ2WWMz?=
 =?utf-8?B?d09ldHV5ZEtmdmVSUldqcmVVZmVVcDdoN3o1aFM1amJuUllUbXNHeGJBQ0wy?=
 =?utf-8?B?bWJUWFdocTdBZVZDK3dabW4rMldBeE1Yd3Flb1NRT3ZzVnhPeFNlVXV3cTg5?=
 =?utf-8?B?U3pSZkNBajl5UGFKVkEwSVVQSXoyYStldUZna05OZjhXZno3OUlzZUZQVkt4?=
 =?utf-8?B?Si90WUIxOGVXU2ZHUzVmUi8rSlpuK1J5dVR4QjNlaE5YY08vUkE0NGtTazFQ?=
 =?utf-8?B?U2RrR242eDlGUGpEaVJpVEpXSDFtczNqeHk2N2pvRnpxOHdGOWdJRzkrcUNX?=
 =?utf-8?B?TWFxSnI1TkQzVVF0cCt1cTJqMisrR1NSUjVRL0dyMVduVVdGbUhRVWVPZmNk?=
 =?utf-8?Q?EBevgzRIOvw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5290.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHR6T0t6Y3JqK2VGV3AwUnRMek5nQ3kzMHRDWGhNM2VaZ0s1MEpJWW1idlB0?=
 =?utf-8?B?TlM4UFV1a29YNHU4TUFHQVBvczlzZ25tWTJFMCtSM1FKdVE0WVBkWTVpU0Zx?=
 =?utf-8?B?ZE1UbnFpZFB6WVJnQ0dDRXNOTzhFT1h3WUxwRmxHU0RUSUt1T3lSSUthQTNP?=
 =?utf-8?B?YmQvT3VGVklLbXN3OHFpenJTL0xUQ2FtYlNHYnhUbnQ4Q2dha1drTGpOeDNv?=
 =?utf-8?B?aWRXVnJjZ3JoL1BJb1hDNjdIOHF2WDhPUFh1cFh1MHNxN2ZsZ3dMWi9pdmxp?=
 =?utf-8?B?dHV2cHpmS2o1VVp5aXIwV1kzTVNRVkxub0dtZ1g4RXpJNTdJYU5rYlJrMGFU?=
 =?utf-8?B?cmp2N1U4QjNqZVJIMk5DbUlncEJkWHQ1N0orUFJ3V2FTQWhNQUFqeEZpREFi?=
 =?utf-8?B?ejZnSEswYWEyb3BHaWI3OFpZNFVlUUplRWowZW00MXdjdU5zOUNLcXZRYXo5?=
 =?utf-8?B?My9YVCtEVmZFemsvWGpBMWxRd0VhcjZWclJHQk9ORjk2UnlaN1o2dWdlcG5E?=
 =?utf-8?B?OCszOC9sOEtIZFBRZ3gwNHpWc2dxUGE0M24vUXYxTEJqeEZXRmFYMzIydHUz?=
 =?utf-8?B?WlZBTm5pK1lmQ2VkQWNHWTA4TUQvdUt1L0pjUEhBWDN6QjQwTlp3eldzRFdo?=
 =?utf-8?B?dHBDRUpTd1d0NmhaYkpuYjRFazVKaVRZWFJQRFVwbCtDRE4yaXkxQy83QWVE?=
 =?utf-8?B?T0tBeDFVNW5hRjd2eXF3dVhFT2N1UWFneXZ6ZGJ2U09GS2VOYWtUQlQrb1V4?=
 =?utf-8?B?NXl5WlZoemR5VEwra3FxU3B6UUl6NDczMHVOclFIcEJDN1pJbWkyUkdRU2Vy?=
 =?utf-8?B?Z08zdmd4R1VsMkc3L0FZcWdMQnFBTTVyTU1TUm1uaHEydGN2UDdlYTJQaHpC?=
 =?utf-8?B?Vk4xajBwcmpkb2VBbWk0cndCWFM3OURvTldZQXhIN1RqcmJNUi9Wb3ZYSkd3?=
 =?utf-8?B?dkxzcFZxeDIrUituNHNyeWlSbEVjRXVpOVRiTW83NEtYRGtBV2twbFVHRXY2?=
 =?utf-8?B?eENQcC9EM3RWbzA0aDFYZHB6c3hvZDByL2NLQVpFMitWZi9SUllUS3NISGdl?=
 =?utf-8?B?T3Bmdmp5Q3IyalNiQkJYWjV6UEpjdkp4NC8xUWtONWd3WDBXRGUxdHRNeW43?=
 =?utf-8?B?VmV3bEVqVVo5dXVNTHBwSG9JM2JGd1AyeWx5R2t0QWRjeVhZS3RIcmNqZWts?=
 =?utf-8?B?UnVrc3l5Q0xXQjRkTTJ2SW15ZlEwSUU2M3Z2WTQ5c0kvT2t4a2crN0NjYWNR?=
 =?utf-8?B?Y01FMDNHSld4Z2R4MUNCdmk3ZHFoVmVmVlJqM09FcTJQQTdYeFI1NzdvaUlx?=
 =?utf-8?B?c1hmTkxTTWYySy9Ub0xNT0l1c3N5bWlSa2QvbFBtOGV0RlhsTGcrYXdzV1NF?=
 =?utf-8?B?K3dZMm80enFPZHVCSTFidEYycFBJMXE4aVBwN0hnTE4yOUV6UnkwUGZINzBI?=
 =?utf-8?B?NThpcWVYY3NHY052MzJjWVpXOHhVZElBWGJqN1diL1hUNDdLNVFWMGZnNHUx?=
 =?utf-8?B?M2hVaEdlNWV2WDFZUWUxMHgvSXdXV2toeGVrZFZVNWF5VjFzZ082Tnk3ZC94?=
 =?utf-8?B?OGk4Smt2M3hhL1ZWdnd0VTFBeG80ejNaWFdZWDJmVTdxY2M5Q0NtbmJveUNK?=
 =?utf-8?B?a3BDNjhyVHdQV3c2b1JQZ2ZIQWRnbkhsOHpRV0MyemQwbDB6OFZpQU1TaGpM?=
 =?utf-8?B?Rm5lNlNWZFlIMi85ajdFL1hnWndJSy85ZEVLNXdwYk1jSXdxTkVDa2V6b050?=
 =?utf-8?B?Tk9MRS9LUVJTSmZyaDFmQVNkS2pKWkV2c0hkbzNyekd4bGdLWGVEckZtMlg2?=
 =?utf-8?B?UjFUUnZuZXVFSk4xaWVmTmtYd2c5WElZQkErWFpXZ1F0SzcxU3ZHcEpUMXVO?=
 =?utf-8?B?aEZZRll3blRGNmhmdmNUQVlBQWlLQStObkRYRWNJOUM0UXNzV24wSTVaRTFI?=
 =?utf-8?B?RVhBVWR4WERzcTZHVytTOStEVkhuS0ZPTit2MDlvMlBMZUtuY25xUTBVcmN3?=
 =?utf-8?B?b0RqSzQvakRKS2lxSFloNUdWdXkyVjZmell0aGh3YkdUZmdYb2ZzZ25zZitN?=
 =?utf-8?B?WjlPYzM2WnEzQjhVdVN2ZXdRVVcrakhtWVVURlBZaHNMMy9VaHYwTkhYbWlC?=
 =?utf-8?Q?EISuHKA/napITExVOOyBTN9V5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5290.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4884d7df-3723-4eb3-6a2c-08ddd3cf6bae
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 03:23:17.4291 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zdz46fB8y2yXS5jyDt9dv6Y+eoGKBVCZ6ac8nWN5sfH4QZTtsNs9EEzgIOD4KiwP9/94gQyMFufkechxirJIiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6338
X-OriginatorOrg: intel.com
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

SGkgWGF2ZXIsDQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFhhdmVyIEh1
Z2wgPHhhdmVyLmh1Z2xAa2RlLm9yZz4NCj5TZW50OiBUdWVzZGF5LCBBdWd1c3QgNSwgMjAyNSAz
OjAzIEFNDQo+VG86IE11cnRoeSwgQXJ1biBSIDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj5D
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgYW5kcmVhbG1laWRAaWdhbGlhLmNv
bTsNCj5jaHJpc0Brb2RlNTQubmV0OyBLdW1hciwgTmF2ZWVuMSA8bmF2ZWVuMS5rdW1hckBpbnRl
bC5jb20+Ow0KPnZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tOyBtZGFlbnplckByZWRoYXQu
Y29tOyBpbnRlbC0NCj5nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZzsNCj5hbGV4ZGV1Y2hlckBnbWFpbC5jb20NCj5TdWJqZWN0OiBSZTogW1BB
VENIIHYzXSBkcm06IGRvbid0IHJ1biBhdG9taWNfYXN5bmNfY2hlY2sgZm9yIGRpc2FibGVkIHBs
YW5lcw0KPg0KPkFtIE1vLiwgNC4gQXVnLiAyMDI1IHVtIDExOjU0IFVociBzY2hyaWViIE11cnRo
eSwgQXJ1biBSDQo+PGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPjoNCj4+DQo+PiBPbiAwMS0wOC0y
MDI1IDE4OjQwLCBYYXZlciBIdWdsIHdyb3RlOg0KPj4gPiBJdCdzIGVudGlyZWx5IHZhbGlkIGFu
ZCBjb3JyZWN0IGZvciBjb21wb3NpdG9ycyB0byBpbmNsdWRlIGRpc2FibGVkDQo+PiA+IHBsYW5l
cyBpbiB0aGUgYXRvbWljIGNvbW1pdCwgYW5kIGRvaW5nIHRoYXQgc2hvdWxkIG5vdCBwcmV2ZW50
IGFzeW5jDQo+PiA+IGZsaXBzIGZyb20gd29ya2luZy4gVG8gZml4IHRoYXQsIHRoaXMgY29tbWl0
IG1vdmVzIHRoZSBwbGFuZSBjaGVjaw0KPj4gPiB0byBhZnRlciBhbGwgdGhlIHByb3BlcnRpZXMg
b2YgdGhlIG9iamVjdCBoYXZlIGJlZW4gc2V0LA0KPj4gSSBkb250IHRoaW5rIHRoaXMgaXMgcmVx
dWlyZWQuIEFnYWluIHRoZSBwbGFuZSBzdGF0ZXMgd2lsbCBoYXZlIHRvIGJlDQo+PiBmZXRjaGVk
IG91dHNpZGUgdGhlIHNldF9wcm9wKCkNCj4+DQo+PiBBbHRlcm5hdGUgYXBwcm9hY2gNCj4+IEBA
IC0xMDkxLDggKzEwOTEsMTYgQEAgaW50IGRybV9hdG9taWNfc2V0X3Byb3BlcnR5KHN0cnVjdA0K
Pj4gZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+Pg0KPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgIC8qIGFzayB0aGUgZHJpdmVyIGlmIHRoaXMgbm9uLXByaW1hcnkgcGxhbmUNCj4+IGlzIHN1
cHBvcnRlZCAqLw0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChwbGFuZS0+dHlwZSAh
PSBEUk1fUExBTkVfVFlQRV9QUklNQVJZKSB7DQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJldCA9IC1FSU5WQUw7DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC8qDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIGNvbnRpbnVlIGlmIG5v
IGNoYW5nZSBpbiBwcm9wIG9uDQo+PiBub24tc3VwcG9ydGVkIGFzeW5jIHBsYW5lcyBhcyB3ZWxs
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIG9yIHdoZW4gZGlzYWJsaW5n
IHRoZSBwbGFuZQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8NCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHJldCA9PSAwIHx8IChwcm9wID09DQo+
PiBjb25maWctPnByb3BfZmJfaWQgJiYgcHJvcF92YWx1ZSA9PSAwKSkNCj5UaGlzIHdvdWxkIGFs
bG93IGRpc2FibGluZyBhIHBsYW5lIGluIGFuIGFzeW5jIGNvbW1pdCB0aGF0IHdhcyBwcmV2aW91
c2x5DQo+ZW5hYmxlZCwgbm90IHN1cmUgdGhhdCBzaG91bGQgYmUgYWxsb3dlZD8gQWxzbywgaWYg
dGhlIHByb3BlcnR5IGlzIGZiX2lkLCByZXQNCj53b3VsZCBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQu
IEJ1dCB5b3UncmUgcmlnaHQsIHRoaXMgc2hvdWxkIGJlIGZpeGFibGUgd2l0aCBzbWFsbGVyDQo+
Y2hhbmdlcy4gUHJvYmFibHkgYmVzdCB0byBrZWVwIGl0IG1pbmltYWwgZm9yIHRoZSBidWdmaXgu
DQoNCkFzIEkgY29tbWVudGVkIGVhcmxpZXIgaW4gdGhlIGdpdGxhYiBpc3N1ZSBbMV0sIGFueSBj
aGFuZ2Ugb2YgcHJvcGVydHksIGluY2x1ZGluZyBkaXNhYmxpbmcgYSBwbGFuZSBpcyBub3QgYWxs
b3dlZCBpbiB0aGUgYXN5bmMgY29tbWl0LiANCldlIG11c3QgZGlzYWJsZSBhIHBsYW5lIChlLmcu
IEhXIGN1cnNvcikgZHVyaW5nIHRoZSBmaXJzdCAoc3luY2hyb25pemVkKSBmbGlwLCBhbmQgYWxs
b3dpbmcgbGF0ZXIgZmxpcHMgdG8gcHJvY2VlZCBhc3luY2hyb25vdXNseS4gDQpUaGlzIGNoYW5n
ZSBzaG91bGQgYmUgZG9uZSBpbiB0aGUgY29tcG9zaXRvci4gQXMgcGVyIFZpbGxlJ3Mgb3Bpbmlv
biBpbiByZWxhdGVkIHNlcmllcyBbMl0sIGtlcm5lbCBkcml2ZXIgc2hvdWxkIHJlamVjdCBhbGwg
dGhlc2UgZGlzYWJsZWQNClBsYW5lcyBpbiB0aGUgZHJtIGNvcmUgYW5kIGRyaXZlciBzaG91bGQg
b25seSBnZXQgdGhlIHBsYW5lcyB3aGljaCBpcyBzdXBwb3J0ZWQgd2l0aCBhc3luYyBmbGlwLiBC
YXNlZCBvbiBoaXMgY29tbWVudCwgSSBoYXZlIHN0YXJ0ZWQNCldvcmtpbmcgYW5kIHdpbGwgYmUg
YWRkcmVzc2luZyBpdCBpbiB0aGUgbmV4dCB2ZXJzaW9uIG9mIG15IHNlcmllcyBbM10uDQoJDQpb
MV0uIGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1
ZXMvMTM4MzQjbm90ZV8yOTk0NTk1IA0KWzJdLiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
YUhBZzJKLXVGTExXSU5xcEBpbnRlbC5jb20vDQpbM10uIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVk
ZXNrdG9wLm9yZy9zZXJpZXMvMTUxMjgwLw0KDQpSZWdhcmRzLA0KTmF2ZWVuIEt1bWFyDQo+DQo+
TG9va2luZyBtb3JlIGF0IHRoaXMgY29kZSwgSSBhbHNvIG5vdGljZSB0aGF0IGl0IGN1cnJlbnRs
eSBhbGxvd3MgeW91IHRvIGNoYW5nZQ0KPiphbnkqIHByb3BlcnR5IG9uIG92ZXJsYXkgcGxhbmVz
IGluIGFuIGFzeW5jIGZsaXAsIHdoaWNoIGRvZXNuJ3Qgc2VlbSByaWdodC4NCj4NCj4+ICsgIGRy
bV9kYmdfYXRvbWljKHByb3AtPmRldiwNCj4+ICsgIltQTEFORTolZDolc10gY29udGludWUgYXN5
bmMgYXMgdGhlcmUgaXMgbm8gcHJvcCBjaGFuZ2VcbiIsDQo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb2JqLT5pZCwNCj4+IHBsYW5lLT5u
YW1lKTsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZWxzZQ0KPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7DQo+Pg0KPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHBsYW5lX2Z1bmNzICYmDQo+PiBw
bGFuZV9mdW5jcy0+YXRvbWljX2FzeW5jX2NoZWNrKQ0KPj4NCj4+IFRoYW5rcyBhbmQgUmVnYXJk
cywNCj4+IEFydW4gUiBNdXJ0aHkNCg==
