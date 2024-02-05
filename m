Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5FD84A926
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 23:22:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CB711264C;
	Mon,  5 Feb 2024 22:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Pw7X5hVM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outbound.mail.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58288112644
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 22:22:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dc0Z/U/m2TaqC5jqoJTLAzYSFlEmfeJ0/P7/StCvwaPuBrLfoxPSON1B6eDf9BhXX09cZyZ50edqSErFPkB5RbE2TN8bwDEvzSrW8JG0yOs/fgigbQg6veR81ETI771Ya26HK+286UJ0W79+G6HCa+eKL6BhTIqHGnjvvIPoj9lqb/PFwhfEm8wvmf8/dXPsG3gQ0gMcYmQL40ELa8b16J/fO4N4L4ln2HDXlw1uv1AXfNUiPpWn0pK7IQ/fY9CtPRukZbAzrHmbHVBaZ2PNFyOqTW5mcQ+VV+arYq5VyJudbWfG7KmbbNdtlxGHVmWOzecTqPKc73bTy+DM8PplFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgJCiJ4Xtb2ZUWyt4PWTrq7k36/PapkK+g9aUV47dJE=;
 b=HFnjl/E0uK0ogFMSpiyboyEQDZJBOBXx9gvzsEwPw3uHrD4wtjZYUnBMK9OAP8VvACrugr9x1IG+R8ARjUfOpOf/KWGAWuCEt8QF7+/WvTXp1fMhAEj5/X+k7LkhdBHyx/h9dkf4VM6K+902DNEOaIYBSkHWwoyyA+8JGJ+hbGyDhdOKAwKnmDGyJ6H+wXA3Xb7ezanw0AHI3JL+JxSIK+S9sokkSNWR40J49udGAZScuU3+sOC3bu8xERnFs7bRPVgFB2fdBtNsSIFnWjbtqw+nVJOioQlCMW2TOfy9XfZ/+falPUAhsNBUjkqBSbYxb/L2IGJSwreLyP558dGniA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgJCiJ4Xtb2ZUWyt4PWTrq7k36/PapkK+g9aUV47dJE=;
 b=Pw7X5hVMF6NV2EBfCidjgpTxT0Dm2+JEkwTLUiGChq9Cai1aNgjs6899YNrMXo+rPeuc9A6KTng6d2YoPOuc/Yx6wx30bEmUVP7ws89T21L92GXiP6kYyPnjY3N6Nw2qWhTcSeTTEsGbYzWAulOh9TUiO0niDSUxxr6BZXsIWb0=
Received: from MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 by PH8PR12MB6889.namprd12.prod.outlook.com (2603:10b6:510:1c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.17; Mon, 5 Feb
 2024 22:22:38 +0000
Received: from MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::374b:e99d:5ba7:1ec0]) by MW4PR12MB7165.namprd12.prod.outlook.com
 ([fe80::374b:e99d:5ba7:1ec0%4]) with mapi id 15.20.7270.012; Mon, 5 Feb 2024
 22:22:38 +0000
From: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Simek, Michal" <michal.simek@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 2/5] drm: xlnx: zynqmp_dpsub: Fix timing for live mode
Thread-Topic: [PATCH v3 2/5] drm: xlnx: zynqmp_dpsub: Fix timing for live mode
Thread-Index: AQHaTnCrNmI9cPJ92EeVI/Uw5Y5EFLD7eBkAgADrvRA=
Date: Mon, 5 Feb 2024 22:22:38 +0000
Message-ID: <MW4PR12MB7165B4A0AD707686C04162DCE6472@MW4PR12MB7165.namprd12.prod.outlook.com>
References: <20240124025402.373620-1-anatoliy.klymenko@amd.com>
 <20240124025402.373620-3-anatoliy.klymenko@amd.com>
 <20240205080824.GH6804@pendragon.ideasonboard.com>
