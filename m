Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3C4A9E240
	for <lists+dri-devel@lfdr.de>; Sun, 27 Apr 2025 11:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC0610E189;
	Sun, 27 Apr 2025 09:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VK8vaJ/L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA3E10E191
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Apr 2025 09:48:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRxGl9V/iW321dXjkNwT18s6DvFD7OE+1pvYNbsnjtL19OSTkFvUEfId//TWDDv9rQHS8Y1utucSdxlWg+WDzVnO381WMxpbUNU5ZAercDIYgNNra9UaUML9nAehcNfMxp0A5w6U7b0SZAk8AltHU+H5V+UFKjrmyiglubMBsOkZPyh4o4PvI0D4+Comku6Fsy5iQNub75U04KgVoSCZJvki+kpklnnT91wNw4nRxf6YaY1FA6JOzyMZwUe7Bk8Yp5ZQ6BHrCOwWsVfHz9uoapnO6YOIFZDXfvQaAUjS5//VDj2iiT6rPeI6ABtrcMCMJ5rrl5P5ZquQwyDBdksQdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjfXtBS00qD+PkKpOEA5G+Gb4IRZQ5OY2Ydkipel+KQ=;
 b=xyYQePiML0oePU3tEbnwI/j4Hc9q3U8GwJ2zFNuX01utDzdq5u+oy0YtwkD2Zzjl0afQzMCOxLCJRyHJUUF+2Hid/rmu5yyja04/nUB0kFmeBUSOY7W9CTLe+mV24AX+FQGNkYaiiKQ+X3rig6bYsMiyZWLSyXQelj3wmThgJPX+IyWNJ6oB7+gpLvT96N4RkGKl6TNaP/GCAFyC64VLA4639kJFhhILvwelR57CIxzhALStSv+DPax58+lFEnUoKPR5otHxXoHmYqLDbYs0ZHjPEfaEphKX9N9PFywMoqGGrADabD0f8cMHUy3VwnmWNejphAwwWTrXt50uEfDQUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjfXtBS00qD+PkKpOEA5G+Gb4IRZQ5OY2Ydkipel+KQ=;
 b=VK8vaJ/L+/bRczPkci+8gLyOxEcjbQRwDJedHspJwp12xF+1NNjulnHw/VVB20lhT3RSFvnVNy+BzrwARz8HqNJtFKTbrMBJN9kr7Vqb4LEf767JbqXMDvSML8yok4Skk63LqpiEwwbkMaLUFawfyAIUn+2/o7duk9oWXu4Q+aw=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by MN0PR12MB5858.namprd12.prod.outlook.com (2603:10b6:208:379::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Sun, 27 Apr
 2025 09:47:59 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282%3]) with mapi id 15.20.8678.028; Sun, 27 Apr 2025
 09:47:59 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: =?utf-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>, "Limonciello, Mario"
 <Mario.Limonciello@amd.com>, "Wentland, Harry" <Harry.Wentland@amd.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH 1/2] drm/dp: Correct Write_Status_Update_Request handling
Thread-Topic: [PATCH 1/2] drm/dp: Correct Write_Status_Update_Request handling
Thread-Index: AQHbtMYS5LiIBY9dS0qsT0uyVLlUjbO0eGiAgALPOMA=
Date: Sun, 27 Apr 2025 09:47:59 +0000
Message-ID: <CO6PR12MB5489C39D0CEC67A23A016D0AFC862@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20250424030734.873693-1-Wayne.Lin@amd.com>
 <20250424030734.873693-2-Wayne.Lin@amd.com> <aAughd9lynkGlydF@intel.com>
