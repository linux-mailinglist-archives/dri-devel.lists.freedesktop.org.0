Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 063872ADA5B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 16:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA0789AA6;
	Tue, 10 Nov 2020 15:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 016B889291;
 Tue, 10 Nov 2020 15:25:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qi1f7lWQTyR+R2iLxDm3OaK3+LfvNL9Y28Yk759HrSKW883WsjPmJXLrsOaibb8yHCyoo49ftKSBdshprAUwCa8a3bqWs0NpcGPbQ3zVbeV143Sx/Xpgumta9Roi04MX0nHeUqk2QNgaOvpvCQzXI++9w5W0PvsyOV/uZutvTAAjUIZF7YAOqZzbXTWSXgrC6Mn4KcOo7QAczaGMLFf2vCfX2piuzzGzSFhNgmwoUzGnS4zU34sFwGu8TeqcF+YYYCfeDZfTF505XuXeKYKqN9HCJN4Nt2xwyokuObeyLFzUJ7EMhpBX+yY+rthYsIcDe/PGww+75qlSLFMgtXmBiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpqRRS/mF727nyVVTClh5/GcbYM1vFHpLAaZfqcMU/E=;
 b=fjgEFeZ3EYqXpdeCKxWsvL7ZrcL8wD0Qc4hcycoFTKG7zusXPu0ugT3nTw65Oyqmof/BnChwWfGfp33lYMOiSsHoMfhyfhlYnbThk+C85AHcFbZ7XH+OhaUdcETQjpwSvYrqO3fonSRQer6HydKkq0FkhWKLnmwhzpcNwvhYNghlgsHEXGo0Pyf0Lf0oCn8xrgRiuX83OAl/XgipkL9YTNd7PRC5Gsk1Vytq/95iUnKj4X/NI2ysTZHj6veP3Pwa51xi4h2bvUz9FxSE720JJE5yaXumCjd3gjvXMLZKvAclv1E4eih3CK8k2srUSY+qDFcjcqWHtpPiD/9OTKJoiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DpqRRS/mF727nyVVTClh5/GcbYM1vFHpLAaZfqcMU/E=;
 b=VBd4HGir9xn+zpBEKP6C2G7L9dhMTpxztiKk2OvFTa8wdUjNkG+asyLyKGvZqqvvjPAywffDaD6jaEpGtYWglTbDW3LzCiNng8p2ekpuDAWw+rLapJq+dR1PzWomOR5UsjAte4QorAVvmqeozhu4gXAJ6NcsUJvwkZfaUmHJ2xw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4094.namprd12.prod.outlook.com (2603:10b6:208:15f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Tue, 10 Nov
 2020 15:25:09 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 15:25:08 +0000
Subject: Re: [PATCH] drm/nouveau: Fix out-of-bounds access when deferencing
 MMU type
To: Thomas Zimmermann <tzimmermann@suse.de>, bskeggs@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, michael.j.ruhl@intel.com
References: <20201110133655.13174-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fb9dbfac-328f-4590-880c-878003e3a843@amd.com>
Date: Tue, 10 Nov 2020 16:25:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201110133655.13174-1-tzimmermann@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR02CA0011.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0011.eurprd02.prod.outlook.com (2603:10a6:208:3e::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 15:25:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3c160a20-6dfc-478c-8160-08d8858cce96
X-MS-TrafficTypeDiagnostic: MN2PR12MB4094:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB409485B46B33DFBD51894D5E83E90@MN2PR12MB4094.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TcykMlIknlRDIx/7biST4RLyhKOVPNRwfQDKlRUx9ggOPfTzvTmEB+WE1OIgIhDwBnPJ8nEUKaVPhNlPDZ89CovFt2D3RXjKwxZuWEQkjxElGUwnmQnNd1zThzxFac3NqrOkWFPm4E4+RWeOdIggHJHbmi1QKf/5clvy2c2sRVBjW/pHJojik0n/e4MH7lpfRLvK0NAlzxP+ntHHbYX20MZvgiyqHQKT5W1zTcCrB+9RPqF5EjWwPZdOc0kXlO/3vNNULHcGZ3hb3PZDacuqnNMc+zYu6ouOmfyAERkwQOIfTZxnAuhEQ7HVjz7zkWQ1VYrKO+z+WSKMvo7bs++yI9Jfo4h2mYlEC5kEqNdumWvtLIfGiywTKprWZr40Z9co
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(31696002)(2616005)(83380400001)(6486002)(6666004)(316002)(8936002)(5660300002)(66574015)(8676002)(54906003)(7416002)(4326008)(16526019)(186003)(478600001)(66556008)(2906002)(66476007)(66946007)(31686004)(52116002)(36756003)(86362001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UFo3YkVPa0x6b2xFRzZtSVRtSmxOWVpKajk3NDh6STdiVmFxRDd1N0JrczQ1?=
 =?utf-8?B?N3R6dTlqYkJsZkI0WldsVFJFTzZDK1NsdkxPa2FrUTNJaUk1OUEyam5NWkJ6?=
 =?utf-8?B?MFcvdUJpeXZWb2xrOHY3bzhnMTBrK3dBcCtuekxZZi9FT0pQYW5lWjZjOWY2?=
 =?utf-8?B?SlZHWEUvZFUyemZoVHIwa200S3gwS1ovZ24zZGtYSmlwMUQzUDBJZHg0TnFI?=
 =?utf-8?B?TVJYRFNlS3dPMWZWTVFUZEZ0T25rbzlvcjhQV2dVd0pZNnBlWW5MSUFWN2Fi?=
 =?utf-8?B?aGZZK2FLdVNRYlNRbTFVTGdpS2N3YlUrWGtPS0FPOCtma2dJNzdYNDg4OEVC?=
 =?utf-8?B?UHd0d0dsbGJvYWtmWDVHakJZNlNQNkpQcExFbjBTR1JTME9vQ1dlZ2c3OEt4?=
 =?utf-8?B?TEVJZ00ybndRcE1OYnQzQUI4UkVpMjUyZEsxRDlGNEtjcHNmaURTQzl2b0pF?=
 =?utf-8?B?WFlxSUF1ZVpNc1lWQ0loQngweHUzZThPQXBuMVN2cjA5cVVCdGRPZ3JKR1N1?=
 =?utf-8?B?M1M4SnVoaG9wWlJKcWdRbmpmNHJuV29nTEdac3d2bDRKWFUzcldmTzRhTVF0?=
 =?utf-8?B?N1BXKzhVZmovdnUvaHBSMGFlUnY5ckhxQTQ4cTcvbXZtQVl1bHk1OW5DNmdY?=
 =?utf-8?B?REFuVmZ1LzlyV3B6aHR2bS85WWxyWVdNVU1UWjVhZXNwUWpPY1dkSGt6cWk4?=
 =?utf-8?B?R1hzL1p3Rzd2NWxTU1BhSmxPSVFIWUYxN2ZpZW9zNUNpVkM4bDhYL0l5VEdj?=
 =?utf-8?B?UmM3YkRiZGx1TkR5THpVWCt5OUQ2eTYvbVpjcVJKaktBMFZxT3g3UE90eENF?=
 =?utf-8?B?d2V0cFRlVSt4ajlQN01CWVN5clFFWG11TCt5Y2dtdEc1djU0SlRpMUtTc0Ji?=
 =?utf-8?B?WjZlZ0JpVE5SVnhSbnlBNUowOTlVYVRlelZkMnhnUy9qM1VKUFI0Y3QrdERr?=
 =?utf-8?B?eWNjVDdwQWxEaldxYzl6aFRrWUpzK3dQc3RWZUJYQ2dqV3dyUmNwTHcvUXFT?=
 =?utf-8?B?cmpwMXFqTDZKWEhsWjRCZ3RJKzVyKy9BT1JiVmJJSEFDcnQyUEVJa2l4Smtt?=
 =?utf-8?B?SUlnUEVOVDgwWXpNaTNBaHQvRXZkbXRUU0I4cmdXTzFGTzJFRDdZTHozNlVV?=
 =?utf-8?B?S2x5Qi9TODRzRWtaR1Bwb29DazFoNFBsUXRwbkpkZk1GNU1xRkRtdDJWWVk5?=
 =?utf-8?B?aUUvQ2lWdjJUNjJGR3BIMnBzTG5RUmhoNDNZMVF1K0lkcVpwRk5yaXZ3V1JK?=
 =?utf-8?B?bkQzN3hTcTlBWjBmQ2FUbzhWOWNJL0VHYkMxSUxUVnZtbGhoUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c160a20-6dfc-478c-8160-08d8858cce96
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 15:25:08.8086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hwNPU5Vpcvpk+6NhNrIPQwyW4mu0GqQAo21jWVBUqar5gtJ4cJK3dAe1LxTwxozp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4094
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
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Roland Scheidegger <sroland@vmware.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, spice-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 Likun Gao <Likun.Gao@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTAuMTEuMjAgdW0gMTQ6MzYgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBUaGUgdmFs
dWUgb2Ygc3RydWN0IGRybV9kZXZpY2UudHRtLnR5cGVfdnJhbSBjYW4gYmVjb21lIC0xIGZvciB1
bmtub3duCj4gdHlwZXMgb2YgbWVtb3J5IChzZWUgbm91dmVhdV90dG1faW5pdCgpKS4gVGhpcyBs
ZWFkcyB0byBhbiBvdXQtb2YtYm91bmRzCj4gZXJyb3Igd2hlbiBhY2Nlc3Npbmcgc3RydWN0IG52
aWZfbW11LnR5cGVbXToKPgo+ICAgIFsgICAxOC4zMDQxMTZdID09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ICAgIFsgICAx
OC4zMTE2NDldIEJVRzogS0FTQU46IHNsYWItb3V0LW9mLWJvdW5kcyBpbiBub3V2ZWF1X3R0bV9p
b19tZW1fcmVzZXJ2ZSsweDE3YS8weDdlMCBbbm91dmVhdV0KPiAgICBbICAgMTguMzIwNDE1XSBS
ZWFkIG9mIHNpemUgMSBhdCBhZGRyIGZmZmY4ODgxMGZmYWMxZmUgYnkgdGFzayBzeXN0ZW1kLXVk
ZXZkLzM0Mgo+ICAgIFsgICAxOC4zMjc2ODFdCj4gICAgWyAgIDE4LjMyOTIwOF0gQ1BVOiAxIFBJ
RDogMzQyIENvbW06IHN5c3RlbWQtdWRldmQgVGFpbnRlZDogRyAgICAgICAgICAgIEUgICAgIDUu
MTAuMC1yYzItMS1kZWZhdWx0KyAjNTgxCj4gICAgWyAgIDE4LjMzODY4MV0gSGFyZHdhcmUgbmFt
ZTogRGVsbCBJbmMuIE9wdGlQbGV4IDkwMjAvME40WUM4LCBCSU9TIEEyNCAxMC8yNC8yMDE4Cj4g
ICAgWyAgIDE4LjM0NjAzMl0gQ2FsbCBUcmFjZToKPiAgICBbICAgMTguMzQ4NTM2XSAgZHVtcF9z
dGFjaysweGFlLzB4ZTUKPiAgICBbICAgMTguMzUxOTE5XSAgcHJpbnRfYWRkcmVzc19kZXNjcmlw
dGlvbi5jb25zdHByb3AuMCsweDE3LzB4ZjAKPiAgICBbICAgMTguMzU3Nzg3XSAgPyBub3V2ZWF1
X3R0bV9pb19tZW1fcmVzZXJ2ZSsweDE3YS8weDdlMCBbbm91dmVhdV0KPiAgICBbICAgMTguMzYz
ODE4XSAgX19rYXNhbl9yZXBvcnQuY29sZCsweDIwLzB4MzgKPiAgICBbICAgMTguMzY4MDk5XSAg
PyBub3V2ZWF1X3R0bV9pb19tZW1fcmVzZXJ2ZSsweDE3YS8weDdlMCBbbm91dmVhdV0KPiAgICBb
ICAgMTguMzc0MTMzXSAga2FzYW5fcmVwb3J0KzB4M2EvMHg1MAo+ICAgIFsgICAxOC4zNzc3ODld
ICBub3V2ZWF1X3R0bV9pb19tZW1fcmVzZXJ2ZSsweDE3YS8weDdlMCBbbm91dmVhdV0KPiAgICA8
Li4uPgo+ICAgIFsgICAxOC43Njc2OTBdIEFsbG9jYXRlZCBieSB0YXNrIDM0MjoKPiAgICBbICAg
MTguNzczMDg3XSAga2FzYW5fc2F2ZV9zdGFjaysweDFiLzB4NDAKPiAgICBbICAgMTguNzc4ODkw
XSAgX19rYXNhbl9rbWFsbG9jLmNvbnN0cHJvcC4wKzB4YmYvMHhkMAo+ICAgIFsgICAxOC43ODU2
NDZdICBfX2ttYWxsb2NfdHJhY2tfY2FsbGVyKzB4MWJlLzB4MzkwCj4gICAgWyAgIDE4Ljc5MjE2
NV0gIGtzdHJkdXBfY29uc3QrMHg0Ni8weDcwCj4gICAgWyAgIDE4Ljc5NzY4Nl0gIGtvYmplY3Rf
c2V0X25hbWVfdmFyZ3MrMHgyZi8weGIwCj4gICAgWyAgIDE4LjgwMzk5Ml0gIGtvYmplY3RfaW5p
dF9hbmRfYWRkKzB4OWQvMHhmMAo+ICAgIFsgICAxOC44MTAxMTddICB0dG1fbWVtX2dsb2JhbF9p
bml0KzB4MTJjLzB4MjEwIFt0dG1dCj4gICAgWyAgIDE4LjgxNjg1M10gIHR0bV9ib19nbG9iYWxf
aW5pdCsweDRhLzB4MTYwIFt0dG1dCj4gICAgWyAgIDE4LjgyMzQyMF0gIHR0bV9ib19kZXZpY2Vf
aW5pdCsweDM5LzB4MjIwIFt0dG1dCj4gICAgWyAgIDE4LjgzMDA0Nl0gIG5vdXZlYXVfdHRtX2lu
aXQrMHgyYzMvMHg4MzAgW25vdXZlYXVdCj4gICAgWyAgIDE4LjgzNjkyOV0gIG5vdXZlYXVfZHJt
X2RldmljZV9pbml0KzB4MWI0LzB4M2YwIFtub3V2ZWF1XQo+ICAgIDwuLi4+Cj4gICAgWyAgIDE5
LjEwNTMzNl0gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09Cj4KPiBGaXggdGhpcyBlcnJvciwgYnkgbm90IHVzaW5nIHR5cGVf
dnJhbSBhcyBhbiBpbmRleCBpZiBpdCdzIG5lZ2F0aXZlLgo+IEFzc3VtZSBkZWZhdWx0IHZhbHVl
cyBpbnN0ZWFkLgo+Cj4gVGhlIGVycm9yIHdhcyBzZWVuIG9uIE52aWRpYSBHNzIgaGFyZHdhcmUu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4KPiBGaXhlczogMWNmNjVjNDUxODNhICgiZHJtL3R0bTogYWRkIGNhY2hpbmcgc3RhdGUgdG8g
dHRtX2J1c19wbGFjZW1lbnQiKQo+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+Cj4gQ2M6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwu
Y29tPgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50
ZWwuY29tPgo+IENjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gQ2M6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IENjOiBEYXZpZCBBaXJsaWUg
PGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4K
PiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+IENjOiBEYXZlIEFpcmxpZSA8
YWlybGllZEByZWRoYXQuY29tPgo+IENjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNv
bT4KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IENjOiAi
Q2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogVk13YXJl
IEdyYXBoaWNzIDxsaW51eC1ncmFwaGljcy1tYWludGFpbmVyQHZtd2FyZS5jb20+Cj4gQ2M6IFJv
bGFuZCBTY2hlaWRlZ2dlciA8c3JvbGFuZEB2bXdhcmUuY29tPgo+IENjOiBIdWFuZyBSdWkgPHJh
eS5odWFuZ0BhbWQuY29tPgo+IENjOiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1k
LmNvbT4KPiBDYzogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgo+IENjOiBK
YXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4KPiBDYzogTGlrdW4gR2FvIDxMaWt1bi5HYW9A
YW1kLmNvbT4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBub3V2
ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwo+IENjOiBzcGljZS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKCkFja2VkLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9iby5jIHwgNSArKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfYm8uYwo+IGluZGV4IDgxMzMzNzdkODY1ZC4uZmUxNTI5OWQ0MTdlIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwo+IEBAIC0xMTQyLDkgKzExNDIsMTIgQEAgbm91dmVh
dV90dG1faW9fbWVtX3Jlc2VydmUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHN0cnVjdCB0
dG1fcmVzb3VyY2UgKnJlZykKPiAgIAlzdHJ1Y3QgbnZrbV9kZXZpY2UgKmRldmljZSA9IG52eHhf
ZGV2aWNlKCZkcm0tPmNsaWVudC5kZXZpY2UpOwo+ICAgCXN0cnVjdCBub3V2ZWF1X21lbSAqbWVt
ID0gbm91dmVhdV9tZW0ocmVnKTsKPiAgIAlzdHJ1Y3QgbnZpZl9tbXUgKm1tdSA9ICZkcm0tPmNs
aWVudC5tbXU7Cj4gLQljb25zdCB1OCB0eXBlID0gbW11LT50eXBlW2RybS0+dHRtLnR5cGVfdnJh
bV0udHlwZTsKPiArCXU4IHR5cGUgPSAwOwo+ICAgCWludCByZXQ7Cj4gICAKPiArCWlmIChkcm0t
PnR0bS50eXBlX3ZyYW0gPj0gMCkKPiArCQl0eXBlID0gbW11LT50eXBlW2RybS0+dHRtLnR5cGVf
dnJhbV0udHlwZTsKPiArCj4gICAJbXV0ZXhfbG9jaygmZHJtLT50dG0uaW9fcmVzZXJ2ZV9tdXRl
eCk7Cj4gICByZXRyeToKPiAgIAlzd2l0Y2ggKHJlZy0+bWVtX3R5cGUpIHsKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