In-Reply-To: <20240205080824.GH6804@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB7165:EE_|PH8PR12MB6889:EE_
x-ms-office365-filtering-correlation-id: 968f1956-45a0-4197-0c7f-08dc2698f604
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TAbX9QimQZ2zAaTJHcxuL4Jm0qlhVr/EHKdHmmv2Rm1fdmJ2YKynje0XPePvQ71TlH68AzYNdmu10PEQ+wKFl9H82Yqe/LCbcr3RT3Gg5dOygeT+iKExdRHyaMmGFknTNzoJKkTvfxbbmdTuOsrIO++z5B2uGjUKbwFIREgz308eOj8odp0LHkO57QzW0mgehpEeEgGv/a1WfScpfw+j4ovfeRjQEsXip0jawnh6a0yRIITkNMGfIE4gPRA/79Lv2tPDTmuEa+1vFJdTKNCoRQVXw+Clpb1LGuQ9dpX99EPgeF6LFBtermY0PmoLzGb0gpMpEFKvxtuRadje+U0GWm4XjDZRNAHft62L7gAKzs/QJC1v4lzns4yndoiJVS6q5xT9t9PN8YcvAcbWpSScGBDQ8o+yK+K2DArfQQi7IRefewMLjPaXtiUszAPR/SB+iZdFY5I2WQrRkbukbNITq1NCoJUVvzkOAeBJV8TPM0rl460nlarZYJMSO8gxkCqovynWCmtZ9KBDF7m1wOvvpBUHjlxhLKN6hxJUALTDaWbeNs/u7MFpu+nfCjTBTGEVgyrG9Qo/3P3cNy9rizn/aFt2+qRghYKsX3fDfzz8TFwEY4f+f9StS44jkwJHndr0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB7165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(376002)(136003)(346002)(230922051799003)(230273577357003)(64100799003)(451199024)(1800799012)(186009)(76116006)(86362001)(122000001)(41300700001)(38100700002)(2906002)(5660300002)(26005)(66556008)(66476007)(54906003)(66446008)(64756008)(66946007)(6506007)(71200400001)(9686003)(53546011)(7696005)(478600001)(52536014)(38070700009)(33656002)(6916009)(4326008)(8936002)(8676002)(316002)(83380400001)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bXVKa0Rybm9xa1YxTnoxQ3EzUXlocHBuZUlLRnYwZUJ4aExEZWRJaFFtemY0?=
 =?utf-8?B?amE3Nnk1cXBCZUllNExpb1hVd2c5TE1ncFBhaHppSVN4TlU3NlgrUkFwOEoy?=
 =?utf-8?B?eDgrVlBjTlBQZ2ZVVkdwQVc0aUhkbi9tK0FJSVpINmo4bXZGNkU1QmtObnZY?=
 =?utf-8?B?WmJVRWxUQ3kwRndhTlBZcUNRT0ozbmxFMFVkY3ZtRlAwRVphNzhYQVNib2R6?=
 =?utf-8?B?M0daYmU0SWF2NGExK2JnOEoyUGpZQWN2TnJ5Qm4xMVJ4NlVhdEhQbUpIZmcv?=
 =?utf-8?B?RjNyTExaZXZwK3R3aVBJSDlYQVIvU1drVHhhZlVDYlVtTGxNRW1yUDN4Q2Ru?=
 =?utf-8?B?c1BIVDhNNTM4Rmducld2ejhsMm94d3JHUjdVVzUxZGRhUFp0SkU2N1pHdnpl?=
 =?utf-8?B?MC9YbmpMZUZraTBMdFZDZVQrTEFLZzBCS1hZb085UmZpVzhNTjhQRkFSdDFG?=
 =?utf-8?B?bUZWT2VkNm16OE5wQVlGZ0ZZVzZMZ0hSOTkwVXlFb1I1TSswcXpxeTJOVUl0?=
 =?utf-8?B?NDlJNWhVSUdsSGF1cjJyMnoxVm9pL2loTFg0YnhIdS8rbXNXZWpPZVpKVytN?=
 =?utf-8?B?MEIwMW1XWFNMOGJMSDQwQ0Zmc3MvanY0RllaWUcrWU04WFlhdXoyaUJWb2R2?=
 =?utf-8?B?K3JzWExJUXZieEkwNHBWaTJKYnN5emhVR1QzVEwrS0FhVk5RZ2xMcVpnZzNO?=
 =?utf-8?B?L2w3dmdhaG1DZFlOdmdZSFVvSWRVRmpCeHJMRDdpYjhGV3o0V2RIcVVsZW9N?=
 =?utf-8?B?QnljdFc5RWNoMFpTbkFmOEJNdFlYVXluY3BBM3VaWUJTS1NTUjFndmtYaGFk?=
 =?utf-8?B?UkFhWXFoVFRDUWp4b0FTY2RBRXRjaVM0MmxTbE5lbG9UY0dXVi9YYXZrRnZD?=
 =?utf-8?B?MXk0VjNkOURtR1k0NzZKamhqWEs3MkxsYkUyVGtkMWxrYVFBa2J6V3BjUUdq?=
 =?utf-8?B?U2I1RVVsVklUTWhiaDhZN0ZFOVA3UGc3VUVvN3pvNkFkTGdYR2V4T1A4QkVv?=
 =?utf-8?B?WVFLTnFqQm9KLy8vdXV2MVIyV2FhN3hPRytmK0ZiL0wySG5CcjFRNXgrUXFm?=
 =?utf-8?B?aTNvd3NlUWpyOGJLYTIyUHY5TUNTa0F6Z0U4NEFtNFpWZ0J4RVlvUnArTGFz?=
 =?utf-8?B?NDYzS1FJa0Q5SVhyajhka09XMDllMXRjc0NhVUJGckxQcUVoSUdkaC93dllZ?=
 =?utf-8?B?cTJyVFlFRlNjZEJLVmMxT096RytScjNHK1RmT3BXYlVzcTFMNkw5a2NyRGEx?=
 =?utf-8?B?MmdTS1RtLzdQSnVyVmJqRU9tRU5tVWhUbnF3OEZVMEQ4RTh4eXo3aXJaRUYv?=
 =?utf-8?B?OFN0YUgrL0ZlWmZtWnQ2NGYwNzB2UTdGYzIxSGdqc3hqMmhtU0R3YlNTTUw1?=
 =?utf-8?B?SXZoVUtJMkMzeG05b0FjM2JMY20wL2NsUVlROTZFanh5anI0SXl4bVlzMDhR?=
 =?utf-8?B?UlNtWXpnZVpOZVhXZVY4Szc1dllUdjRaT2ZJZ202bzZURUpFQW9hekZ4bkVT?=
 =?utf-8?B?NStQS1dnejVvaHlqQ0wvMnE2bTd6Rk15S3VpZkx3QTZNUkZ6MHRJcmtWVlV6?=
 =?utf-8?B?MXBPeVJCTTVBYmlMK0M3RUhNVGpuMzl3SjBkU3N1SG92RVVySUxFVmxkTlA5?=
 =?utf-8?B?UCs2dHlHenYvVXhRMzJyUTg5bmlEcGlFZE8xaVpBc0VIRGxmbSt0cTkzcjE0?=
 =?utf-8?B?ajVta0haRjFuN09yeDYxeWxTbjBBREhKREY0Zk5XN1U3WHNwVFBYOEx1NFp0?=
 =?utf-8?B?UGlHdjVNY0tiK3k0Q1BGbS8xQXkxTVdtVXlTRkdmZFJ1aWdCNWpqek1hTUNM?=
 =?utf-8?B?K2dnMFliZEttNmxxMFlhNm1RSzR2dGRoZlE3ZUhGdVFHTGRlcUFqd3FDVklj?=
 =?utf-8?B?WXhsTm5iWVpaV2hLNERFNUhlMStlOU8wZkF5VUxzeklKRFJiZXB4R2FOZEJw?=
 =?utf-8?B?bnFPL21QT1lPV2NCbXIvVHNmaHgwM0xrRE90aHFQS1RpWndBR05WUkF6SWpw?=
 =?utf-8?B?bDdaWFE3WXlENTFxcHc1cVovaCs4aFVwa21PSkk5eFBpU1l2RnNmOXBYYThQ?=
 =?utf-8?B?ZG4reDlJbWFCaUp1WlZDc0tCTzgvUktVSHdmTldjcy9FMUR1YkRrajZDZmFl?=
 =?utf-8?Q?+wI8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB7165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 968f1956-45a0-4197-0c7f-08dc2698f604
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2024 22:22:38.3814 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J+1M1O13U+Y+u9dk3e5BDWvNWMBaELv4JeirbE0EB+t81jt7+s5rK1GY4XaJB9WS/4aTPNEI8ot9AGzj55r9Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6889
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

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGEgbG90IGZvciB0aGUgcmV2aWV3Lg0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGlu
Y2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2VudDogTW9uZGF5LCBGZWJydWFyeSA1LCAyMDI0
IDEyOjA4IEFNDQo+IFRvOiBLbHltZW5rbywgQW5hdG9saXkgPEFuYXRvbGl5LktseW1lbmtvQGFt
ZC5jb20+DQo+IENjOiBtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb207IG1yaXBhcmRA
a2VybmVsLm9yZzsNCj4gdHppbW1lcm1hbm5Ac3VzZS5kZTsgYWlybGllZEBnbWFpbC5jb207IGRh
bmllbEBmZndsbC5jaDsgU2ltZWssIE1pY2hhbA0KPiA8bWljaGFsLnNpbWVrQGFtZC5jb20+OyBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1hcm0tDQo+IGtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjMgMi81XSBkcm06IHhsbng6IHp5bnFtcF9kcHN1YjogRml4IHRpbWluZyBm
b3IgbGl2ZSBtb2RlDQo+IA0KPiBDYXV0aW9uOiBUaGlzIG1lc3NhZ2Ugb3JpZ2luYXRlZCBmcm9t
IGFuIEV4dGVybmFsIFNvdXJjZS4gVXNlIHByb3BlciBjYXV0aW9uDQo+IHdoZW4gb3BlbmluZyBh
dHRhY2htZW50cywgY2xpY2tpbmcgbGlua3MsIG9yIHJlc3BvbmRpbmcuDQo+IA0KPiANCj4gSGkg
QW5hdG9saXksDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IE9uIFR1ZSwg
SmFuIDIzLCAyMDI0IGF0IDA2OjUzOjU5UE0gLTA4MDAsIEFuYXRvbGl5IEtseW1lbmtvIHdyb3Rl
Og0KPiA+IEV4cGVjdCBleHRlcm5hbCB2aWRlbyB0aW1pbmcgaW4gbGl2ZSB2aWRlbyBpbnB1dCBt
b2RlLCBwcm9ncmFtIERQU1VCDQo+ID4gYWNvcmRpbmdseS4NCj4gDQo+IEFyZSB0aGVyZSBubyBk
ZXNpZ25zIHdoZXJlIHRoZSBEUFNVQiBvcGVyYXRlcyBpbiBub24tbGl2ZSBtb2RlLCBidXQgdXNl
cyBhDQo+IHZpZGVvIGNsb2NrIGZyb20gdGhlIFBMLCBmb3IgaW5zdGFuY2UgdG8gdXNlIGEgZGlm
ZmVyZW50IGNsb2NrIGZyZXF1ZW5jeSA/DQo+IA0KPiBJIGRvbid0IHRoaW5rIHRoYXQgdXNlIGNh
c2UgaXMgdmVyeSBjb21tb24sIHNvIEknbSBmaW5lIHdpdGggdGhpcyBwYXRjaCBpbiBvcmRlciB0
bw0KPiBwcm9wZXJseSBzdXBwb3J0IHRoZSBtb3JlIGNvbW1vbiB1c2UgY2FzZSBvZiBsaXZlIGlu
cHV0LCBhbmQgbGVhdmUgdGhlIFBMIGNsb2NrDQo+IHdpdGhvdXQgbGl2ZSBpbnB1dCB1c2UgY2Fz
ZSBmb3IgbGF0ZXIuDQo+IA0KVGhlb3JldGljYWxseSwgd2UgY2FuIGNyZWF0ZSBzdWNoIGEgZGVz
aWduLCBidXQgaXQgd291bGRuJ3QgbWFrZSB0b28gbXVjaCBzZW5zZSBzaW5jZSB0aGUgUFMgY2xv
Y2sgaXMgdGhlIGJlc3QgY2hvaWNlIGhlcmUuIFByb2JhYmx5LCBpbiBzb21lIGNvbXBsaWNhdGVk
IHNjZW5hcmlvcyBsaWtlIGh5YnJpZCBsaXZlLWluL0RNQSBvciBsaXZlLW91dCwgd2Ugd291bGQg
Y29uc2lkZXIgdXNpbmcgdGhlIFBMIHZpZGVvIGNsb2NrLCBidXQgdGhlIERQU1VCIGRyaXZlciBp
cyBub3Qgc3VwcG9ydGluZyB0aGVtIHlldC4NCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBUb21pIFZh
bGtlaW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT4NCj4gPg0KPiANCj4gTm8g
bmVlZCBmb3IgYSBibGFuayBsaW5lIGhlcmUuDQo+IA0KU3VyZSwgSSdsbCBmaXggdGhpcyBpbiB0
aGUgbmV3IHZlcnNpb24uIFRoYW5rIHlvdS4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmF0b2xpeSBL
bHltZW5rbyA8YW5hdG9saXkua2x5bWVua29AYW1kLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBM
YXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IA0K
PiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfZGlzcC5jIHwgMiArLQ0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPg0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfZGlzcC5jDQo+ID4g
Yi9kcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfZGlzcC5jDQo+ID4gaW5kZXggNDA3YmMwN2Nl
YzY5Li44YTM5YjNhY2NjZTUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hsbngv
enlucW1wX2Rpc3AuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94bG54L3p5bnFtcF9kaXNw
LmMNCj4gPiBAQCAtMTE2Niw3ICsxMTY2LDcgQEAgdm9pZCB6eW5xbXBfZGlzcF9lbmFibGUoc3Ry
dWN0IHp5bnFtcF9kaXNwICpkaXNwKQ0KPiA+ICAgICAgIC8qIENob29zZSBjbG9jayBzb3VyY2Ug
YmFzZWQgb24gdGhlIERUIGNsb2NrIGhhbmRsZS4gKi8NCj4gPiAgICAgICB6eW5xbXBfZGlzcF9h
dmJ1Zl9zZXRfY2xvY2tzX3NvdXJjZXMoZGlzcCwgZGlzcC0+ZHBzdWItDQo+ID52aWRfY2xrX2Zy
b21fcHMsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRp
c3AtPmRwc3ViLT5hdWRfY2xrX2Zyb21fcHMsDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHRydWUpOw0KPiA+ICsNCj4gPiArIGRpc3AtPmRwc3ViLT52aWRf
Y2xrX2Zyb21fcHMpOw0KPiA+ICAgICAgIHp5bnFtcF9kaXNwX2F2YnVmX2VuYWJsZV9jaGFubmVs
cyhkaXNwKTsNCj4gPiAgICAgICB6eW5xbXBfZGlzcF9hdmJ1Zl9lbmFibGVfYXVkaW8oZGlzcCk7
DQo+ID4NCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQo=