In-Reply-To: <aAughd9lynkGlydF@intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=29e9ab89-faf3-4c46-8988-8c56b7df7361;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-04-27T09:45:20Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10, 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|MN0PR12MB5858:EE_
x-ms-office365-filtering-correlation-id: 193bc53c-7eb5-4c82-84cb-08dd85709824
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MThOY0puVzB5WWJ6ZkJSdEVCQ1lpRFVuRU9qdlVPb0k1L09mVlE4bEFFTjBw?=
 =?utf-8?B?QVF1bDhyRXZCeHEzdk4ra3lhdzFodmgvcmFPVmhzdENKdmxxY2hxNjJYWTRs?=
 =?utf-8?B?WW5WN0I0TERxRVNlUjkrdUs2NjQzbC9aRUx0KzZ0SHpMMFlvRWRnaGxDVW81?=
 =?utf-8?B?TXlwVVZDZmMwL3pPWnFGUit2RXc2Y2FwNzhOZGppQlJ5cVp3Y1JoMm5ISi9p?=
 =?utf-8?B?Wkk3TCs4azJwejFteVc5S3hZRFAyQ2NWMUhtNERUYnUxOVYvVk5nRkdaVHo1?=
 =?utf-8?B?Q29oQkNxMmkyaUFRdzNyZ3pmZHoxSDhjME5EOFVUbnIxbnRocTRQTFhNb1Zk?=
 =?utf-8?B?aWpkSE1OUFg2WWhxRCs0SmRDcWNqbzhSSXgzcVIzNHZkbExqZE1kd0k0WUFh?=
 =?utf-8?B?ZFMxd2I4Tkd5NEJjcGlOVnZRdEZ6cUx6ZXB3WDJUdER5MjZhWVN4NmZtNG9N?=
 =?utf-8?B?Ti9PcE5jUU1SOXVCbzhzT1VvcUF1ci9NUEdGY0ttUVhWT2psSCs4NGxXZ0FB?=
 =?utf-8?B?Wkd1dmhYWUZJK3pscVZOTzRCY25pa0lGRituY0xINEM1QTFTNnlTMVJoQXZr?=
 =?utf-8?B?NGNrQndRakx2MVZCVEFaWG1ZNk95WjR2ZDBtWWFYNXBKWjZyeTh5RzdqVmVR?=
 =?utf-8?B?Q1M4LzdBeWU3Z1E2UzRBVDJkakNvY0cwODJzZFBwWUpIK3ZEcXBRd0IyRTVF?=
 =?utf-8?B?cEtFL2VmeWR6UmUrbkZXZjJRcmwzYndoQlFWUVVLaXNSOTQ0aDBoc1plUzFV?=
 =?utf-8?B?ZjgxQ25tTTloSCtkQk10N21SVWRUSnNqVDBVamZPV3NQY1VwZzhuQzJUZXls?=
 =?utf-8?B?R2VITVkybnl4WnN0U3FWQ1JKSVBodlhCT1lRaVBIWm5YMkt6MmJSbURrd1Ux?=
 =?utf-8?B?QzlGemlhYzFyZDZ5NUtMeXYwYXdaaEFMaFhaNUs2blBLMHkwd0lXc1lQb2hi?=
 =?utf-8?B?c0FLcHRLa3V2Mm80TlhsaHdGa0FvYWNRcWI2NmdKK1lHQkREZTRyN0pEejN6?=
 =?utf-8?B?MkJLWGtYUkEzVjNCYURoWkVQbWVjWkowY1F5Szdwek5YQnZiYjUwclhvaEcz?=
 =?utf-8?B?RDhYVVdZTHhEZzFEM05KbHlyU2Z1a0RjZGQzMEhtRW9UNnFSZU51cXhvWkJE?=
 =?utf-8?B?blZwQitjejhRb1c3OTJGSUUxUko5VTcrbmtRc095Tnh6TmNGaVVWczRrbUlN?=
 =?utf-8?B?TmYzT2RGSFhvT3puUkFtSm1GMURYUFNNZ0pzd3hZZzF4bWQyUGlxbnUvUDBw?=
 =?utf-8?B?amNKbm1rdlFhaGxYcTBGb2p5MWlLMTBpM1dnUmkrbU9FdmRhQjRGUU9Ed28x?=
 =?utf-8?B?d2lXUVFtQzRQOE9WMHlDb242NlJOVm9CdWllSC9Lc3FBT2VCVHBRQkRCUWpa?=
 =?utf-8?B?NGRNRmJlU09INkNodEhhMUdHK2xmT1dOMlA2dWNIYkFzSkVzVnRSdFlDeDdm?=
 =?utf-8?B?MjU0Q2JPcGVLSXNHSHFpRlN3MEJhYzdjNUh2ajBWdlpLbXV0eEYweDkzMjZN?=
 =?utf-8?B?VnpaZEx3YkZKVDVlTnQ2UVp3bEt6dkhkSWtCMDhGMXZESGFPTy9NeG1BYlZ2?=
 =?utf-8?B?aVNMWFVqUGN3UnUvUTIwaXFVbzJiT0ppWTVReWtiT1MzWFhQSEwxS0tTdzRD?=
 =?utf-8?B?SWlyNjFTZUhrZ09abWpiWXdEdXEzY0NzWXdOWVNIR2ZObzB0M25pcHltVGJR?=
 =?utf-8?B?a0gwTi9EZmwvNGVtb21lMEVidWwvZDQzeVo0YTFmUlZZeWJIOG1NaUx3SEhX?=
 =?utf-8?B?QjYvNk8wUHdSSjdIRitnS3NnK284NXoyVDZDbFRBVUtMOER3eHlSbnlaTjF2?=
 =?utf-8?B?T2NUSFdoNWp3Q1l6cEhISnd1SDhTclhXOER3TEhvem10dHVIRHdFRUJWWFFZ?=
 =?utf-8?B?bDM0S2l5OW9tSEUxcm9RN2pYWHlBQ3dGRCt5RWFlaCtTdkJMclZ0aEVUWXBv?=
 =?utf-8?B?c3FMUzFVQ1RDbWJrYUYvQlNnSXdZU2NJcTRpaEd3MHY1d2h3bzFVK3JoVzB3?=
 =?utf-8?B?Y3lsQ0RkNmxnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0FPNklMU2VKRTduNDhHd1NGWW9xMDYxK2RUL002SVBWd0ZFcDZkSE1VNnlY?=
 =?utf-8?B?QUllZjZzWk9XQjB4b1NBOWloQUo1R2JhbE9zdmxMUVIyOXpVeHFrVVFpWStG?=
 =?utf-8?B?L2JaNGpZOHMzanlMcXo0UU9JTFB6TDFPM1ZMVmlpcjRjMVRxeTNtcHY3Y1lu?=
 =?utf-8?B?aTN6bzMwS3psdnMxV0J6cnhhdGZOR1Y5bjNxeWRxSUVMbStjTElZQzJLdU1n?=
 =?utf-8?B?dzViWGQ4UEVHVmtNeG42Q29zdGxMaVdSV3NiRWFxem5MZ1dSZHFIbnhIQVpK?=
 =?utf-8?B?aVBxdXNKdyttK0Jsbkl5cjQ4MmlLMUFYQmVHOXY2NlBoSmlnV2VaWjlMN0p1?=
 =?utf-8?B?RVJ4djRSTDh0UGpKYmI4QkJseWowTmYrZTQyamtzNUJpUWtocEROZE8yNUhH?=
 =?utf-8?B?dEt3UGxLeE9KYStVMm1GNFhLR3k3c2lDT1orUGNJZCsxcmpMdzhGUks1Q2J1?=
 =?utf-8?B?MlJOZWRDWjZYUWZqanllWEhkdDlIRDBOcExnZUZTeU9CVnN2M2lmYk5XdHlB?=
 =?utf-8?B?V2l1Ynd2TDVSWS9mOXk4NW54Y1JTa1lIUnhXRVpjaG1sd2RFYWJmeHA5blBk?=
 =?utf-8?B?NktkSWI4RlI4NDl6OFI0MkRmbEUwZW00WXgycWNoU3pxcWQ2bnNrRWZTMjI2?=
 =?utf-8?B?WTdTZ3ljRVBMZHUwdWo1bytCZG80Q29MMzN6eXBXOWRFSi81eEF4N1hyT3Vz?=
 =?utf-8?B?V1ZFY1ZiUG1jNEZoK1hzZUt1TUVZb0lQb0JqenlNZTYrL2pvODdGNTl0L3Q4?=
 =?utf-8?B?RzVYSnROOXByL1NtS2IzQ0d6SDBvY24vYmhPUG16c1ZGN052ZVhlZldvMFBE?=
 =?utf-8?B?RGdra2FMd0Mxc1NOd3pESXJ1Y3hXbDFrdGdES0RXREJVeXBUczlpcTllTTE4?=
 =?utf-8?B?eXh3Q1lPaHVFRy8xKzJDeXh2YkxzeW5WMVIreVpRZ0xXSTNEaGp0aDhqTzNa?=
 =?utf-8?B?TFdaeVZWRGdicUl1a0RTUXo5MThJWWw2a3dobGROYUt2NXM1R0tXUmlXQUJs?=
 =?utf-8?B?blhqVFIvV21sSlRRWjVLd0VQNWc0aytvcFR1TG55TkliV1BYNHRKRW52M3Nx?=
 =?utf-8?B?c2VCUUpkZzAwTDFyVzJ3aXZON0Fndm9uY0FLN1prWGRZSmNITU9oL24wQ3Ja?=
 =?utf-8?B?QjBqRWZBNjRvNllvUjdBTlJ5aEo3YWw0Q2FoN3p0ZlhXZG4xSldUOCtSR0dI?=
 =?utf-8?B?UW9EZk81NWpWaVpxY2xjRDhxYmpuMjlUdHpDMEZuT1lrWnZzT0tKYXRIK2RK?=
 =?utf-8?B?bVdjRVZGVFVSdURyMUpRZk9xSXJxNTJwL05JTm5jRWNDZTR3SkpDbVVxZkRI?=
 =?utf-8?B?MmE4TUl2R1lWSnV1TlpjWmZiSEJXbW1pVnpkS3hiclZYNWp4N3c5OUpCcE4x?=
 =?utf-8?B?YjgzNGlOZGlOSG9TRkJQSXRCN05QQVd6VGZLR0ZRUFIwSk1yMHZDdkh6T0Np?=
 =?utf-8?B?OXRmQVdkU1kxRWxiK0VlMnpuQTFaTTVSRUdmVVdLUHhWaDBMWmd2b2tyNXAw?=
 =?utf-8?B?cTEvRDNPdHIxeDRqZFhuNERLWVlWUHJvM3VZKzRsZDNPMEV3b0p6a0ZSNzQ1?=
 =?utf-8?B?Qm9lTVoxemNaOFo4TjR2RXhHeTB5NmVDYUFqbXhqZ3dSRTNIdjNRZ25aRXdF?=
 =?utf-8?B?cHNuaVpRUU0yZlE0UytSMEdxZzJqYUpGZ3A4Nkk2WE5GYmRWQnhwVlhxbG9m?=
 =?utf-8?B?OERvVHNPVjc4dFBwbjBXMElsWjhjODR1NC9vTUhLWnY5WDlnRTFsaU9acW0y?=
 =?utf-8?B?RXJ0U3R1cjRQVHZzN2NBRjhSekR0clhXT1dPekhUcGFoSDJNS3prajE5V0NI?=
 =?utf-8?B?T3BsZG4ycGd6Nll0UzhObWY1Qzl0VXBvbzVBYVB6Znp4aXZ2NTdNV1daQlBH?=
 =?utf-8?B?VkhLcG0zQ3JWZzQxdzBucFJFMHlmdGFhenRGVTlkeU55VVpTbjBrdFVKUG5O?=
 =?utf-8?B?MlYzTmRKQmFxU0plTHlpTUNjRTcxckZZQndPTzNXcTRLaU9uK05tZDl3blp4?=
 =?utf-8?B?Smc0VTlDZTdFL3pMbWN2VVh2OEZ6SEhGdEFJSGt4U1VxU0lqZ2pITFlSTlEy?=
 =?utf-8?B?TkNDRDZQSE80amJzWmJuMHdHRm83ZVg2bW5ZREI4YjdPRkNUa1hhQ0pVVzRP?=
 =?utf-8?Q?UlFU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 193bc53c-7eb5-4c82-84cb-08dd85709824
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2025 09:47:59.1792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jmwKum6YZg008lkAZtA/GCrUB0q6FWOVovtMfrwiIaVUAQiXTpLCb+YNqpov2gWU7PgCV8BHmGTNLWP+ALqLJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5858
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

