Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6873467CC84
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 14:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411CA10E8F3;
	Thu, 26 Jan 2023 13:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB9B10E8F3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 13:44:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhXqgxNaoCOyCrDzdTgHpV1LWPFtVARkaThXn+b0CWNNnDH754b+GSdymYcytRV1cCfQuQ6exfv1kpshC5KYEZIwtDIzgNxgVeT7EY7c7QxW+HWnS84b2+wJLa4DYVHF1LaPYe1/MLViBRUTxxq7KpsFLwZ+nqMzLX4dyei8skSXHGeIwVv0DqFUmtOuIobT4ZEuUlMrfAsFHkP2QjbTfr4hEgHVW3YCASMzYEKtml9jFaawIlfia2wQmG/mGFIJnhAxs65LwzVPbCqOVzT4dTOh3duRxnDQIyoEBquTbpVXpUxi5/JR/REu1gJDBjyisuXZx3e2lofDfhw0lICVPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpYYHLG1otn0Y1fcPXJJWYEW3yvrWyXFLMhM/yruiSk=;
 b=dqshdL1Ht1boTFaLyLicbVjWIOhFupy6T7iKygjjK6YNDr2A1uYpzhFewYZata/Dpeu0iVRLyVxpS128sD+p1CVwRYg5csooh+xPHMo1qQ/fsInMagDOdfDSh2tBUfRD4diDZVa5XhSJxBY8DFp9JowquM6/HePupTbJmmOgc3OMrOxqyCZpD4lixja5EK0l/Z+vxWVevfg7X+pRGweRJBhXXD3hTFaCh8vdT0IY57BhoRrWVQtrF7vTHrp42uRz1hp+9zawndlxBSpcgSBbHG51Rn7J/EBkeOfPAC4vfHTfCeObqoAc9gSJW7UURrK3HHhyqCBI/viUbQPV7xwtQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpYYHLG1otn0Y1fcPXJJWYEW3yvrWyXFLMhM/yruiSk=;
 b=uQFCcoOP+9cus4LPU3IO1xFJsssoBn/TCKbfCpI17kAwi5ioO4yo+sLUtkxdgx16yQ5rwBZOOcVmvvHABFslAFeWaLTOFBiBkMMk/A7QTIUvLkzo0gtXhBPlRt2Fy09zUR/4ct22i+I4C6I0lXrJHamNN7k5oMXPNlGhsCdWEBw=
