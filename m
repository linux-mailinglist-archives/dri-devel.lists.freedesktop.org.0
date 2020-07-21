Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA90228132
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 15:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8DC6E4B1;
	Tue, 21 Jul 2020 13:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750082.outbound.protection.outlook.com [40.107.75.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1180B6E2EC;
 Tue, 21 Jul 2020 13:42:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HDEYKqwa++PkmdMEpRIg8l59jC3scpuY7+Ne3//mz1G2B4KXRuW4yKVCGmJTstH5OGEPGB6JVtkc9/LpAOorybeB0jntzrC6XM9/5LnepPfVzLUrajeedp/6ibFdjNLgbovtMtYK6yhFyl2CLrQ4K5pc9ea/UoFSbawnAcPd5Snndsm+dYYOiwJ/3xZln188UIb0Z8/8BQMA8VEQF8gIiCGfRtfr+JUWHlg2CRnDTuttx59Gbjo3VT/xr/nwmdzkhxiL47U7xoANVXJI2oe1rpHEktSHHJObw9aBEUoGlYRFnCc3T/y1tOLa0wEVw3grBrbSoHPf8cjkOsIvKPzVJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pD9q9C6BRsM+L8wiEsnGvSJyo7NEVvNagKEXULXBBuw=;
 b=ZimWuY/f5qf4w5BTUF6tVa0rhWPugDd8AN/kTXlgQmbtV4lmj3Kxbsr6jsYOuBQY16qocMLZXiiL93KTUyyE8TX0d5DW506ghelBYAAPVklAdXkSLnt5dFxKaNz+DV4Bys49m8NEZLo6zm+CwUJ1CoEmR8tinmOHJM0rcUBIas6vDDBSEPzL8a3T6XjQkdI4Vdg/nUuxjMKthwRteeiPbCm5+e/TgQGpM4rTi8qC46dchVe3IpzIDSdSKhmwAicbDLEElVBzNgD+HFC+SAKJq5/ExUYvXo2lk1EV3x/tD520Vac4QUjjTa/guJDk4af5NXXhQ7pUur/CpfBtzTqbuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pD9q9C6BRsM+L8wiEsnGvSJyo7NEVvNagKEXULXBBuw=;
 b=Q7Wznvn3GmkZRN9FZxzPlwQsZheKuptDPv+SRvKbCpoP5pPoqgK3XUZxWWkTvINZwZUrMEyUjlaYoeVtBtv/mZOztfz+tnoE97A2oyM7VaDc2/gB5qSwX73e4kgBABeOOe1DHaTDGdor+ojx0n/fLAOhUg3uYWlx+t0pG45WUAI=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB3116.namprd12.prod.outlook.com (2603:10b6:5:38::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3195.17; Tue, 21 Jul 2020 13:42:33 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::f5e6:e937:2eac:18cf]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::f5e6:e937:2eac:18cf%4]) with mapi id 15.20.3195.026; Tue, 21 Jul 2020
 13:42:33 +0000
Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>
 <0de5ad33ca2ff86fee13a453aa9096c274afbd3c.camel@pengutronix.de>
 <d710aba7c3acc537bfb1c20362f7c8dbee421f02.camel@pengutronix.de>
 <740fb929-e788-075b-87db-e2524ed4b086@gmail.com>
 <CADnq5_Np=OFgqAb4TPRz5yqx1YZSwWybS=F6R_r6r01QRrzADA@mail.gmail.com>
 <61128c11-9e65-bc21-6306-ea4efea18b76@amd.com>
 <90de1234-a103-a695-4ad7-83b1486e15ee@amd.com>
 <02ba868c-e904-3681-c795-59a4e48926d5@amd.com>
 <b1ebac7c-5593-bc87-1f36-ea55503f05d1@amd.com>
 <4b5c56d2-4ce4-3626-623f-d4a8124d76fa@amd.com>
 <d4ba6ed9-604e-5e88-f427-679639dcf8e9@amd.com>
 <dbb2e7f0-85b7-f9e0-7875-144a8cca4993@amd.com>
 <2cef1ca3-115c-44ee-9caf-6cb8d6404796@amd.com>
 <e38c494a544d7e0607ee89abcc6a85419e700011.camel@pengutronix.de>
 <d4368e17-cbdf-d67b-7386-03b6eec7ba17@amd.com>
 <de43fd14-47a5-3089-0cce-4b39a0ae47f6@amd.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <2a65789b-6958-9bef-58ec-e88e7e907b8b@amd.com>
Date: Tue, 21 Jul 2020 09:42:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <de43fd14-47a5-3089-0cce-4b39a0ae47f6@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::12) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:a414:dede:29b1:5f68]
 (2607:fea8:3edf:49b0:a414:dede:29b1:5f68) by
 YT1PR01CA0043.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.21 via Frontend Transport; Tue, 21 Jul 2020 13:42:33 +0000
