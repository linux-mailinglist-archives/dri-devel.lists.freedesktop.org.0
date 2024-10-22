Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D2B9AB1D0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 17:18:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6F810E6A2;
	Tue, 22 Oct 2024 15:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AVZpMYRN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2059.outbound.protection.outlook.com [40.107.95.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60ED10E6A1;
 Tue, 22 Oct 2024 15:18:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K6N9E/VCf975F2Jd/sxbQHifZdLb3qKN7kifU7ohu/s1wnxwlx5wb5yMCjcl+0NCPhJqV4zctrgTpWY6i3A69RQT2a0XvQbMk/szZQoW2I3P5XjR/SyegxcN0q9GzK0s3jpYUpVZE4y3jYf3FTkZoiUsDkpvazxpnWcoJYufjGH6j8iZTlWdbbTkjSh/oqFgHBxKV0Dojeakz7NGNXq1eaBYvHH0dNgNyPc7+vQXcbblrJKvMaddfAbII5K0fTQ7XqyXVZRFVi/rsVUIp2wJzgs+hbwDq7F8VhvIsZSqIAbg0Pae4S0AWiuoWAKKz17ONymuVGwLXShci1tMYvNVjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSmBA5tZd7NX9q5cLZvbw/1792BdLUdvPeA8wfhS3Kw=;
 b=Jda9Ci3Dx7QrICCmU4pgey2X86CFuat4aEwqtZ/ndPssu/dpi8w2V7MI+8n2ExKy3KPma6yI/vcWVZ/NzAJ9Rc2Nhz7GZg6JCf2uMHGDeJWksf4t75FvPmXtjD2SKFDxIeRrXGtGKF/s5kbp4lnLuSh4QD0j9eXTm7sOC/t9362yXxluPwBJryLseiApaNjVsVUWzAajDmnKRBDBJFR5RvEOWx3yYx6XFfEZFiovCM75wXqzfEEhsDWsN4swFq4crfSafxyxB8Lj8ylq924VM9Cc7deUa9VDG/UcFpMJHt6NgnG3PMR60e7hq/dYbqq5F0/KhHGfHX+H/L+5JBRG2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PSmBA5tZd7NX9q5cLZvbw/1792BdLUdvPeA8wfhS3Kw=;
 b=AVZpMYRN+FtxE/TtyjSF+85+jHS2zhlxOMd20L4oSRsgDNjEFZ5+mST0s/t8Js42z/j3BSFOf7YGqaz5tO4PkaWCrQXqYoqGwfKwv0wPd4YWsE9XuwVXnt1E77nHgyHJ+LTId+4voESHHafMXqt9M2hTXcXPD1bWMH/KzYNLb64=
Received: from SA1PR12MB8599.namprd12.prod.outlook.com (2603:10b6:806:254::7)
 by MW4PR12MB6924.namprd12.prod.outlook.com (2603:10b6:303:207::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 15:17:57 +0000
Received: from SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b]) by SA1PR12MB8599.namprd12.prod.outlook.com
 ([fe80::25da:4b98:9743:616b%3]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 15:17:57 +0000
From: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "tvrtko.ursulin@igalia.com" <tvrtko.ursulin@igalia.com>
Subject: RE: [PATCH v5 4/4] drm/amdgpu: track bo memory stats at runtime
Thread-Topic: [PATCH v5 4/4] drm/amdgpu: track bo memory stats at runtime
Thread-Index: AQHbIWJhHP+NzSvtr0Wud0WRwWwvcrKSaWAAgABzHCA=
Date: Tue, 22 Oct 2024 15:17:57 +0000
Message-ID: <SA1PR12MB8599E3DD01B4A45AD7CA71FAED4C2@SA1PR12MB8599.namprd12.prod.outlook.com>
References: <20241018133308.889-1-Yunxiang.Li@amd.com>
 <20241018133308.889-5-Yunxiang.Li@amd.com>
 <1057097f-02f4-4f0f-9ac5-37aa84570b47@amd.com>
In-Reply-To: <1057097f-02f4-4f0f-9ac5-37aa84570b47@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=ddb63621-019a-4051-b4ea-4168bf335ea5;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-10-22T14:36:02Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8599:EE_|MW4PR12MB6924:EE_
x-ms-office365-filtering-correlation-id: 9fdd632f-fef4-4674-e0b0-08dcf2acb5ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aGNzSzQ3M0Y4T3Myb290Mkg3clFJU3FWdFVycGRrbUFhc3JLYVBlcWhzWmJs?=
 =?utf-8?B?R2FSOWdsV3hlS0szV3FXeXVvZzYwNWFncGxUWFgxckkwaW1XWGdPbmRTSHd5?=
 =?utf-8?B?QmNTd3dQdXV6ZHFuZWxHQitPVi93UUdmOTZWK3BtaXhucTIvbTM5cnRtSXRY?=
 =?utf-8?B?SVVhZzZ3QWpIUkZCSVd3bXVEaGdENG0yM0orRWs5Z09zMmZqdno0Y284TEZT?=
 =?utf-8?B?Wm1HYnJRZFNKenZlTUM2UHVhTTNMRlpuQlFJR0h4V0RVcElWYkQwUjVnME9m?=
 =?utf-8?B?UEMxejdMd2VxQklzck1zQnBIdFdOcTZXQjdPdC9jU3hEbnY5eUpNU1RlMVZy?=
 =?utf-8?B?MG1jV1R3SXhjT0RYdTcwcWtndTlRcldyUy9wcHUrZTUzM0ZNRkRiZEQvL2o1?=
 =?utf-8?B?SUVsTmpEYmxycStYV2VOSlZpVjBaeGNTbzRYVnJtMTVKVlhFN2RQZytFV2Zu?=
 =?utf-8?B?YUcrdSs3Y21welJIaERuVjdzc281NXdkeWpRN0d1RCtGRFdIeHFVMGRLOUkw?=
 =?utf-8?B?M0pySVdQbmVSdnJ5TEVoWElGS2VFOUpvZEQrdDN0cm81Tk4yTWRWZTJWS0U4?=
 =?utf-8?B?czkycGpadGlpd3M5Y2FEajF4NC9tZkl6U3ozTCtjY0pDZHRxLzBnb3o0MWMr?=
 =?utf-8?B?TTdXbE5pN2xGS3ZBTmhLQVpMNXlTcG45L3o2ajJveno1TGFlN0ZTUzdLcStO?=
 =?utf-8?B?ekMyc282aVQ1SnBYT3F0UmVVWDlzRERvbnJxY2llMGI3VVg5alNicUhwcm1O?=
 =?utf-8?B?UllvVW55SGJta1JLTFJuK1RMaFd6MFhKdi9qN0ZpcCt6SlZmdFNjUlFtdzAv?=
 =?utf-8?B?VWdJZTJCTXc2dDhnMjdIaHQ4aDg0aHovakVOUlZjMjJPSnBvaXJXZG53eTVu?=
 =?utf-8?B?aTliM3hBd3JZTCtyejNhaCtOcTNuYkNnSkNuQmVyUFdSOUt2QlZHTkxKeEo4?=
 =?utf-8?B?dVVjUzRoUlZvc3JhWnpoZUdvQ0FRc0psRkpsTCtIcHY4U3FoN1p0K3ZoMDZz?=
 =?utf-8?B?WHdLTkRKYkFLQlBwM0lMNE1CMDVWaDZLZFBlYXVrczJ5SndKWlNSS2Z3MXdP?=
 =?utf-8?B?UHdFb3o1QldmTVlLbWZmbFBoSDJHKzNzZm9rczJrdHRNV1VyNVJxTGNDamZ2?=
 =?utf-8?B?blpqY3V6MFNwRlZYTC9reVQzTVU3S0VoLzVrT2ZqRzVwVTRYbnN0S3E1M1VF?=
 =?utf-8?B?T1JPbmRPNmVsSjlodjlmQ0JYUTBubW4zdlhPekRxNHk1dDdiN2hMTzdRMlY4?=
 =?utf-8?B?WFQzaHVxRy82UGtkNlk3VjR0UFhtZEtybjRnOHN3a2kxRzkvTWVOL2tkT0g3?=
 =?utf-8?B?ZmkrUVllZUt6OEhQREdYSE1sRndWdkVZaUVzSFZzNy9GbExzOXZrWlQ1VmR0?=
 =?utf-8?B?d1kyOW9ONUVwN3dIT3lpekNmQkdHSktjZkJTZGFCb01WeHcya1Nna1MrU2tN?=
 =?utf-8?B?Z3NzR0NHR2tBa3NKUko2ejdtR1hsZ2oxY3FEckpJSGtXanFEZDc2UUkvWGFE?=
 =?utf-8?B?bUgxUFIzeWhuclFibFhmWVVqb21OSVh5WTZzejFzaFhaR29RT2cvTG0wRkpZ?=
 =?utf-8?B?c0tUaXhZamFqL216ZEhuRXphZnVVVG5hWjlmWmdydjViNXNMaXZnc2QzYVNY?=
 =?utf-8?B?RWNJZktBUlp2RUd0NHV4dXV0QUhmRENQeFN1VXJpYkMyYmZFYzIzeDRmU2Fp?=
 =?utf-8?B?TlBIMThYQkZ2V2VzSTNFLzcwei9pbHhGZUlac3dxZ09jUG1aUGRET3FuajQ1?=
 =?utf-8?B?d2ljOGtEWVFMYjRWd1E0OEFBdnIwb0dudHZtN0V4V3g2bjZsZU00RWg5MWhJ?=
 =?utf-8?Q?V7EonD5DJm+AWt/RuKmuJoK8DmmM08FC13YpA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8599.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejB1UW9JWS9xdHdjNDJJa2taUkNZbWhEc0IvdHRBenZRaUdLbEJNSlNxdW10?=
 =?utf-8?B?SzBIYXJSbjFKK0F1M1ZhUE5zRU1ZclFUVjcwTmVhL0ZjQ0JUYk9idzF0MFZp?=
 =?utf-8?B?ZnA2amtqYWxNQyszb2RueG5aTFlOa0NiV0d3YndTMUZtb2x0a1J0dzZnVXc5?=
 =?utf-8?B?S0MxMG9WQzJuQXRSVks2dHJLZkZyVjVaL3Vsd21sQWxDQ0I0UzFvMk56QlFS?=
 =?utf-8?B?S2tYLzJ2ZlJPdzR6aEJRTEl4NTRGYUlGbFRjNWc1T1VlMnE1WEtHZ1VnQWxu?=
 =?utf-8?B?Ym9hTWxqUDhvdjJtblJyYkg0cnZCeVIzNStaK2pXNHpIUEZSejMyc3RET3FS?=
 =?utf-8?B?VVNDam1UZUVWQ0ZNTTk3M3RHNERvTVRISnR6bldYZ1FZU2srWjk2dnczb1dm?=
 =?utf-8?B?ZFZqQmVxOUZ1THEwNWQ2V1JPWW5wTnpXalB2dW1XRVpYYU1PODFqNkFIcXdo?=
 =?utf-8?B?TXlCR2NtMWF2MGVONG5MMlZvUm5hSlc2ako3YUlyeGhVS2c4QmwzNHB3RnJ5?=
 =?utf-8?B?UFpxZHprVG1UZHVkZU1QUVlVQUZWVUdJeDB3anBjSlU5WElwZkRjVDhMSnF3?=
 =?utf-8?B?K21LUDBBVVNSNTZYclZ3b2NtdzVSRmI0emNyOUdjNWU0Z3ZQbVBYV2xFRnJZ?=
 =?utf-8?B?OGNEVktkcStxRzVGMzhucG9pQzFreitkTDJyZ3hibm1jQmVNRXFvMDdtZHB3?=
 =?utf-8?B?Yzc1YWVmMFRZNzFjSmNPbytLQjFBS095dXZUbVBNcTZ6WURjOXpTZmJJL0No?=
 =?utf-8?B?d2U2enJHQ0NhZmVSekxNLzZ6aXREOVhVM29ZSFJkK2FhTC9rcXpoNEc0U1Fu?=
 =?utf-8?B?bVg5M0hVYWo3cUxvZ2dLenRGb0dQVmU4c1E0V2tGYkFQRS9ka1RlKzBlMXVq?=
 =?utf-8?B?R0tndXVpN3RYcjNjQ09melpjY1lta0h1bFB6SEk0TVhQVXBwVWhFem5HUDND?=
 =?utf-8?B?cTNHY1BFM3I3a2JaY3BaMC9YMTBKUzRHR2FXWTdtbU5iSWVDbmJ5L09Gclo2?=
 =?utf-8?B?Ky92NjBPckkxYW45QjZKNnI3ODJ1VXBWN1JSMUtKME96ckFXYVh1Unp2dFlH?=
 =?utf-8?B?c0RDT3R2Rlg5YlRFV3FXajAwWVM2WndQK1pyN01yZ0hVTnVzcVFLLzdjK1lS?=
 =?utf-8?B?eFBGM0hVWWxuVWRRTEg1MFAxWldGMElPUDNJUHcxaTgrOVhSKytNdHVnTzlI?=
 =?utf-8?B?T0ZGcSs3bVlJS3l4eGlkY2N3VW5xZitNeXhUUVhDM2RrOEsydWVrdjVZUGZJ?=
 =?utf-8?B?empPeDl4aCtNRjBZcmpCa3l1VTdlSUVzaDNJQ294Y1k2aW1FdGZoTmxxc05z?=
 =?utf-8?B?V0JwMVBhbWpsMzJVNUcvN1dOZVIvRWk0aXJJYlpNWEY3dGNweG42eE1xU1NY?=
 =?utf-8?B?SWh4aFZJaDJwSDVrUDhFaEk0Sk00aDBCRmp0R0NUUWt5Yno2TUZQeGxKWE5k?=
 =?utf-8?B?RVdONy9HallLTXJaZnNtZVFuaTI5MEE4dFJzU1dHcEVNVGhYaUhjbHIxL1Fo?=
 =?utf-8?B?ZU82SEdnZFlVNk5GRGRuRFBlTCtTY3pWSmRsejJ6dWdKb0gxTmRONHNVVXZU?=
 =?utf-8?B?cHFLUW96ZmYybkloeFpLbjU3cm9UZEY2WVlvdTlNVmFYWEVMUTVpRkJ1MG5z?=
 =?utf-8?B?QkdjNVZWYi9velVHWmI3STg2UHpMSXdVeGdxdkV2WWRXZXNldk1QNkJvN2xO?=
 =?utf-8?B?RXBkaEVuM3BEeUxXSkxpM2NtNlhZTWhhemhIVXZHZE1zeFFsdjJzcDh0Y2tn?=
 =?utf-8?B?SFBJaXY3VjhJS0kzSDYxWW5FbEgzQ1R6dGpMelpKODZMUTdNVk9WSTJyWEc5?=
 =?utf-8?B?RDgvRUlGTkVzVmJUdEJlTHBSUlpGT3dsREJXSFN6T1lyU25Tdm9uWHk1dEZZ?=
 =?utf-8?B?bEJTOVFOQzhxUGZzOTAzY1NCUy9yZmVhRW1HYWFmWUdLdHdWU290cyswZzJu?=
 =?utf-8?B?N0Z2K3FrNDQvbDFVUHZFMXNMVHVDMEVVaFE4dmtGanJGRWZuNEhCdUJnSDdz?=
 =?utf-8?B?eDdDZG1iVUZIUHFsa0pCTHF6WnhFa25WUDhiWkovNm9qQ0JiZWxnU01JZm0v?=
 =?utf-8?B?NS9NbURCZVJRWWxjbFB1Q0tDMVhETEFFUC9vQlJHMzcxYnE3dmRXSlRtM0gx?=
 =?utf-8?Q?wFQk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8599.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fdd632f-fef4-4674-e0b0-08dcf2acb5ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 15:17:57.5932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Iy4EwoW6NrhqAQnrsDQjepleC4mSp8JHXzcx1ftXWxEInA09dF3zoD61udwuCGLQ7GYIARQo4NKpfiHzu9Ju0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6924
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

W1B1YmxpY10NCg0KPiA+DQo+ID4gK3N0YXRpYyB1aW50MzJfdCBmb2xkX21lbXR5cGUodWludDMy
X3QgbWVtdHlwZSkgew0KPg0KPiBJbiBnZW5lcmFsIHBsZWFzZSBhZGQgcHJlZml4ZXMgdG8gZXZl
biBzdGF0aWMgZnVuY3Rpb25zLCBlLmcuIGFtZGdwdV92bV8gb3INCj4gYW1kZ3B1X2JvXy4NCj4N
Cj4gPiArICAgLyogU3F1YXNoIHByaXZhdGUgcGxhY2VtZW50cyBpbnRvICdjcHUnIHRvIGtlZXAg
dGhlIGxlZ2FjeSB1c2Vyc3BhY2Ugdmlldy4NCj4gKi8NCj4gPiArICAgc3dpdGNoIChtZW1fdHlw
ZSkgew0KPiA+ICsgICBjYXNlIFRUTV9QTF9WUkFNOg0KPiA+ICsgICBjYXNlIFRUTV9QTF9UVDoN
Cj4gPiArICAgICAgICAgICByZXR1cm4gbWVtdHlwZQ0KPiA+ICsgICBkZWZhdWx0Og0KPiA+ICsg
ICAgICAgICAgIHJldHVybiBUVE1fUExfU1lTVEVNOw0KPiA+ICsgICB9DQo+ID4gK30NCj4gPiAr
DQo+ID4gK3N0YXRpYyB1aW50MzJfdCBib19nZXRfbWVtdHlwZShzdHJ1Y3QgYW1kZ3B1X2JvICpi
bykgew0KPg0KPiBUaGF0IHdob2xlIGZ1bmN0aW9uIGJlbG9uZ3MgaW50byBhbWRncHVfYm8uYw0K
DQpEbyB5b3UgbWVhbiBib19nZXRfbWVtdHlwZSBvciBmb2xkX21lbXR5cGU/IEkgZGViYXRlZCB3
aGV0aGVyIGJvX2dldF9tZW10eXBlIHNob3VsZCBnbyBpbnRvIGFtZGdwdV92bS5jIG9yIGFtZGdw
dV9iby5jLCBhbmQgc2luY2UgaXQncyB1c2luZyBmb2xkX21lbXR5cGUgYW5kIG9ubHkgdXNlZnVs
IGZvciBtZW1vcnkgc3RhdHMgYmVjYXVzZSBvZiBmb2xkaW5nIHRoZSBwcml2YXRlIHBsYWNlbWVu
dHMgSSBqdXN0IGxlZnQgdGhlbSBoZXJlIHRvZ2V0aGVyIHdpdGggdGhlIG90aGVyIG1lbSBzdGF0
cyBjb2RlLg0KDQpJIGNhbiBtb3ZlIGl0IHRvIGFtZGdwdV9iby5jIG1ha2UgaXQgcmV0dXJuIHRo
ZSBtZW10eXBlIHZlcmJhdGltIGFuZCBqdXN0IGZvbGQgaXQgd2hlbiBJIGRvIHRoZSBhY2NvdW50
aW5nLg0KDQo+DQo+ID4gKyAgIHN0cnVjdCB0dG1fcmVzb3VyY2UgKnJlcyA9IGJvLT50Ym8ucmVz
b3VyY2U7DQo+ID4gKyAgIGNvbnN0IHVpbnQzMl90IGRvbWFpbl90b19wbFtdID0gew0KPiA+ICsg
ICAgICAgICAgIFtpbG9nMihBTURHUFVfR0VNX0RPTUFJTl9DUFUpXSAgICAgID0gVFRNX1BMX1NZ
U1RFTSwNCj4gPiArICAgICAgICAgICBbaWxvZzIoQU1ER1BVX0dFTV9ET01BSU5fR1RUKV0gICAg
ICA9IFRUTV9QTF9UVCwNCj4gPiArICAgICAgICAgICBbaWxvZzIoQU1ER1BVX0dFTV9ET01BSU5f
VlJBTSldICAgICA9IFRUTV9QTF9WUkFNLA0KPiA+ICsgICAgICAgICAgIFtpbG9nMihBTURHUFVf
R0VNX0RPTUFJTl9HRFMpXSAgICAgID0gQU1ER1BVX1BMX0dEUywNCj4gPiArICAgICAgICAgICBb
aWxvZzIoQU1ER1BVX0dFTV9ET01BSU5fR1dTKV0gICAgICA9IEFNREdQVV9QTF9HV1MsDQo+ID4g
KyAgICAgICAgICAgW2lsb2cyKEFNREdQVV9HRU1fRE9NQUlOX09BKV0gICAgICAgPSBBTURHUFVf
UExfT0EsDQo+ID4gKyAgICAgICAgICAgW2lsb2cyKEFNREdQVV9HRU1fRE9NQUlOX0RPT1JCRUxM
KV0gPQ0KPiBBTURHUFVfUExfRE9PUkJFTEwsDQo+ID4gKyAgIH07DQo+ID4gKyAgIHVpbnQzMl90
IGRvbWFpbjsNCj4gPiArDQo+ID4gKyAgIGlmIChyZXMpDQo+ID4gKyAgICAgICAgICAgcmV0dXJu
IGZvbGRfbWVtdHlwZShyZXMtPm1lbV90eXBlKTsNCj4gPiArDQo+ID4gKyAgIC8qDQo+ID4gKyAg
ICAqIElmIG5vIGJhY2tpbmcgc3RvcmUgdXNlIG9uZSBvZiB0aGUgcHJlZmVycmVkIGRvbWFpbiBm
b3IgYmFzaWMNCj4gPiArICAgICogc3RhdHMuIFdlIHRha2UgdGhlIE1TQiBzaW5jZSB0aGF0IHNo
b3VsZCBnaXZlIGEgcmVhc29uYWJsZQ0KPiA+ICsgICAgKiB2aWV3Lg0KPiA+ICsgICAgKi8NCj4g
PiArICAgQlVJTERfQlVHX09OKFRUTV9QTF9WUkFNIDwgVFRNX1BMX1RUIHx8IFRUTV9QTF9WUkFN
IDwNCj4gVFRNX1BMX1NZU1RFTSk7DQo+ID4gKyAgIGRvbWFpbiA9IGZscyhiby0+cHJlZmVycmVk
X2RvbWFpbnMgJiBBTURHUFVfR0VNX0RPTUFJTl9NQVNLKTsNCj4gPiArICAgaWYgKGRybV9XQVJO
X09OX09OQ0UoJmFkZXYtPmRkZXYsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgIGRvbWFp
biA9PSAwIHx8IC0tZG9tYWluID49IEFSUkFZX1NJWkUoZG9tYWluX3RvX3BsKSkpDQo+DQo+IEl0
J3MgcGVyZmVjdGx5IGxlZ2FsIHRvIGNyZWF0ZSBhIEJPIHdpdGhvdXQgYSBwbGFjZW1lbnQuIFRo
YXQgb25lIGp1c3Qgd29uJ3QgaGF2ZSBhDQo+IGJhY2tpbmcgc3RvcmUuDQo+DQoNClRoaXMgaXMg
bGlmdGVkIGZyb20gdGhlIHByZXZpb3VzIGNoYW5nZSBJJ20gcmViYXNpbmcgb250by4gSSB0aGlu
ayB3aGF0IGl04oCZcyB0cnlpbmcgdG8gZG8gaXMgaWYgdGhlIEJPIGRvZXNuJ3QgaGF2ZSBhIHBs
YWNlbWVudCwgdXNlIHRoZSAiYmlnZ2VzdCIgKFZSQU0gPiBUVCA+IFNZU1RFTSkgcHJlZmVycmVk
IHBsYWNlbWVudCBmb3IgdGhlIHB1cnBvc2Ugb2YgYWNjb3VudGluZy4gUHJldmlvdXNseSB3ZSBq
dXN0IGlnbm9yZSBCT3MgdGhhdCBkb2Vzbid0IGhhdmUgYSBwbGFjZW1lbnQuIEkgZ3Vlc3MgdGhl
cmUncyBhcmd1bWVudCBmb3IgZ29pbmcgd2l0aCBlaXRoZXIgYXBwcm9hY2hlcy4NCg0KPiA+ICsg
ICAgICAgICAgIHJldHVybiAwOw0KPiA+ICsgICByZXR1cm4gZm9sZF9tZW10eXBlKGRvbWFpbl90
b19wbFtkb21haW5dKQ0KPg0KPiBUaGF0IHdvdWxkIG5lZWQgc3BlY3VsYXIgZXhlY3V0aW9uIG1p
dGlnYXRpb24gaWYgSSdtIG5vdCBjb21wbGV0ZWx5IG1pc3Rha2VuLg0KPg0KPiBCZXR0ZXIgdXNl
IGEgc3dpdGNoL2Nhc2Ugc3RhdGVtZW50Lg0KPg0KDQpEbyB5b3UgbWVhbiBjaGFuZ2UgdGhlIGFy
cmF5IGluZGV4aW5nIHRvIGEgc3dpdGNoIHN0YXRlbWVudD8NCg0KDQpSZWdhcmRzLA0KVGVkZHkN
Cg==