Received: from BYAPR12MB3094.namprd12.prod.outlook.com (2603:10b6:a03:db::23)
 by BN9PR12MB5368.namprd12.prod.outlook.com (2603:10b6:408:105::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 13:44:33 +0000
Received: from BYAPR12MB3094.namprd12.prod.outlook.com
 ([fe80::e800:5772:724a:9f3f]) by BYAPR12MB3094.namprd12.prod.outlook.com
 ([fe80::e800:5772:724a:9f3f%7]) with mapi id 15.20.6002.033; Thu, 26 Jan 2023
 13:44:33 +0000
From: "Slivka, Danijel" <Danijel.Slivka@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: RE: Amdgpu module is references even after unbinding the vtcon
Thread-Topic: Amdgpu module is references even after unbinding the vtcon
Thread-Index: AQHZL/3qtbvFlTJgckOb8U/DMYMJ/K6vi9yAgADmv1CAAC6AgIAAF0sA
Date: Thu, 26 Jan 2023 13:44:33 +0000
Message-ID: <BYAPR12MB3094B0D8166231D88609CA6998CF9@BYAPR12MB3094.namprd12.prod.outlook.com>
References: <c5001553-6c71-c7ff-36aa-c4712bda0abf@gmail.com>
 <95f2314b-5d55-f2ca-468b-2f127571bd77@suse.de>
 <BYAPR12MB309405AD969A1EAA1EA84BC198CF9@BYAPR12MB3094.namprd12.prod.outlook.com>
 <6f234925-9934-53d7-ca9f-6b5bc6a67ee6@gmail.com>
In-Reply-To: <6f234925-9934-53d7-ca9f-6b5bc6a67ee6@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=2c4e7d58-6cf8-40b0-af87-6d85c15fbddd;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-01-26T13:43:37Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB3094:EE_|BN9PR12MB5368:EE_
x-ms-office365-filtering-correlation-id: 114ea255-a5c7-43d0-b9c3-08daffa3751d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SLQTKeC+Yznd3NZ5q1TH8fPxR2Y3bFzNg0pi5F9D1by1Oa20nL2MDp9FzPW2zLvrZj7CQ/FXpQD6p7SDRed9sNGimUGp1ywHZI1ZDs0Kge3h4Gs3cf8rqL+L1Wvz2sRKsZUu3os64RpEcbR30CB8sJiDZQGHIc7srWDmCxyq29LTNWgKBzh+wFfXCifsqHFOiLrKn4UnHd2bKa2sLegNOe2sC+MEfDCqdtTViTAsG0HEq7JZRbjfQCY3/RErcSo6BiidH3tq0Rn0c141ZEHx6KPH2j8dFwCNaVZJDo7Bjwf2hOeVCSMvSMaMPvH+KDEq/Gu4CdYGE/ymRNuguBCj0IPPd/37gPIg2JQd/eEMAmfy6rOkTc1AL9LG6CHfwZ8WkDHXwcV98coft3VscTk2q3uBF8+ewbCmHL/KOWgQOYR1KEd8aFo+TC87HB33PeBkUR24e1wrfdDBvj7s1rYN9YAIe59qChRAP5oYR46Hv9VulnyjiIk7AygAhK1UHfgWgHQvmRDiPWlfJxuPwKMb6Kya4rOmRHf0q5v2Fq1Wss9T6iRrUFwaq3V1R/XaG1N7yPPxDpTYRdqCRflrvB86IqTkZ1p7+bu0toW05FxfGn1UHFy9NrlLgDtADWoZAsopjLi5zYv4Bgp6NItINvgAqiPudfQg4OVbnbfj/jWiWvhxmzU/jgR5JvE/qTpodXWa9Rmjk7TpC04Ff60SO/8vGo2sdV6izKS//FK2uiGhpwU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3094.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(39860400002)(136003)(396003)(376002)(346002)(451199018)(2906002)(122000001)(38100700002)(38070700005)(26005)(186003)(53546011)(6506007)(55016003)(9686003)(86362001)(83380400001)(64756008)(66556008)(66476007)(66446008)(66946007)(5660300002)(4326008)(76116006)(8676002)(52536014)(41300700001)(966005)(8936002)(7696005)(33656002)(478600001)(110136005)(316002)(54906003)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlFJUnN3bzVOWnBiT3BVWWRUK2J0b1M3Mm1peWNJYmlJc1BwbUZPbWJCMzJK?=
 =?utf-8?B?Wjk2ODBrcnhrWkNsU2ZkL01FVXZiNUYvNnhaYlBRUFU5ZmpxVFdRMmNFQTQ5?=
 =?utf-8?B?bzFMa2dZcm41ZitVUWQ1RzBOUStyU2V4ei9NNWVuL0RrdU8wcWdzeU5yVVFK?=
 =?utf-8?B?c2UzOHdFQTRLdXR2WWlRWnN0VUVia3VWbUhzOGpadHRsZDh1YWdJZTlhdURj?=
 =?utf-8?B?S2Z4NFBVYi9RUjE2WGVlVDlqVitwaGRZKzNUK3Y3OGNiUzhjWVJuaFVCeldo?=
 =?utf-8?B?K25vT0VVck5rNXl4TFo3V0dpL2UyVjJCVk1RaUUwRUl4cndtQm1xMjVwaTUz?=
 =?utf-8?B?YkJJMkpDOHZ0amNaQXR5MkdyRHFHZkJIMmY3UWpadHFkWWRpRlJGWnFTOU1Q?=
 =?utf-8?B?VUZNUjZqVG5RM0c3R2NTWEZkTm42TldPWHdMdWtmT2FLNDMzZWgrZjFYM05n?=
 =?utf-8?B?cG5XeWpLTjVZNStoUUN5Ti8yRE1yL2VzRnNpR05iZkdyZEpzOHM1UW1odkFz?=
 =?utf-8?B?dHA4RXJhQURnTWpuSkd5dTBIZG1NK0I0cU5XQTFNZHlsTXVMRlp0blpPMEdL?=
 =?utf-8?B?YXBza2FndDhBK2JldDRqMzdIdFZPdGVmUUNGbTZWT25hZ0MycDNrWHRpTDlF?=
 =?utf-8?B?dC9MZ21pZXVlZkQ2dkZ3amR2QWE2RXI4VVpKeUtHakFVWnhlWDRadzVKMk82?=
 =?utf-8?B?UmlzQXlrUTByclErUk9nd3RDMS9WK0hUeWRiblRzNnd0NzJmTVhEbHY5Q3pv?=
 =?utf-8?B?aHNXdmNicHBVQWE3TzR2ano0Q0daUkJ1YzNiSEplRTE4RDFEWWFaTXFVMXFa?=
 =?utf-8?B?OG9xR3d0KzlEWjczM21mU2IwZ1VSTHpvZW5PeVZxOTBUN2dXL0I2VzkwLzJm?=
 =?utf-8?B?R04vUFJaWUVMZ2x4YUl4MFFvcU81ZTgxWEZQTzBiWmc1SlN5Ymx3azlIakg1?=
 =?utf-8?B?QTdoY3RsYXpvVjlWSTVjUFJoUmdyQUQ5Q2ZsOXZLQm5jajJCWU5NejRSbnQx?=
 =?utf-8?B?T2tYTkFMdm4xS21RZXNlZHByWmVsQU5EMjY1ZG1kTFhZbXV4Q2ZWQloxOGg3?=
 =?utf-8?B?YkRpeUQxbXN3clB5Tjlkc05vQ2Nyd1c3M3RWSXBDQy9RU3pCUklMSktYM1Y2?=
 =?utf-8?B?YU9pd2YxM2dSZjJNWDVJNjVKQ0lxOUFiZVp1SlgxdjJSRzFzSEF2bzNZSVVa?=
 =?utf-8?B?U1ZiS3cvM2swc1NibVBIS2lGMFhtcHRtTlVDcWdCMEdtd3NqV1h2c25YbDZC?=
 =?utf-8?B?d0xWTnVNeUQ3MWUvdVZCaWxRT0FBVDBnNGFvR1FEbkk1dU5SdWFWSlFpcXUz?=
 =?utf-8?B?bnN3ek1nYVplOThXUzNZeDZncTV1WWxDZm5nNnRhOUdmcWk4WkhPNzlNMTRX?=
 =?utf-8?B?VnhrOHFYdkRRYnVzVXhmZzhwUDJzbUhWQWNTYnJVQ0lzUXBwNU55NW1ab0g0?=
 =?utf-8?B?NEVZOW94emR2K2lYYUtDY3ZXdXlwY1hONDZEUEVORXRyM3FZTXJsU2dYbVh2?=
 =?utf-8?B?eERnK3h6TG1JYnErQzRLNXYrYmdES2RnblFUWW95SWkyQytPVjdielZZa3BM?=
 =?utf-8?B?Yi84QmQ1amREWFF0MTduaDZqNHFCRW5IMGMxdkJIUlRvSnBPRFFTTXhKeldP?=
 =?utf-8?B?SDlQOVNJbjZlTzBHVjBIT1B4NndGNnRwQ2xTKzVvc1BRMDNBNGh0M3RPM0VC?=
 =?utf-8?B?T1J4U3VoS0ZaQ0d5NHJIZmZ0a2xLZHlsRk5QcDBIdi9XT0d4TnR2SVRVd0xs?=
 =?utf-8?B?Rk43QTJpc1Y5MjllV1c4SFlkR0ttU3VXczJpYjNRNk05MU5HK2ZwUHZwRG5H?=
 =?utf-8?B?c1ZQMm5TTG85R1Bzb1hXelRGVkhxVUZrL2NVdmlLQkxTWHQ0bTZBWW9HQXFa?=
 =?utf-8?B?QnBXRnhPS0VudWZ0N0F0dTQ4K0F1cmVNeU9UYmxJMjhzTlhOWnoySm51MjBV?=
 =?utf-8?B?amxiVWpGZTlTTVhBT3pHTU9pZFpqQk0xdE9YRnRJK1RIeld6bFNOc3RVcThO?=
 =?utf-8?B?ZWUzVldUampWVWJGTTBhRUlMUVZVNGdPWmdYRjcvcTdwc2t6amhoUWpVaG44?=
 =?utf-8?B?UVUwRlJOVlR6SnBVSVdxL0ZpOHRoZUVXOVBqZVBnMmV6a1IvSGlmeDA3NU5w?=
 =?utf-8?Q?u93w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3094.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 114ea255-a5c7-43d0-b9c3-08daffa3751d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2023 13:44:33.5356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: df6QmvtqUKPPZc0HrE5SQypaDXLZuVOBHqvIe54urfaHZbQsffex8VtgwusyD9e0pAIeqic2RSnF/Vl5O3gzOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5368
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCkhpIENocmlzdGlhbiwNCg0KSSBo
YXZlIHRlc3RlZCB0aGUgcHJvcG9zZWQgcGF0Y2gsIHRoZSBpc3N1ZSBpcyBub3QgcmVwcm9kdWNp
YmxlIGFuZCBldmVyeXRoaW5nIGVsc2Ugc2VlbXMgdG8gd29yayBmaW5lLg0KDQpCUiwNCkRhbmlq
ZWwNCg0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+DQo+U2VudDogVGh1cnNkYXksIEph
bnVhcnkgMjYsIDIwMjMgMToyMCBQTQ0KPlRvOiBTbGl2a2EsIERhbmlqZWwgPERhbmlqZWwuU2xp
dmthQGFtZC5jb20+OyBUaG9tYXMgWmltbWVybWFubg0KPjx0emltbWVybWFubkBzdXNlLmRlPg0K
PkNjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBkcmkt
ZGV2ZWwgPGRyaS0NCj5kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBTaGFybWEsIFNoYXNo
YW5rIDxTaGFzaGFuay5TaGFybWFAYW1kLmNvbT4NCj5TdWJqZWN0OiBSZTogQW1kZ3B1IG1vZHVs
ZSBpcyByZWZlcmVuY2VzIGV2ZW4gYWZ0ZXIgdW5iaW5kaW5nIHRoZSB2dGNvbg0KPg0KPkFtIDI2
LjAxLjIzIHVtIDEwOjQ5IHNjaHJpZWIgU2xpdmthLCBEYW5pamVsOg0KPj4gW0FNRCBPZmZpY2lh
bCBVc2UgT25seSAtIEdlbmVyYWxdDQo+Pg0KPj4gSGkgVGhvbWFzLA0KPj4NCj4+IEkgaGF2ZSBj
aGVja2VkIHdoYXQgeW91IG1lbnRpb25lZC4NCj4+IFdoZW4gbG9hZGluZyBhbWRncHUgd2UgY2Fs
bCAgZHJtX2NsaWVudF9pbml0KCkgZHVyaW5nIGZiZGV2IHNldHVwIFsxXSwgdGhlDQo+cmVmY250
IGZvciBkcm1fa21zX2hlbHBlciBpbmNyZWFzZXMgZnJvbSAzIC0+IDQuDQo+PiBXaGVuIHdlIHVu
YmluZCB2dGNvbiwgcmVmY250IGZvciBkcm1fa21zX2hlbHBlciBkcm9wcyA0IC0+IDMsIGJ1dCB0
aGUNCj5kcm1fY2xpZW50X3JlbGVhc2UoKSBbMl0gaXMgbm90IGNhbGxlZC4NCj4+IFRoZSBkcm1f
Y2xpZW50X3JlbGVhc2UoKSBpcyBjYWxsZWQgb25seSB3aGVuIHVubG9hZGluZyB0aGUgYW1kZ3B1
IGRyaXZlci4NCj4+DQo+PiBJcyB0aGlzIGV4cGVjdGVkPw0KPg0KPlllcywgdGhlIGNsaWVudCBj
YW4ndCBiZSByZWxlYXNlZCBiZWNhdXNlIGl0IGlzIHBvc3NpYmxlIHRoYXQgdGhlIHZ0Y29uIGlz
IGJvdW5kIHRvDQo+dGhpcyBmYmRldiBhZ2Fpbi4NCj4NCj5QbGVhc2UgdGVzdCB0aGUgaGFuZGxl
IHdvcmsgYXJvdW5kIEkndmUgc2VuZCBhcm91bmQgaW50ZXJuYWxseS4gQXQgbGVhc3QgZm9yIG1l
DQo+dGhhdCBhcHByb2FjaCBzZWVtcyB0byB3b3JrLg0KPg0KPlJlZ2FyZHMsDQo+Q2hyaXN0aWFu
Lg0KPg0KPj4NCj4+IFRoZXJlIGlzIGEgY29tbWVudCBmb3IgZHJtX2NsaWVudF9yZWxlYXNlIHdp
dGggcmVnYXJkcyB0byBmYmRldiA6DQo+PiAqIFRoaXMgZnVuY3Rpb24gc2hvdWxkIG9ubHkgYmUg
Y2FsbGVkIGZyb20gdGhlIHVucmVnaXN0ZXIgY2FsbGJhY2suIEFuIGV4Y2VwdGlvbg0KPj4gICAq
IGlzIGZiZGV2IHdoaWNoIGNhbm5vdCBmcmVlIHRoZSBidWZmZXIgaWYgdXNlcnNwYWNlIGhhcyBv
cGVuIGZpbGUgZGVzY3JpcHRvcnMuDQo+Pg0KPj4gQ291bGQgdGhpcyBiZSByZWxldmFudCBmb3Ig
b3VyIHVzZSBjYXNlLCBhbHRob3VnaCBhcyBBcHBsaWNhdGlvbi9YL0dETSBhcmUNCj5zdG9wcGVk
IGF0IHRoYXQgcG9pbnQgYW5kIG5vIGZkIHNob3VsZCBiZSBvcGVuLg0KPj4NCj4+IFRoYW5rIHlv
dSwNCj4+IEJSLA0KPj4gRGFuaWplbA0KPj4NCj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPj4+IEZyb206IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4+
IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAyNSwgMjAyMyA4OjQ4IFBNDQo+Pj4gVG86IENocmlz
dGlhbiBLw7ZuaWcgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPg0KPj4+IENjOiBE
ZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBTbGl2a2EsIERh
bmlqZWwNCj4+PiA8RGFuaWplbC5TbGl2a2FAYW1kLmNvbT47IGRyaS1kZXZlbA0KPj4+IDxkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgU2hhcm1hLCBTaGFzaGFuaw0KPj4+IDxTaGFz
aGFuay5TaGFybWFAYW1kLmNvbT4NCj4+PiBTdWJqZWN0OiBSZTogQW1kZ3B1IG1vZHVsZSBpcyBy
ZWZlcmVuY2VzIGV2ZW4gYWZ0ZXIgdW5iaW5kaW5nIHRoZQ0KPj4+IHZ0Y29uDQo+Pj4NCj4+PiBI
aSBDaHJpc3RpYW4NCj4+Pg0KPj4+IEFtIDI0LjAxLjIzIHVtIDE1OjEyIHNjaHJpZWIgQ2hyaXN0
aWFuIEvDtm5pZzoNCj4+Pj4gSGkgVGhvbWFzLA0KPj4+Pg0KPj4+PiB3ZSByYW4gaW50byBhIHBy
b2JsZW0gd2l0aCB0aGUgZ2VuZXJhbCBmYmNvbi9mYmRldiBpbXBsZW1lbnRhdGlvbg0KPj4+PiBh
bmQgdGhvdWdoIHRoYXQgeW91IG1pZ2h0IGhhdmUgc29tZSBpZGVhLg0KPj4+Pg0KPj4+PiBXaGF0
IGhhcHBlbnMgaXMgdGhlIGZvbGxvd2luZzoNCj4+Pj4gMS4gV2UgbG9hZCBhbWRncHUgYW5kIGdl
dCBvdXIgbm9ybWFsIGZiY29uLg0KPj4+PiAyLiBmYmNvbiBhbGxvY2F0ZXMgYSBkdW1wIEJPIGFz
IGJhY2tpbmcgc3RvcmUgZm9yIHRoZSBjb25zb2xlLg0KPj4+PiAzLiBHRE0vWC9BcHBsaWNhdGlv
bnMgc3RhcnQsIG5ldyBmcmFtZWJ1ZmZlcnMgYXJlIGNyZWF0ZWQgQk9zDQo+Pj4+IGltcG9ydGVk
LCBleHBvcnRlZCBldGMuLi4NCj4+Pj4gNC4gU29tZWhvdyBYIG9yIEdETSBpdGVyYXRlZCBvdmVy
IGFsbCB0aGUgZnJhbWVidWZmZXIgb2JqZWN0cyB0aGUNCj4+Pj4ga2VybmVscyBrbm93cyBhYm91
dCBhbmQgZXhwb3J0IHRoZW0gYXMgRE1BLWJ1Zi4NCj4+Pj4gNS4gQXBwbGljYXRpb24vWC9HRE0g
YXJlIHN0b3BwZWQsIGhhbmRsZXMgY2xvc2VkLCBmcmFtZWJ1ZmZlcnMNCj4+Pj4gcmVsZWFzZWQg
ZXRjLi4uDQo+Pj4+IDYuIFdlIHVuYmluZCB2dGNvbi4NCj4+Pj4NCj4+Pj4gQXQgdGhpcyBwb2lu
dCB0aGUgYW1kZ3B1IG1vZHVsZSB1c3VhbGx5IGhhcyBhIHJlZmVyZW5jZSBjb3VudCBvZiAwDQo+
Pj4+IGFuZCBjYW4gYmUgdW5sb2FkZWQsIGJ1dCBzaW5jZSBHRE0vWC9XaG9ldmVyIGl0ZXJhdGVk
IG92ZXIgYWxsIHRoZQ0KPj4+PiBrbm93biBmcmFtZWJ1ZmZlcnMgYW5kIGV4cG9ydGVkIHRoZW0g
YXMgRE1BLWJ1ZiAoZm9yIHdoYXRldmVyIHJlYXNvbg0KPj4+PiBpZGspIHdlIG5vdyBzdGlsbCBo
YXZlIGFuIGV4cG9ydGVkIERNQS1idWYgYW5kIHdpdGggaXQgYSByZWZlcmVuY2UgdG8gdGhlDQo+
bW9kdWxlLg0KPj4+Pg0KPj4+PiBBbnkgaWRlYSBob3cgd2UgY291bGQgcHJldmVudCB0aGF0Pw0K
Pj4+IEhlcmUncyBhbm90aGVyIHN0YWIgaW4gdGhlIGRhcmsuDQo+Pj4NCj4+PiBUaGUgYmlnIGRp
ZmZlcmVuY2UgYmV0d2VlbiBvbGQtc3R5bGUgZmJkZXYgYW5kIHRoZSBuZXcgb25lIGlzIHRoYXQN
Cj4+PiB0aGUgb2xkIGZiZGV2IHNldHVwIChlLmcuLCByYWRlb24pIGFsbG9jYXRlcyBhIEdFTSBv
YmplY3QgYW5kIHB1dHMNCj4+PiB0b2dldGhlciB0aGUgZmJkZXYgZGF0YSBzdHJ1Y3R1cmVzIGZy
b20gdGhlIEJPIGluIGEgZmFpcmx5IGhhY2tpc2gNCj4+PiB3YXkuIFRoZSBuZXcgc3R5bGUgdXNl
cyBhbiBpbi1rZXJuZWwgY2xpZW50IHdpdGggYSBmaWxlIHRvIGFsbG9jYXRlDQo+Pj4gdGhlIEJP
IHZpYSBkdW1iIGJ1ZmZlcnM7IGFuZCBob2xkcyBhIHJlZmVyZW5jZSB0byB0aGUgRFJNIG1vZHVs
ZS4NCj4+Pg0KPj4+IE1heWJlIHRoZSByZWZlcmVuY2UgY29tZXMgZnJvbSB0aGUgaW4ta2VybmVs
IERSTSBjbGllbnQgaXRzZWxmLiBbMV0NCj4+PiBDaGVjayBpZiB0aGUgY2xpZW50IHJlc291cmNl
cyBnZXQgcmVsZWFzZWQgWzJdIHdoZW4geW91IHVuYmluZCB2dGNvbi4NCj4+Pg0KPj4+IEJlc3Qg
cmVnYXJkcw0KPj4+IFRob21hcw0KPj4+DQo+Pj4gWzFdDQo+Pj4gaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsDQo+Pj4g
aWVudC5jI0w4Nw0KPj4+IFsyXQ0KPj4+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4
L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL2RybV9jbA0KPj4+IGllbnQuYyNMMTYNCj4+
PiAwDQo+Pj4NCj4+Pj4gVGhhbmtzLA0KPj4+PiBDaHJpc3RpYW4uDQo+Pj4gLS0NCj4+PiBUaG9t
YXMgWmltbWVybWFubg0KPj4+IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINCj4+PiBTVVNFIFNv
ZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCj4+PiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkgKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KPj4+IEdlc2Now6Rm
dHNmw7xocmVyOiBJdm8gVG90ZXYNCg0K