X-Originating-IP: [2607:fea8:3edf:49b0:a414:dede:29b1:5f68]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8e20d43c-ca14-4f64-2c96-08d82d7bebde
X-MS-TrafficTypeDiagnostic: DM6PR12MB3116:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB31160BFB8DE150BE28EE1BC7EA780@DM6PR12MB3116.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MbqbRm/OgvONB44cbj5S8rxWRMjDvAeiMlX174jj3xQsnvt/NACw+y0DRAIYFFKm29tF2KEdgwKCprv7f9n7yS6rB9sllUuXJ7mfdQ5eTmb/fRV72UoBkblSHvw+rL6nVFdJZR/1EL/1/fkkjMgzocwkaBpKM3mPu89GKU6MBElMl1oR1wVvkNG7uJ6RNtx9WBOV/9MxZdHrdDAWrZniH00E8godi6UaqiP7ml14KAdgkFifDczjvWpqcixckVSRH4CaHp4P/4NSdO7+Ag0qh39upsBtvojP8q/cUbX0tyjqT/PUiyzg6sIrZt7FhBLTrgRVfCxXzuMBNq3i3g/e+WtNPvf6MFhcRC7CqGJxzvzusVSnT9sIvwhiOmXmy1qW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(31686004)(110136005)(54906003)(16526019)(316002)(186003)(86362001)(6486002)(478600001)(4744005)(8676002)(36756003)(52116002)(66946007)(66574015)(5660300002)(31696002)(53546011)(2616005)(2906002)(66556008)(66476007)(4326008)(83380400001)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: m1T1xKKaLhlv9J/49exIgE0s2py8TylveqLpuEmLhuC1pH+Se9Z5EzFF0TMiftjdY2JGTjWJ3NBGfPB6FhAlGGkFwVLAeUhcKTfLw/aPMdbzr+FtGPCenbhmqM2Sm3ANfFAmi9GI83KTmZiycmq3VTSWp4Kxct6VZEX9nUE0f7bAADysqzIwl5bAyL7PhDM7Gwvs/GlHs7MI/e4tq8Rd3NvlwUu4opZDHLEKXwNWpPhFsATt5BT+bApsi6RF8dLejsAkDMswIQYBrWTCmQ/ggBKgtzyKNYrit2BRNviYuZINmqwny42OSFPcqBOjgpM4jnD2AGW6XEahzubCmjJjgQaY52MaHnemj4f/Ef9djRAJ6mLVKHgN6WGdsyetx0bI1enUPF0SuhX/vfDy9KVttpUElHLnRC2FCjXts6xD252MymfsZn8gZNLYFdSGWO6D2nJpnJW0M1YdEnNUD6Be1iFccHzXw/rK89/cTLsZN5KC/w8GA0YqGCtwUW1rPnLkxo9BG3K1jxTU5prRFDfAN+Xznd2ZwC1I8T3Sq3Qu9PegCCYraq+juzLB1h6KQM7k
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e20d43c-ca14-4f64-2c96-08d82d7bebde
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2020 13:42:33.5229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u3qLAUJXg4HDygGq6lRcVgrWEyFpqlexDjptUzJLgG12yZcTiTvAIjbeLA35AWxizGsB5sTmZDIF24ioSkIDsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3116
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
Cc: Emily Deng <Emily.Deng@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 steven.price@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hyaXN0aWFuLCBJIHdvdWxkIHdhbnQgdGhpcyB2ZXJ5IG11Y2ggYnV0IHVuZm9ydHVuYXRlbHkg
SSBhbSBvbiBhIHN0cmljdCAKc2NoZWR1bGUgZm9yIGFuIGludGVybmFsIHByb2plY3QgY3VycmVu
dGx5IGFuZCBoZW5jZSB3aWxsIG5vdCBiZSBhYmxlIHRvIAphY3RpdmVseSBwYXJ0aWNpcGF0ZS4g
SSB3aWxsIGRvIG15IGJlc3QgdG8gYW5zd2VyIGFueSBxdWVzdGlvbnMgTHViZW4gbWlnaHQgaGF2
ZSAKYWJvdXQgY3VycmVudCBpbXBsZW1lbnRhdGlvbi4KCkFuZHJleQoKT24gNy8yMS8yMCA5OjM5
IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IEx1YmVuIGhhZCBhIGdvb2QgaWRlYSBob3cg
dG8gdGFja2xlIHRoZSB3aG9sZSBqb2IgaGFuZGxpbmcuCj4KPiBBbmRyZXkvTHVjYXMgY2FuIHlv
dSB3b3JrIHdpdGggTHViZW4gdG8gZ2V0IHRoaXMgY2xlYW5lZCB1cCBiZWNhdXNlIHRoZXJlIGFy
ZSAKPiBhIGxvdCBvZiByZXF1aXJlbWVudHMgb24gdGhpcyB3aGljaCBub3Qgb25seSBjb21lIGZy
b20gQU1ELgo+Cj4gVGhhbmtzLAo+IENocmlzdGlhbi4KPgo+IEFtIDIxLjA3LjIwIHVtIDE1OjM2
IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+IEx1Y2FzLCBMdWJlbiBwaWNrZWQgdGhlIHdv
cmsgb24gdGhpcyBhIGZldyBtb250aCBhZ28gYXMgSSB3YXMgZGl2ZXJ0ZWQgdG8gYSAKPj4gZGlm
ZmVyZW50IHByb2plY3QuCj4+Cj4+IEx1YmVuLCBjYW4geW91IHVwZGF0ZSBMdWNhcyBwbGVhc2Ug
Pwo+Pgo+PiBBbmRyZXkKPj4KPj4gT24gNy8yMS8yMCA3OjAzIEFNLCBMdWNhcyBTdGFjaCB3cm90
ZToKPj4+IEl0IHNlZW1zIHdlIGFsbCBkcm9wcGVkIHRoZSBiYWxsIG9uIHRoaXMgb25lLiBJIGJl
bGlldmUgdGhpcyBpcyBzdGlsbAo+Pj4gYW4gb3BlbiBpc3N1ZS4gSGFzIHRoZXJlIGJlZW4gYW55
IHByb2dyZXNzIGZyb20geW91ciBzaWRlIG9uIGZpeGluZwo+Pj4gdGhpcz8KPj4+Cj4+PiBSZWdh
cmRzLAo+Pj4gTHVjYXMKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
