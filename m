Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AD067C7BF
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 10:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639A410E29E;
	Thu, 26 Jan 2023 09:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2081.outbound.protection.outlook.com [40.107.100.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569EE10E1D1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 09:49:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGGW29d3F9yi0jS1bhyDO0PC0VVfO8gE6bzDRhWYveFQQSzuq7sp8mYEwL8gXe+P9aMVCYaKtEV+XzzS92ouzkPb0JxrMYNu9UtC/+pi7RZDGYe4FCRnTgHtSGKKF8lSD+nq+LRhgUebeClygoFJ0KA83cApVy87llt4pej5q6MusSavRlSvBtGbgsLO890+P+i+G4AC06/e351x7uM6Haf2CI4IFVVa+kzzNLmzNdzRIkoGM9zKT/frUOryAH7uBjYhTkT2k8PvcABs10TLoKszQes1Dune43Rm+qPj/0kC5JiTL1ghUvMb4J4URSHIQB00+thldOZNuTmLPgsZCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OBhS6IrGoKFL8EIMXvmRqhd/luPwgEchpUXk6QPh8wg=;
 b=oDfcs55OHnDO4DoU+v43nzbM/ly/rqvNzbdg7n3G+vzfFT2qZuPi5I0Q8K2QUay2mbl30HpTZhn8E5mE1I/zAdMRmR/lc8oLG7D8My4Zfxtbqn9Tvcjij3bvwH+JNMgfs3vh4Lp4QpJstUaXYOtuZOQEjNw+S2XPRkAhuDT0LFA2UpWxr+sFYnJO4Nleud1mJckyMZs5OZQRixqs5VnYLxEUVgjCjJBto5OZeCdwyAGyosiQ/EnK3JqVnLqnufoX4kORB/ss1SlG0pC7Se2jm8NdORalwICRo40FN8h92UDd5gUD37bKuiptyJeh8XODPSt1vQtJbSBLOBy4MfrZbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBhS6IrGoKFL8EIMXvmRqhd/luPwgEchpUXk6QPh8wg=;
 b=jr2by9+0UHVlNRbEHBgZHGoG7Wb+6CSlXfG5PsFKhYJ5UoCz1UiIjg9IGFmKrRY9WMFSSDlPDye37k5uBe7g76dguDWFvPO/aOOeYuhh4poxaHoY0RzEXLqYY65W0UFpgzIIodX+MyrYX3jc0LhuS3ClzqcJ0s88AdSpzMlL6HU=
Received: from BYAPR12MB3094.namprd12.prod.outlook.com (2603:10b6:a03:db::23)
 by BY5PR12MB4100.namprd12.prod.outlook.com (2603:10b6:a03:200::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 09:49:15 +0000
Received: from BYAPR12MB3094.namprd12.prod.outlook.com
 ([fe80::e800:5772:724a:9f3f]) by BYAPR12MB3094.namprd12.prod.outlook.com
 ([fe80::e800:5772:724a:9f3f%7]) with mapi id 15.20.6002.033; Thu, 26 Jan 2023
 09:49:14 +0000
From: "Slivka, Danijel" <Danijel.Slivka@amd.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>
Subject: RE: Amdgpu module is references even after unbinding the vtcon
Thread-Topic: Amdgpu module is references even after unbinding the vtcon
Thread-Index: AQHZL/3qtbvFlTJgckOb8U/DMYMJ/K6vi9yAgADmv1A=
Date: Thu, 26 Jan 2023 09:49:14 +0000
Message-ID: <BYAPR12MB309405AD969A1EAA1EA84BC198CF9@BYAPR12MB3094.namprd12.prod.outlook.com>
References: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>
 <95f2314b-5d55-f2ca-468b-2f127571bd77@suse.de>
In-Reply-To: <95f2314b-5d55-f2ca-468b-2f127571bd77@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=74b51cd4-1ad5-46aa-8c0c-f0f85aeb350f;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-01-26T09:33:49Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3094:EE_|BY5PR12MB4100:EE_
x-ms-office365-filtering-correlation-id: c45e701b-b498-41cf-f016-08daff829589
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZoVg82uMofpx5hGWLvYih9WYrSU8aqeLhfepLSRewwVsLUY9F8LtLemUriIOBTIMDVPgBAcMER1mQ3PUsJrE42OtYwv8jqVTo0EpDIiVQUYy92HTP3Nw6o2syQSvKXbD40GS+3HAbJPx4zSgdv12q44c+Nxnkos0jlweSmlRp1GZFi8f8xCd+WhrKKS61mRYc0PnrHEoTw/Mo9diE38FeTNtWQvP+MnxYzOYg8SW5pKLyO5pEXobMCi27aUnVknnb7lqRtbDrihsJ9R8BwFc7crlfEhTqbuME/HMIPEIlYrO2oB6rs4X97CwzyqmhZPu34A/iY7juKSBy2QIB61TQoTsK8wjFGcr+3/dN7ggWywDkZCK7G0CYmzfYC1MtbOjb3Yf/pvuqLhT7LZQYNKsGG/zZUE82/w3nxA1STY1mqR3+yeLFjvy4Gym9QklBcK0mXVnmSX+Dc6xzGl87f9j06Q00YRiigf6CaMAJ1L6M73iIirwE3JNi3REndsFY09dxRCVKK+7NLEHXjli2h4hPbdamh7xBFbyTTMm3HNPqrytKhVJbNI1RC8yMLPKGASQEmujwdwfey9X4z2QRtwM+ZP2lE8MtygjPJkUtxcu325d3vr+5sNgg+on2RDNtC77g3bU6LUr83YciBERPZ1Ko/xPNAu05U0RLG6CwAQbb4cGr87UBR1dyBJioj3jVC/YRQFUaOzyd9d7KtE7Ylz+6DQcrlidz1pR4QbgPEE+jzjSYU06ENQnFFdT1b/lQvNVWbpKbm3uPnqpJWCrmE3cBw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3094.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199018)(478600001)(7696005)(186003)(9686003)(26005)(71200400001)(83380400001)(110136005)(316002)(54906003)(41300700001)(8676002)(38100700002)(122000001)(6506007)(33656002)(86362001)(5660300002)(38070700005)(52536014)(8936002)(4326008)(66946007)(66476007)(66556008)(64756008)(66446008)(76116006)(2906002)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlI2czdMakNYdmI3dml4WkVaVmo4Uk5XRDV2OGhXZDdWTGlwQXowL2NINytG?=
 =?utf-8?B?RFBQUG53TjFvWll0bG4zRzkvWHR6LzRaMFQxOUpZTmw5MXdHMThNeElwc2Fi?=
 =?utf-8?B?NGYzWXRvYS95VFViRmNGZHcxMFp5V1QxMGNOSHVmcEZkeWJaa0w1UWxaYmZP?=
 =?utf-8?B?OVlHajk3VWEyb29UZ0VabTJuRStwNXExaFJ2eTd1MDRJQ1lkeEN4YXBqQk0y?=
 =?utf-8?B?OXBadEEwRFlDTkU3TmVSQkpsZjNRaEZaY2ZoQ1FQZy9vM3JVYk9OTFRPeUo5?=
 =?utf-8?B?YmdZSVVGNmF2L1MvVGR3T1RyQnNDYVY5a3RiRFVRb2grSTNqN2hUOEsyRUxu?=
 =?utf-8?B?Y25YMGQraURJRHJuWm1jaG5FWkUzcENFUDNpeDNZeTRTUmF0Y0paTVFtbW1v?=
 =?utf-8?B?V1owNjJ6SmpTc0g1NVZ4ZENpOGJQZTZrdjRVWmVNYUowUjI4SHJqNGxocG11?=
 =?utf-8?B?eEVaaTZmRFZwaFNjSE9VclFCK1A0V0M4WGt1WXQ3ZkJzVVpNWW1sUHlXSXFs?=
 =?utf-8?B?SUFud0V5NUdpWHFtS2hDUUFXWGJzMU14OUZveHZXVkh2Z0luMDJlaFc3SHlx?=
 =?utf-8?B?STcxNXhLbFY5dlp5UmNNbW9FM0RsZEo5KzgxZ3NRei9vQXNncldxVDNQL3Ra?=
 =?utf-8?B?Ump4emFOd3c4ZC94c2FRckszMHJwMWt5UHlpdFVFODVvbkJZM2JnSDJDR1VP?=
 =?utf-8?B?MGMxSUs5Q0pza1MwSkFWZlhUSm44R1VmbDlCc1EwbjIyalMxVDB2TCttREIy?=
 =?utf-8?B?M2E3Y0k5NlZTcmdRRFJ2aklyVGQwL1loV2Z0QkxYWk01K3paZkkydjFiRGtw?=
 =?utf-8?B?Vno2dTBqUUJLTnlXSGZ2YlIyem54NFRLZERDSjhCZnpqd1FGR0l0SXFja1lK?=
 =?utf-8?B?dlRmK2JkODZUYnYxQ2RqTXoydml1NDJBQ0M0YVl0aVFiMkZIQXBjSzg2UG1M?=
 =?utf-8?B?a1A2UUVBWHhtL1BqaXE3SjNqTm8rZ1ZzdW5MOUJSdnVNM3lzR2VTUnVIUHNZ?=
 =?utf-8?B?S3ZSV3Ftd3JlcUkwbDBQdEZ6bjJEellNblZNaFV3TGlSbnVJb216WTFuYlNL?=
 =?utf-8?B?bDBBU3NzM0lwSUJUc0lzUWlidlQyREE3VTJ6Z3JRZUJXWHU5MFJNWkMwczhl?=
 =?utf-8?B?WFduby91SUZEQnJNZmVZSzVpc2ZqN0NuUUliQzZTSzdzQVJVanpaMjAzTUli?=
 =?utf-8?B?NnBiQnRwRzAxbWFCR3p3SWN4VjBsWER0WVdEb1lDZmtiZmxFL3NsLzBLbU9W?=
 =?utf-8?B?S0pKWEJiT3ovdU5mMGowUTN0TDR1cWc4LzgwN3pDRi9CYThFRFd1NDk1ZnVF?=
 =?utf-8?B?Vm1OYVh0NVlBMUhJL3U2eUpwUEpQcHFZbGFvUmJMclRHV3pqWjQ1VHJXZlUx?=
 =?utf-8?B?Y004bUdqT3F4bjJFdnp6OHZBQXQ2SFR5MGhLOGJLcm5tWEVKZWZRRncrZ2dK?=
 =?utf-8?B?SjdDT0Y0d0RXdmRKY21Da05TZmRRRStLMHFqRnRhMGNxaVkzWVdmU1dhMngv?=
 =?utf-8?B?OU92NEwxajlzRlRMeXZZMG01RmRFWG9BZFNWTkhsbnJJWXdQSFZCR01idDlp?=
 =?utf-8?B?UE4xUG93eW1MbnlCdVR2T3QrYVdMblZRUHROWVJOSTNVVjNpaFNCWkNNczM1?=
 =?utf-8?B?V283UFRPTENiUmdSdHJBTlZKNGFPQTB1VkdFbDViU0ZzcDNFKzZJTmkwQ3pE?=
 =?utf-8?B?K1lGZGVJSDI3T3V6MjYvVzdyb3FhRVMrY2FSazlWbTJ4MlRtOFJkeGxkaDlW?=
 =?utf-8?B?a3hIV3dQK3hZRmZtK3BQNnEyYW5sT0JRWE0yZi9ycm1UNHZDU3lseTYwWVl4?=
 =?utf-8?B?cC9IdTN4SWFZYkQ1aHJTTEFMMFUrbkkvejVnRzJQTHErd3ZWcEp5Zzk3Rkcz?=
 =?utf-8?B?RHFLQ2ZZeEtWdnVHbjZLdWpRd0U3NG5xa095R0NwbGh6QXp6U0VkZk9HSmFn?=
 =?utf-8?B?OGt6ZlltMGNXbVZaYVRGUFo3R3pDM0dSZEJHWnhuZENBSDZKdnRCcmVWMlFv?=
 =?utf-8?B?SDVudEJWOEVVQkV2dHlnNXgyWFB3Q2U3bnYweFdxdm5IRGVNUWd1akpQQmxj?=
 =?utf-8?B?Y0VsaEpwN3FLMm80RDVSRFVnMWpLQkdPbXp3blVGVkhidFZ3YXdlOEFTTFpE?=
 =?utf-8?Q?DoPI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3094.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c45e701b-b498-41cf-f016-08daff829589
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2023 09:49:14.5710 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D+3/Retsf5+q/KuYmyZknxmGFFdKuJurKO+WRncWyvLyMkrm3aPcjMS34ncQMrOtKV6SGj6P3zDqRd4EH4cioQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4100
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCkhpIFRob21hcywNCg0KSSBoYXZl
IGNoZWNrZWQgd2hhdCB5b3UgbWVudGlvbmVkLg0KV2hlbiBsb2FkaW5nIGFtZGdwdSB3ZSBjYWxs
ICBkcm1fY2xpZW50X2luaXQoKSBkdXJpbmcgZmJkZXYgc2V0dXAgWzFdLCB0aGUgcmVmY250IGZv
ciBkcm1fa21zX2hlbHBlciBpbmNyZWFzZXMgZnJvbSAzIC0+IDQuDQpXaGVuIHdlIHVuYmluZCB2
dGNvbiwgcmVmY250IGZvciBkcm1fa21zX2hlbHBlciBkcm9wcyA0IC0+IDMsIGJ1dCB0aGUgZHJt
X2NsaWVudF9yZWxlYXNlKCkgWzJdIGlzIG5vdCBjYWxsZWQuDQpUaGUgZHJtX2NsaWVudF9yZWxl
YXNlKCkgaXMgY2FsbGVkIG9ubHkgd2hlbiB1bmxvYWRpbmcgdGhlIGFtZGdwdSBkcml2ZXIuDQoN
CklzIHRoaXMgZXhwZWN0ZWQ/DQoNClRoZXJlIGlzIGEgY29tbWVudCBmb3IgZHJtX2NsaWVudF9y
ZWxlYXNlIHdpdGggcmVnYXJkcyB0byBmYmRldiA6DQoqIFRoaXMgZnVuY3Rpb24gc2hvdWxkIG9u
bHkgYmUgY2FsbGVkIGZyb20gdGhlIHVucmVnaXN0ZXIgY2FsbGJhY2suIEFuIGV4Y2VwdGlvbg0K
ICogaXMgZmJkZXYgd2hpY2ggY2Fubm90IGZyZWUgdGhlIGJ1ZmZlciBpZiB1c2Vyc3BhY2UgaGFz
IG9wZW4gZmlsZSBkZXNjcmlwdG9ycy4NCg0KQ291bGQgdGhpcyBiZSByZWxldmFudCBmb3Igb3Vy
IHVzZSBjYXNlLCBhbHRob3VnaCBhcyBBcHBsaWNhdGlvbi9YL0dETSBhcmUgc3RvcHBlZCBhdCB0
aGF0IHBvaW50IGFuZCBubyBmZCBzaG91bGQgYmUgb3Blbi4NCg0KVGhhbmsgeW91LA0KQlIsDQpE
YW5pamVsDQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPlNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAy
NSwgMjAyMyA4OjQ4IFBNDQo+VG86IENocmlzdGlhbiBLw7ZuaWcgPGNrb2VuaWcubGVpY2h0enVt
ZXJrZW5AZ21haWwuY29tPg0KPkNjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVj
aGVyQGFtZC5jb20+OyBTbGl2a2EsIERhbmlqZWwNCj48RGFuaWplbC5TbGl2a2FAYW1kLmNvbT47
IGRyaS1kZXZlbCA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IFNoYXJtYSwNCj5T
aGFzaGFuayA8U2hhc2hhbmsuU2hhcm1hQGFtZC5jb20+DQo+U3ViamVjdDogUmU6IEFtZGdwdSBt
b2R1bGUgaXMgcmVmZXJlbmNlcyBldmVuIGFmdGVyIHVuYmluZGluZyB0aGUgdnRjb24NCj4NCj5I
aSBDaHJpc3RpYW4NCj4NCj5BbSAyNC4wMS4yMyB1bSAxNToxMiBzY2hyaWViIENocmlzdGlhbiBL
w7ZuaWc6DQo+PiBIaSBUaG9tYXMsDQo+Pg0KPj4gd2UgcmFuIGludG8gYSBwcm9ibGVtIHdpdGgg
dGhlIGdlbmVyYWwgZmJjb24vZmJkZXYgaW1wbGVtZW50YXRpb24gYW5kDQo+PiB0aG91Z2ggdGhh
dCB5b3UgbWlnaHQgaGF2ZSBzb21lIGlkZWEuDQo+Pg0KPj4gV2hhdCBoYXBwZW5zIGlzIHRoZSBm
b2xsb3dpbmc6DQo+PiAxLiBXZSBsb2FkIGFtZGdwdSBhbmQgZ2V0IG91ciBub3JtYWwgZmJjb24u
DQo+PiAyLiBmYmNvbiBhbGxvY2F0ZXMgYSBkdW1wIEJPIGFzIGJhY2tpbmcgc3RvcmUgZm9yIHRo
ZSBjb25zb2xlLg0KPj4gMy4gR0RNL1gvQXBwbGljYXRpb25zIHN0YXJ0LCBuZXcgZnJhbWVidWZm
ZXJzIGFyZSBjcmVhdGVkIEJPcw0KPj4gaW1wb3J0ZWQsIGV4cG9ydGVkIGV0Yy4uLg0KPj4gNC4g
U29tZWhvdyBYIG9yIEdETSBpdGVyYXRlZCBvdmVyIGFsbCB0aGUgZnJhbWVidWZmZXIgb2JqZWN0
cyB0aGUNCj4+IGtlcm5lbHMga25vd3MgYWJvdXQgYW5kIGV4cG9ydCB0aGVtIGFzIERNQS1idWYu
DQo+PiA1LiBBcHBsaWNhdGlvbi9YL0dETSBhcmUgc3RvcHBlZCwgaGFuZGxlcyBjbG9zZWQsIGZy
YW1lYnVmZmVycw0KPj4gcmVsZWFzZWQgZXRjLi4uDQo+PiA2LiBXZSB1bmJpbmQgdnRjb24uDQo+
Pg0KPj4gQXQgdGhpcyBwb2ludCB0aGUgYW1kZ3B1IG1vZHVsZSB1c3VhbGx5IGhhcyBhIHJlZmVy
ZW5jZSBjb3VudCBvZiAwIGFuZA0KPj4gY2FuIGJlIHVubG9hZGVkLCBidXQgc2luY2UgR0RNL1gv
V2hvZXZlciBpdGVyYXRlZCBvdmVyIGFsbCB0aGUga25vd24NCj4+IGZyYW1lYnVmZmVycyBhbmQg
ZXhwb3J0ZWQgdGhlbSBhcyBETUEtYnVmIChmb3Igd2hhdGV2ZXIgcmVhc29uIGlkaykgd2UNCj4+
IG5vdyBzdGlsbCBoYXZlIGFuIGV4cG9ydGVkIERNQS1idWYgYW5kIHdpdGggaXQgYSByZWZlcmVu
Y2UgdG8gdGhlIG1vZHVsZS4NCj4+DQo+PiBBbnkgaWRlYSBob3cgd2UgY291bGQgcHJldmVudCB0
aGF0Pw0KPg0KPkhlcmUncyBhbm90aGVyIHN0YWIgaW4gdGhlIGRhcmsuDQo+DQo+VGhlIGJpZyBk
aWZmZXJlbmNlIGJldHdlZW4gb2xkLXN0eWxlIGZiZGV2IGFuZCB0aGUgbmV3IG9uZSBpcyB0aGF0
IHRoZSBvbGQgZmJkZXYNCj5zZXR1cCAoZS5nLiwgcmFkZW9uKSBhbGxvY2F0ZXMgYSBHRU0gb2Jq
ZWN0IGFuZCBwdXRzIHRvZ2V0aGVyIHRoZSBmYmRldiBkYXRhDQo+c3RydWN0dXJlcyBmcm9tIHRo
ZSBCTyBpbiBhIGZhaXJseSBoYWNraXNoIHdheS4gVGhlIG5ldyBzdHlsZSB1c2VzIGFuIGluLWtl
cm5lbA0KPmNsaWVudCB3aXRoIGEgZmlsZSB0byBhbGxvY2F0ZSB0aGUgQk8gdmlhIGR1bWIgYnVm
ZmVyczsgYW5kIGhvbGRzIGEgcmVmZXJlbmNlIHRvIHRoZQ0KPkRSTSBtb2R1bGUuDQo+DQo+TWF5
YmUgdGhlIHJlZmVyZW5jZSBjb21lcyBmcm9tIHRoZSBpbi1rZXJuZWwgRFJNIGNsaWVudCBpdHNl
bGYuIFsxXSBDaGVjayBpZiB0aGUNCj5jbGllbnQgcmVzb3VyY2VzIGdldCByZWxlYXNlZCBbMl0g
d2hlbiB5b3UgdW5iaW5kIHZ0Y29uLg0KPg0KPkJlc3QgcmVnYXJkcw0KPlRob21hcw0KPg0KPlsx
XQ0KPmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVy
cy9ncHUvZHJtL2RybV9jbGllbnQuYyNMODcNCj5bMl0NCj5odHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMjTDE2
DQo+MA0KPg0KPj4NCj4+IFRoYW5rcywNCj4+IENocmlzdGlhbi4NCj4NCj4tLQ0KPlRob21hcyBa
aW1tZXJtYW5uDQo+R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KPlNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSA0KPk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2Vy
bWFueQ0KPihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCj5HZXNjaMOkZnRzZsO8aHJlcjogSXZv
IFRvdGV2DQo=
