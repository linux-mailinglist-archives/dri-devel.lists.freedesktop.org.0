Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A594F86F8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 20:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46AC10E22F;
	Thu,  7 Apr 2022 18:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AB910E0E6;
 Thu,  7 Apr 2022 18:11:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9fDSfYNmTBjiEjYoDt6yx4IuxAedzwFGIJo8wyRnG98coOSc5qrZWoCoi8Xjc9VlfkBPOQsm5qjCwm4mj5nGhJ/Y54pAZJ7pXgCQHWxl9N6nfa1o5ePF3DFmNRd54XXX1UA4uZboeftaTGbctoKLsXq5plE0huqhUvFID6uuP15eQzROyUY1TcOwwj5QxkkXsrJQiMcm32ZJqgNCtdlRpKAi3YY5oxdKNBjQ9pLPIip6tjYCmowep/INJhN0Ev+5tk4t3dkxk8MIN9p8IxslGUMdoorcuirb1kZ7Pxh5+kWtRU1vWb6kQA1bsS6ICUM0RxLg983xifrKHmj+8tuDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCpd+/Gl+8vJ9OOqs8zetTtDOP+F/++UL77kDuAd5cw=;
 b=O8OHTcwAGgzd5hs0blhnEHCBxHUAhrVkmlefEkk98p31JTbQDf9RXBgBnyHLbjPI/2SQROae/iguUq3JnZZZDjYF4o5+4MfpcdaPiXb+U9/ZLrZv5ITnCDsgJsfGoA3XaG+xDZHciCjOA10+ykO2+odx2UJLOiVKYuUH7GLdYy3rqL9vkZfZl+qVVi9U2Actt4BlAOda9fwRNAuNiD24v6g86b4xm326Tt2Ex+tvKNKt7xb3frNwFzlg7ISvySzRP5m0ywNU0yxm5ByNdgXT3+X/oRIm30BQ2ZuoUe2UJ7uSXJnvZy4Bq9ysDLEPqsX5PSmDtNmrfSR0y7Vk8szadw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCpd+/Gl+8vJ9OOqs8zetTtDOP+F/++UL77kDuAd5cw=;
 b=Q9p7ZiUtDlBlsIyhgmtts/n8E531XqmDROkWhm0QfTfww23q2J+wXuXZ4IN8L2yicImbP+iHBll38KoOs9eO0zs2HzYiUT2wBxZqoIbQRf+47B9crxF+4puojkT9fSy5+ci9NXxo8SOh5cJw6z/4QPtTbInyCJq8VotRDDbpTMU=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by DM5PR1201MB0233.namprd12.prod.outlook.com (2603:10b6:4:55::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21; Thu, 7 Apr
 2022 18:11:42 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::70d6:f6dd:3e14:3c2d]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::70d6:f6dd:3e14:3c2d%5]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 18:11:42 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, Kai-Heng Feng
 <kai.heng.feng@canonical.com>
Subject: RE: [PATCH] drm/amdgpu: Ensure HDA function is suspended before ASIC
 reset
Thread-Topic: [PATCH] drm/amdgpu: Ensure HDA function is suspended before ASIC
 reset
Thread-Index: AQHYSnjivUZ9njby8U6FChyXEcLep6zkryiAgAAQ87A=
Date: Thu, 7 Apr 2022 18:11:42 +0000
Message-ID: <BL1PR12MB515768121A72E7150602E281E2E69@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <20220407121230.132627-1-kai.heng.feng@canonical.com>
 <CADnq5_Oq4nS1A8MxosTn=0EztBCDeURmGq9WBW9886E9y-sO7Q@mail.gmail.com>