W1B1YmxpY10NCg0KVGhhbmtzIGZvciB5b3UgdGltZSBWaWxsZSBTeXJqw6Rsw6QgIQ0KQW5kIGxp
a2Ugd2hhdCB5b3UgcG9pbnRlZCBvdXQgaGVyZSwgc29ycnkgSSByZWFsaXplZCB0aGF0IEkgbWlz
cmVhZCB0aGUgY29kZQ0KZmxvdyBqdXN0IGFmdGVyIEkgc2VudCBpdCBvdXQuIFdpbGwgaGF2ZSBh
bm90aGVyIHBhdGNoIGZvciBmaXhpbmcgdGhlIGF1eCByZXF1ZXN0IGZvcm1hdA0Kb25seS4gVGhh
bmtzIQ0KDQpSZWdhcmRzLA0KV2F5bmUNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0K
PiBTZW50OiBGcmlkYXksIEFwcmlsIDI1LCAyMDI1IDEwOjQ4IFBNDQo+IFRvOiBMaW4sIFdheW5l
IDxXYXluZS5MaW5AYW1kLmNvbT4NCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IGphbmkubmlrdWxhQGludGVsLmNvbTsgTGltb25jaWVsbG8sIE1hcmlvDQo+IDxNYXJpby5M
aW1vbmNpZWxsb0BhbWQuY29tPjsgV2VudGxhbmQsIEhhcnJ5IDxIYXJyeS5XZW50bGFuZEBhbWQu
Y29tPjsNCj4gc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEv
Ml0gZHJtL2RwOiBDb3JyZWN0IFdyaXRlX1N0YXR1c19VcGRhdGVfUmVxdWVzdCBoYW5kbGluZw0K
Pg0KPiBPbiBUaHUsIEFwciAyNCwgMjAyNSBhdCAxMTowNzozM0FNICswODAwLCBXYXluZSBMaW4g
d3JvdGU6DQo+ID4gW1doeV0NCj4gPiBOb3RpY2UgZmV3IHByb2JsZW1zIHVuZGVyIEkyQy13cml0
ZS1vdmVyLUF1eCB3aXRoDQo+ID4gV3JpdGVfU3RhdHVzX1VwZGF0ZV9SZXF1ZXN0IGZsYWcgc2V0
IGNhc2VzOg0KPiA+DQo+ID4gLSBJMkMtd3JpdGUtb3Zlci1BdXggcmVxdWVzdCB3aXRoDQo+ID4g
ICBXcml0ZV9TdGF0dXNfVXBkYXRlX1JlcXVlc3QgZmxhZyBzZXQgd29uJ3QgZ2V0IHNlbnQNCj4g
PiAgIHVwb24gdGhlIHJlcGx5IG9mIEkyQ19BQ0t8QVVYX0FDSyBmb2xsb3dlZCBieSDigJxN4oCd
DQo+ID4gICBWYWx1ZS4gTm93IGp1c3Qgc2V0IHRoZSBmbGFnIGJ1dCB3b24ndCBzZW5kIG91dA0K
Pg0KPiBkcm1fZHBfaTJjX2RyYWluX21zZygpIHNob3VsZCBrZWVwIGdvaW5nIHVudGlsIGFuIGVy
cm9yIG9yIHRoZSBmdWxsIG1lc3NhZ2UgZ290DQo+IHRyYW5zZmVycmVkLg0KPg0KPiA+DQo+ID4g
LSBUaGUgSTJDLW92ZXItQXV4IHJlcXVlc3QgY29tbWFuZCB3aXRoDQo+ID4gICBXcml0ZV9TdGF0
dXNfVXBkYXRlX1JlcXVlc3QgZmxhZyBzZXQgaXMgaW5jb3JyZWN0Lg0KPiA+ICAgU2hvdWxkIGJl
ICJTWU5DLT5DT00zOjAgKD0gMDExMCl8MDAwMC0+IDAwMDB8MDAwMC0+DQo+ID4gICAwfDctYml0
IEkyQyBhZGRyZXNzICh0aGUgc2FtZSBhcyB0aGUgbGFzdCktPiBTVE9QLT4iLg0KPiA+ICAgQWRk
cmVzcyBvbmx5IHRyYW5zYWN0aW9uIHdpdGhvdXQgbGVuZ3RoIGFuZCBkYXRhLg0KPg0KPiBUaGlz
IGxvb2tzIGxpa2UgYSByZWFsIGlzc3VlLg0KPg0KPiA+DQo+ID4gLSBVcG9uIEkyQ19ERUZFUnxB
VVhfQUNLIFJlcGx5IGZvciBJMkMtcmVhZC1vdmVyLUF1eCwNCj4gPiAgIHNvdXJlIHNob3VsZCBy
ZXBlYXQgdGhlIGlkZW50aWNhbCBJMkMtcmVhZC1vdmVyLUFVWA0KPiA+ICAgdHJhbnNhY3Rpb24g
d2l0aCB0aGUgc2FtZSBMRU4gdmFsdWUuIE5vdCB3aXRoDQo+ID4gICBXcml0ZV9TdGF0dXNfVXBk
YXRlX1JlcXVlc3Qgc2V0Lg0KPg0KPiBkcm1fZHBfaTJjX21zZ193cml0ZV9zdGF0dXNfdXBkYXRl
KCkgYWxyZWFkeSBjaGVja3MgdGhlIHJlcXVlc3QgdHlwZS4NCj4NCj4gPg0KPiA+IFtIb3ddDQo+
ID4gUmVmZXIgdG8gRFAgdjIuMTogMi4xMS43LjEuNS4zICYgMi4xMS43LjEuNS40DQo+ID4gLSBD
bGVhbiBhdXggbXNnIGJ1ZmZlciBhbmQgc2l6ZSB3aGVuIGNvbnN0cnVjdGluZw0KPiA+ICAgd3Jp
dGUgc3RhdHVzIHVwZGF0ZSByZXF1ZXN0Lg0KPiA+DQo+ID4gLSBTZW5kIG91dCBXcml0ZV9TdGF0
dXNfVXBkYXRlX1JlcXVlc3QgdXBvbiByZXBseSBvZg0KPiA+ICAgSTJDX0FDS3xBVVhfQUNLIGZv
bGxvd2VkIGJ5IOKAnE3igJ0NCj4gPg0KPiA+IC0gU2VuZCBXcml0ZV9TdGF0dXNfVXBkYXRlX1Jl
cXVlc3QgdXBvbiBJMkNfREVGRVJ8QVVYX0FDSw0KPiA+ICAgcmVwbHkgb25seSB3aGVuIHRoZSBy
ZXF1ZXN0IGlzIEkyQy13cml0ZS1vdmVyLUF1eC4NCj4gPg0KPiA+IEZpeGVzOiA2OGVjMmEyYTI0
ODEgKCJkcm0vZHA6IFVzZSBJMkNfV1JJVEVfU1RBVFVTX1VQREFURSB0byBkcmFpbg0KPiA+IHBh
cnRpYWwgSTJDX1dSSVRFIHJlcXVlc3RzIikNCj4gPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlr
dWxhQGludGVsLmNvbT4NCj4gPiBDYzogTWFyaW8gTGltb25jaWVsbG8gPG1hcmlvLmxpbW9uY2ll
bGxvQGFtZC5jb20+DQo+ID4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQu
Y29tPg0KPiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+ID4gU2lnbmVkLW9mZi1ieTog
V2F5bmUgTGluIDxXYXluZS5MaW5AYW1kLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL2Rpc3BsYXkvZHJtX2RwX2hlbHBlci5jIHwgMjcNCj4gPiArKysrKysrKysrKysrKysrKysr
KystLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9k
cF9oZWxwZXIuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX2hlbHBlci5j
DQo+ID4gaW5kZXggNmVlNTEwMDNkZTNjLi4yOGYwNzA4YzNiMjcgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX2hlbHBlci5jDQo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX2hlbHBlci5jDQo+ID4gQEAgLTE2MzEsNiArMTYzMSwx
MiBAQCBzdGF0aWMgdm9pZA0KPiBkcm1fZHBfaTJjX21zZ193cml0ZV9zdGF0dXNfdXBkYXRlKHN0
cnVjdCBkcm1fZHBfYXV4X21zZyAqbXNnKQ0KPiA+ICAgICAgICAgICAgIG1zZy0+cmVxdWVzdCAm
PSBEUF9BVVhfSTJDX01PVDsNCj4gPiAgICAgICAgICAgICBtc2ctPnJlcXVlc3QgfD0gRFBfQVVY
X0kyQ19XUklURV9TVEFUVVNfVVBEQVRFOw0KPiA+ICAgICB9DQo+ID4gKw0KPiA+ICsgICAvKg0K
PiA+ICsgICAgKiBBZGRyZXNzIG9ubHkgdHJhbnNhY3Rpb24NCj4gPiArICAgICovDQo+ID4gKyAg
IG1zZy0+YnVmZmVyID0gTlVMTDsNCj4gPiArICAgbXNnLT5zaXplID0gMDsNCj4gPiAgfQ0KPiA+
DQo+ID4gICNkZWZpbmUgQVVYX1BSRUNIQVJHRV9MRU4gMTAgLyogMTAgdG8gMTYgKi8gQEAgLTE3
OTcsMTAgKzE4MDMsMjIgQEANCj4gPiBzdGF0aWMgaW50IGRybV9kcF9pMmNfZG9fbXNnKHN0cnVj
dCBkcm1fZHBfYXV4ICphdXgsIHN0cnVjdCBkcm1fZHBfYXV4X21zZw0KPiAqbXNnKQ0KPiA+ICAg
ICAgICAgICAgIGNhc2UgRFBfQVVYX0kyQ19SRVBMWV9BQ0s6DQo+ID4gICAgICAgICAgICAgICAg
ICAgICAvKg0KPiA+ICAgICAgICAgICAgICAgICAgICAgICogQm90aCBuYXRpdmUgQUNLIGFuZCBJ
MkMgQUNLIHJlcGxpZXMgcmVjZWl2ZWQuIFdlDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgKiBj
YW4gYXNzdW1lIHRoZSB0cmFuc2ZlciB3YXMgc3VjY2Vzc2Z1bC4NCj4gPiArICAgICAgICAgICAg
ICAgICAgICAqIGNhbid0IGFzc3VtZSB0aGUgdHJhbnNmZXIgd2FzIGNvbXBsZXRlZC4gQm90aCBJ
MkMNCj4gPiArICAgICAgICAgICAgICAgICAgICAqIFdSSVRFL1JFQUQgcmVxdWVzdCBtYXkgZ2V0
IEkyQyBhY2sgcmVwbHkgd2l0aCBwYXJ0aWFsbHkNCj4gPiArICAgICAgICAgICAgICAgICAgICAq
IGNvbXBsZXRpb24uIFdlIGhhdmUgdG8gY29udGludWUgdG8gcG9sbCBmb3IgdGhlDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgKiBjb21wbGV0aW9uIG9mIHRoZSByZXF1ZXN0Lg0KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICovDQo+ID4gLSAgICAgICAgICAgICAgICAgICBpZiAocmV0ICE9IG1z
Zy0+c2l6ZSkNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgZHJtX2RwX2kyY19tc2df
d3JpdGVfc3RhdHVzX3VwZGF0ZShtc2cpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgaWYgKHJl
dCAhPSBtc2ctPnNpemUpIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgZHJtX2Ri
Z19rbXMoYXV4LT5kcm1fZGV2LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAiJXM6IEkyQyBwYXJ0aWFsbHkgYWNrIChyZXN1bHQ9JWQsDQo+IHNpemU9JXp1KVxu
IiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYXV4LT5uYW1l
LCByZXQsIG1zZy0+c2l6ZSk7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmICgh
KG1zZy0+cmVxdWVzdCAmIERQX0FVWF9JMkNfUkVBRCkpIHsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1c2xlZXBfcmFuZ2UoQVVYX1JFVFJZX0lOVEVSVkFMLA0KPiBB
VVhfUkVUUllfSU5URVJWQUwgKyAxMDApOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGRybV9kcF9pMmNfbXNnX3dyaXRlX3N0YXR1c191cGRhdGUobXNnKTsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29udGludWU7DQo+ID4gKyAgICAgICAgICAgICAgICAgICB9DQo+ID4gICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiA+DQo+ID4gICAgICAgICAgICAgY2FzZSBE
UF9BVVhfSTJDX1JFUExZX05BQ0s6DQo+ID4gQEAgLTE4MTksNyArMTgzNyw4IEBAIHN0YXRpYyBp
bnQgZHJtX2RwX2kyY19kb19tc2coc3RydWN0IGRybV9kcF9hdXggKmF1eCwNCj4gc3RydWN0IGRy
bV9kcF9hdXhfbXNnICptc2cpDQo+ID4gICAgICAgICAgICAgICAgICAgICBpZiAoZGVmZXJfaTJj
IDwgNykNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGVmZXJfaTJjKys7DQo+ID4g
ICAgICAgICAgICAgICAgICAgICB1c2xlZXBfcmFuZ2UoQVVYX1JFVFJZX0lOVEVSVkFMLA0KPiBB
VVhfUkVUUllfSU5URVJWQUwgKyAxMDApOw0KPiA+IC0gICAgICAgICAgICAgICAgICAgZHJtX2Rw
X2kyY19tc2dfd3JpdGVfc3RhdHVzX3VwZGF0ZShtc2cpOw0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgaWYgKCEobXNnLT5yZXF1ZXN0ICYgRFBfQVVYX0kyQ19SRUFEKSkNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZHJtX2RwX2kyY19tc2dfd3JpdGVfc3RhdHVzX3VwZGF0ZShtc2cp
Ow0KPiA+DQo+ID4gICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsNCj4gPg0KPiA+IC0tDQo+
ID4gMi40My4wDQo+DQo+IC0tDQo+IFZpbGxlIFN5cmrDpGzDpA0KPiBJbnRlbA0K