In-Reply-To: <CADnq5_Oq4nS1A8MxosTn=0EztBCDeURmGq9WBW9886E9y-sO7Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-04-07T18:08:49Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=cc49e554-d544-496c-8a2f-36da1bbd4c42;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-04-07T18:11:40Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: a96ddb40-4bf3-4892-8962-e70784763c5a
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a375b62-f895-47c8-e8ab-08da18c211c6
x-ms-traffictypediagnostic: DM5PR1201MB0233:EE_
x-microsoft-antispam-prvs: <DM5PR1201MB0233C9DDBE2C9C425052B645E2E69@DM5PR1201MB0233.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O+ZVT+6ivsETmSUw0W5yHiGG7REetu05ZOrscAD0+kXxiUfVuEue4Z+MG2qwqSh9XJWv72ZxsdeqDz7j4i1KqqBb5ccw2D6iHso3xcfx7jBHzyyf2M+Z/bYp5X2nhbJj8k/MKu2GVrqfxtAW0Ir4DrG+ixRDHTSdxufwIKfHbZhhSC8WbN8v8HP4VEOcPJ+ripTnKoHBBFzGsnVS/n9huJH8NSz2aMJLPUjrcQaW5uKMxdhAB5/B3x7kLdISwI/QLGphWjSzc2Adk0p9mma/dqf+EAAsQIg0y4kFynCVj6OvqaX5DHBFJd5ogEinyi3n0Urb5VugGR5yITznee4cJv39HiipnTPZXc3ZfI4kEXBoA/b6zOMqB69OmlnrNXT07gHlTnvS/BrVEwKM4RUZkbc35tfNDtanA54h3d740nOBFAKHJLM/ZH+qN0lqGeAmA91Y1ZLgSNSRk66J02cGAO34og/iDZLT0cj+joXQ/tGE2Rr9B+UmHh429tslleyZpUCSfOcuCuvVMVGG2n2aMn1swZpbKocoYypxvIZY5DT5Mvz25x4Xg99FO+p7FJY7rsRvUEdbEAfEB9Fq2Wv6fcNjCLteq9cLJsAZ42yyVDMkHTr6t8nVRsYUzfI0D438jH6Y8sc5ahTnNYoXvM3m9mhxYC5npgemVYDhcb5+QL4XRv+6OyXG4zuiv7seoX0237/gFKfJ9CogcUy29KvMtA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5157.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(76116006)(15650500001)(2906002)(55016003)(66946007)(66446008)(86362001)(316002)(33656002)(508600001)(64756008)(8676002)(4326008)(66476007)(54906003)(71200400001)(66556008)(6506007)(53546011)(9686003)(7696005)(110136005)(186003)(26005)(83380400001)(122000001)(38070700005)(8936002)(5660300002)(38100700002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NkhXK2w1cnZCRkFkOUc0NnVqUHZMbllURHNwMW5YR1BZRDBWa2xyTi9taS9m?=
 =?utf-8?B?aFlLc1laUVBwWlRCYzd2L2JSYU5ySmNPRlVEbUk5UmZaU1E2VGszZXRaMGM5?=
 =?utf-8?B?WDNlZXBCdnBEbTVNb0kvY2p5TSt2RGJsOGlncGxhS0lnQ3dmMnp6c1hqK1BW?=
 =?utf-8?B?UmRUMjloRDVNR0hFT3F4MDd0cXlybTlNZTdrM1g2bTI3WXlrSFhLTmx1VVUw?=
 =?utf-8?B?MHRNUFNHNFBDTUNHcjArWDdQa2ZWMmxvYllpU0JJY0krVlNwOU9wNHJKeTFR?=
 =?utf-8?B?bGxvbUIrcU5rR0F4TmYrVmlhbkJiMVVadXRBNjFrUldyaUV6Y21EbVhkRjlu?=
 =?utf-8?B?Zk1mcndkZC9NaXh5a29nNXhPcnVrRUhkZ1ZNQnU0d2thWlFwNTd3MlVFVExX?=
 =?utf-8?B?T29DUU5JUmdzKzRhd3VWVTdwZVlUR2dpQVc3Ni9hNWZ6TWdzekVUaVhMM1ls?=
 =?utf-8?B?V1FaWTVOUXZMb3B5azFQZW1FY3JBNUVqeWtoY1NkMjZDNGNYUjhRMmp6Vk5K?=
 =?utf-8?B?eDhwdnNWdnVvcGZ4eks0SGdLcWFEUkNYNXE4T3VacFpiS3NHRmYyUVU0UkFC?=
 =?utf-8?B?YS9IMzlLb1NGblZFVE1zdTd1bFNaSUMzVlBYVFlzbEhEeGdIMTRVRnBkQ24x?=
 =?utf-8?B?ZFgvNE9PUDFnTTlEWEpHQWZPWmVLY1N0RmNwOVRJSWZqWmFIZXVrSEh6V2RJ?=
 =?utf-8?B?UVpWMkI3Z2FRZ1ZCVDNobzIwcDNmYWNWM0pjSVoyK0QxUmh2L3hpenl6SVda?=
 =?utf-8?B?MWtqZlVmUExmSm5PM24xWVBxc244Z0lMSXM5WEFyem1aNzBVKzFHRDdBZUI4?=
 =?utf-8?B?b2FDVGx5TXhVWmJDcVpDRUZEd0l3QnRxa3VVTThBbml2R3NYOHhtUllqOXR4?=
 =?utf-8?B?czM5KzlKMWYwSlJrZmU1RTdGd1g0ajJRa0JJaEczTHcrZksrTUhUNDQ5S040?=
 =?utf-8?B?eGVrK0JZaEhxVTdNTFk5T29aRUlPSmxjVTZ3SnNhWkF5Y29xdWRudDlXUzNw?=
 =?utf-8?B?ZWpzb2k2SSs3RnpndHQzRVAvaXV0UG1MbzQyVWt1cWtxeFNXVzhhS2RLVFV3?=
 =?utf-8?B?TE55VzBrcWVReXdCb25YVzlrN2VyNTRaek5TK1ErWmVrR21xdTkvZUlKSzNl?=
 =?utf-8?B?VlRKZUxOMTBKMjUvQ3NuMU05RVFOc3hoZzBKWXdzdnI4SHU0VjE0YkQwNFFl?=
 =?utf-8?B?c2VyT2hrdW5Ic0JaNWEzL2hsUGpnVUljUFVjcTJOdlhPeGVjZGdHRkpscTRE?=
 =?utf-8?B?VXlxdXlGMVJ3UEw3cCtkZE5OSDNEVWJlYkJwZk01Uk1SM0RMNGcyQ1JxcERN?=
 =?utf-8?B?Q0dnQ3ZMOWZMeE00UFN5RGk4RGxrOGt6UG9xdUhqRUsxTXpUdFhicE1QRDJR?=
 =?utf-8?B?am9VWUJzTEZFL2VWZFU5clIwN2NsQXg1d2MyNkpWcjRCL2ZYRzVTOVEvZDdy?=
 =?utf-8?B?WmNVMHBFV1JlMUpOSjBVcXNLWlRYOFRmNDhUZjlvVDlLWm5OcUM2T1dMREIy?=
 =?utf-8?B?NXF6RFpjSlRiUnc2REd5R1g3RWliZ0tKdit1N1FBS1Y2N2c5Q3Q3cFVkaGZX?=
 =?utf-8?B?cUZ2dTgvdVMzSU1BSEJBclMyOGVvaDl1ZGJlelZjNzJqUUZTTTZGckJvanNU?=
 =?utf-8?B?dFkwaFgzSDlwcitwZk1mNkcyWGZVN081OWNaQ1VBRWVaL3ZscmxFL2hPekhO?=
 =?utf-8?B?UmZYYUQwTjZCNTU4WXkvYWg1ZGhSc0dMMTA0VDMzcVpPcmtjK3RVU29haWJu?=
 =?utf-8?B?enhnQ3BhQ1FVNmlHZXJxWHpGOEFMNmNaZ0M3aWxoZlc0WGxWMkxnZ0xURFBY?=
 =?utf-8?B?TEpaYzhUSUJEREJwMHQ3djl0b0E0dFdEd3lqUWNiQmQ1R1ZkcVBMRGIwbExy?=
 =?utf-8?B?clNxQkNTUEM2bDJzaTBsTm5sUlVENXFBbXFWYk5aWFA4TjJFcENpbU5QTXJB?=
 =?utf-8?B?OVlQZ2VOQnI0dEVCS2wxSFVRZkZtQXpUa0o2OGwxMThyTnlTOWs3b205ZFNo?=
 =?utf-8?B?aW1QN2EwbGpna2dvM2xScjVrMlByWTVlZ2lRbDUyaWIrTzY5NnRvWVQ1b0RX?=
 =?utf-8?B?b1Y5dlRKRHl2U2RYK29jVVJhaU96a2todlliRDMrQ1hualpSeDNQOW91RnlX?=
 =?utf-8?B?SkVwYk1RL3pIMVd5QWo0M2czRG9tallGRGRpL3EvbnFmRDd1dG51TDZUSEh1?=
 =?utf-8?B?Mks1RnYxK2YzMlZsK0F6anJTaWVlSGZ4dnRTaXp1US9oSUFsVEN3M3RsQmVL?=
 =?utf-8?B?eERINmNQZ3JZNnlBTUFHZG5wd24wZTY4WWtOZ1hZaG9jemJiMS9ZcHhqL0N1?=
 =?utf-8?B?VlJkTmZMQW8wNGRHMVJOMVFPeGdYVXRJaE01MDg0OWEyQ3Nabk5EUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a375b62-f895-47c8-e8ab-08da18c211c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 18:11:42.4661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T9j//RlfHyd3L4KaJ30K4gRMVYJbZRr8+xaPqyS09sOq7azj9LOl7Yl78NWA/xAehCcSjty6Uz3ZCY2AbPd9nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0233
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Chiu,
 Solomon" <Solomon.Chiu@amd.com>, "Tuikov, Luben" <Luben.Tuikov@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4IERl
dWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDcs
IDIwMjIgMTI6MDgNCj4gVG86IEthaS1IZW5nIEZlbmcgPGthaS5oZW5nLmZlbmdAY2Fub25pY2Fs
LmNvbT4NCj4gQ2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNv
bT47IEtvZW5pZywgQ2hyaXN0aWFuDQo+IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBQYW4s
IFhpbmh1aSA8WGluaHVpLlBhbkBhbWQuY29tPjsgRGF2aWQNCj4gQWlybGllIDxhaXJsaWVkQGxp
bnV4LmllPjsgTWFsaW5nIGxpc3QgLSBEUkkgZGV2ZWxvcGVycyA8ZHJpLQ0KPiBkZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc+OyBMS01MIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPjsg
YW1kLQ0KPiBnZnggbGlzdCA8YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBDaGl1LCBT
b2xvbW9uDQo+IDxTb2xvbW9uLkNoaXVAYW1kLmNvbT47IExpbW9uY2llbGxvLCBNYXJpbw0KPiA8
TWFyaW8uTGltb25jaWVsbG9AYW1kLmNvbT47IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29t
PjsNCj4gVHVpa292LCBMdWJlbiA8THViZW4uVHVpa292QGFtZC5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0hdIGRybS9hbWRncHU6IEVuc3VyZSBIREEgZnVuY3Rpb24gaXMgc3VzcGVuZGVkDQo+
IGJlZm9yZSBBU0lDIHJlc2V0DQo+IA0KPiBPbiBUaHUsIEFwciA3LCAyMDIyIGF0IDg6MjEgQU0g
S2FpLUhlbmcgRmVuZw0KPiA8a2FpLmhlbmcuZmVuZ0BjYW5vbmljYWwuY29tPiB3cm90ZToNCj4g
Pg0KPiA+IERQL0hETUkgYXVkaW8gb24gQU1EIFBSTyBWSUkgc3RvcHMgd29ya2luZyBhZnRlciBT
MzoNCj4gPiBbICAxNDkuNDUwMzkxXSBhbWRncHUgMDAwMDo2MzowMC4wOiBhbWRncHU6IE1PREUx
IHJlc2V0DQo+ID4gWyAgMTQ5LjQ1MDM5NV0gYW1kZ3B1IDAwMDA6NjM6MDAuMDogYW1kZ3B1OiBH
UFUgbW9kZTEgcmVzZXQNCj4gPiBbICAxNDkuNDUwNDk0XSBhbWRncHUgMDAwMDo2MzowMC4wOiBh
bWRncHU6IEdQVSBwc3AgbW9kZTEgcmVzZXQNCj4gPiBbICAxNDkuOTgzNjkzXSBzbmRfaGRhX2lu
dGVsIDAwMDA6NjM6MDAuMTogcmVmdXNlZCB0byBjaGFuZ2UgcG93ZXIgc3RhdGUNCj4gZnJvbSBE
MCB0byBEM2hvdA0KPiA+IFsgIDE1MC4wMDM0MzldIGFtZGdwdSAwMDAwOjYzOjAwLjA6IHJlZnVz
ZWQgdG8gY2hhbmdlIHBvd2VyIHN0YXRlIGZyb20NCj4gRDAgdG8gRDNob3QNCj4gPiAuLi4NCj4g
PiBbICAxNTUuNDMyOTc1XSBzbmRfaGRhX2ludGVsIDAwMDA6NjM6MDAuMTogQ09SQiByZXNldCB0
aW1lb3V0IzIsIENPUkJSUA0KPiA9IDY1NTM1DQo+IA0KPiBBcyBhbiBhc2lkZSwgc2hvdWxkbid0
IGRldmljZSBsaW5rcyBvcmRlciB0aGlzIHByb3Blcmx5IGFscmVhZHk/ICBJDQo+IHRob3VnaHQg
dGhhdCB3YXMgdGhlIHdob2xlIHBvaW50IG9mIHRoZW0uICBXZSBoYXZlIHF1aXJrcyBpbiBQQ0kN
Cj4gcXVpcmtzLmMgdG8gY3JlYXRlIGRldmljZSBsaW5rcyBmb3IgYWxsIEdQVSBpbnRlZ3JhdGVk
IHBlcmlwaGVyYWxzDQo+IChhdWRpbywgdXNiLCB1Y3NpKS4NCg0KVGhlIG1vdmVtZW50IGZyb20g
RDAtPkQzIG9ubHkgaGFwcGVucyBpbiBub2lycSB0aG91Z2ggaW4gcGNpX3BtX3N1c3BlbmRfbm9p
cnEuDQpTbyBpZiBkZXZpY2UgbGlua3Mgb25seSBvcmRlciB3aXRoaW4gYSBzdXNwZW5kIHBoYXNl
IHRoZW4gcmVzZXR0aW5nIGR1cmluZyB0aGF0DQpwaGFzZSBtZWFucyB0aGUgZnV0dXJlIHBoYXNl
IHdvbid0IGhhdmUgZ3JvdW5kIHRvIHN0YW5kIG9uLg0KDQpJT1cgSSB0aGluayBkZXZpY2UgbGlu
a3MgKyB0aGlzIGNvbW1pdCBhcmUgbmVlZGVkIHRvIGdldCB0aGUgb3JkZXIgcmlnaHQgd2l0aCBh
IHJlc2V0Lg0KDQo+IA0KPiBBbGV4DQo+IA0KPiA+DQo+ID4gVGhlIG9mZmVuZGluZyBjb21taXQg
aXMgZGFmOGRlMDg3NGFiNWIgKCJkcm0vYW1kZ3B1OiBhbHdheXMgcmVzZXQgdGhlDQo+IGFzaWMg
aW4NCj4gPiBzdXNwZW5kICh2MikiKS4gQ29tbWl0IDM0NDUyYWMzMDM4YTcgKCJkcm0vYW1kZ3B1
OiBkb24ndCB1c2UgQkFDTyBmb3INCj4gPiByZXNldCBpbiBTMyAiKSBkb2Vzbid0IGhlbHAsIHNv
IHRoZSBpc3N1ZSBpcyBzb21ldGhpbmcgZGlmZmVyZW50Lg0KPiA+DQo+ID4gQXNzdW1pbmcgdGhh
dCB0byBtYWtlIEhEQSByZXN1bWUgdG8gRDAgZnVsbHkgcmVhbGl6ZWQsIGl0IG5lZWRzIHRvIGJl
DQo+ID4gc3VjY2Vzc2Z1bGx5IHB1dCB0byBEMyBmaXJzdC4gQW5kIHRoaXMgZ3Vlc3N3b3JrIHBy
b3ZlcyB3b3JraW5nLCBieQ0KPiA+IG1vdmluZyBhbWRncHVfYXNpY19yZXNldCgpIHRvIG5vaXJx
IGNhbGxiYWNrLCBzbyBpdCdzIGNhbGxlZCBhZnRlciBIREENCj4gPiBmdW5jdGlvbiBpcyBpbiBE
My4NCj4gPg0KPiA+IEZpeGVzOiBkYWY4ZGUwODc0YWI1YiAoImRybS9hbWRncHU6IGFsd2F5cyBy
ZXNldCB0aGUgYXNpYyBpbiBzdXNwZW5kDQo+ICh2MikiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IEth
aS1IZW5nIEZlbmcgPGthaS5oZW5nLmZlbmdAY2Fub25pY2FsLmNvbT4NCj4gPiAtLS0NCj4gPiAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMTggKysrKysrKysrKysr
LS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kcnYuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0K
PiA+IGluZGV4IGJiMWMwMjVkOTAwMTkuLjMxZjcyMjllN2VhODkgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jDQo+ID4gQEAgLTIzMjMsMTggKzIzMjMs
MjMgQEAgc3RhdGljIGludCBhbWRncHVfcG1vcHNfc3VzcGVuZChzdHJ1Y3QNCj4gZGV2aWNlICpk
ZXYpDQo+ID4gIHsNCj4gPiAgICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gZGV2
X2dldF9kcnZkYXRhKGRldik7DQo+ID4gICAgICAgICBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRl
diA9IGRybV90b19hZGV2KGRybV9kZXYpOw0KPiA+IC0gICAgICAgaW50IHI7DQo+ID4NCj4gPiAg
ICAgICAgIGlmIChhbWRncHVfYWNwaV9pc19zMGl4X2FjdGl2ZShhZGV2KSkNCj4gPiAgICAgICAg
ICAgICAgICAgYWRldi0+aW5fczBpeCA9IHRydWU7DQo+ID4gICAgICAgICBlbHNlDQo+ID4gICAg
ICAgICAgICAgICAgIGFkZXYtPmluX3MzID0gdHJ1ZTsNCj4gPiAtICAgICAgIHIgPSBhbWRncHVf
ZGV2aWNlX3N1c3BlbmQoZHJtX2RldiwgdHJ1ZSk7DQo+ID4gLSAgICAgICBpZiAocikNCj4gPiAt
ICAgICAgICAgICAgICAgcmV0dXJuIHI7DQo+ID4gKyAgICAgICByZXR1cm4gYW1kZ3B1X2Rldmlj
ZV9zdXNwZW5kKGRybV9kZXYsIHRydWUpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50
IGFtZGdwdV9wbW9wc19zdXNwZW5kX25vaXJxKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiArew0K
PiA+ICsgICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSBkZXZfZ2V0X2RydmRhdGEo
ZGV2KTsNCj4gPiArICAgICAgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZHJtX3RvX2Fk
ZXYoZHJtX2Rldik7DQo+ID4gKw0KPiA+ICAgICAgICAgaWYgKCFhZGV2LT5pbl9zMGl4KQ0KPiA+
IC0gICAgICAgICAgICAgICByID0gYW1kZ3B1X2FzaWNfcmVzZXQoYWRldik7DQo+ID4gLSAgICAg
ICByZXR1cm4gcjsNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGFtZGdwdV9hc2ljX3Jlc2V0
KGFkZXYpOw0KPiA+ICsNCj4gPiArICAgICAgIHJldHVybiAwOw0KPiA+ICB9DQo+ID4NCj4gPiAg
c3RhdGljIGludCBhbWRncHVfcG1vcHNfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiBA
QCAtMjU3NSw2ICsyNTgwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIGFtZGdw
dV9wbV9vcHMNCj4gPSB7DQo+ID4gICAgICAgICAucHJlcGFyZSA9IGFtZGdwdV9wbW9wc19wcmVw
YXJlLA0KPiA+ICAgICAgICAgLmNvbXBsZXRlID0gYW1kZ3B1X3Btb3BzX2NvbXBsZXRlLA0KPiA+
ICAgICAgICAgLnN1c3BlbmQgPSBhbWRncHVfcG1vcHNfc3VzcGVuZCwNCj4gPiArICAgICAgIC5z
dXNwZW5kX25vaXJxID0gYW1kZ3B1X3Btb3BzX3N1c3BlbmRfbm9pcnEsDQo+ID4gICAgICAgICAu
cmVzdW1lID0gYW1kZ3B1X3Btb3BzX3Jlc3VtZSwNCj4gPiAgICAgICAgIC5mcmVlemUgPSBhbWRn
cHVfcG1vcHNfZnJlZXplLA0KPiA+ICAgICAgICAgLnRoYXcgPSBhbWRncHVfcG1vcHNfdGhhdywN
Cj4gPiAtLQ0KPiA+IDIuMzQuMQ0KPiA+DQo=
