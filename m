Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E347E7C2B
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 13:29:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A5810E9A3;
	Fri, 10 Nov 2023 12:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BFE410E9A3;
 Fri, 10 Nov 2023 12:29:14 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly33b.srv.mailcontrol.com (MailControl) with ESMTP id 3AACSsKj171115;
 Fri, 10 Nov 2023 12:28:54 GMT
Received: from rly33b.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender ttayar@habana.ai) (MIMEDefang) with ESMTP id
 3AACSrNo170872
 (TLS bits=256 verify=OK); Fri, 10 Nov 2023 12:28:54 +0000 (GMT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly33b.srv.mailcontrol.com (MailControl) id 3AACRrWg161914;
 Fri, 10 Nov 2023 12:27:53 GMT
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by rly33b-eth0.srv.mailcontrol.com (envelope-sender ttayar@habana.ai)
 (MIMEDefang) with ESMTP id 3AACRpil161443
 (TLS bits=256 verify=OK); Fri, 10 Nov 2023 12:27:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K7NghPrMH35L++Xh6vGoNitrlo4941r/tr/98tGVuU/Eii3NMkmereNUOfVFh7pkWz6+IQm8Jt2uA8T9OdR+hNZecfxvkdSAFsU/1xGivmmvfqdFcXHFkVe1BmFIIQByzMg1BbU7f/prrJsR5MDf/JnHGtbIFTDrNx8wZ7oS8ed56nU/FpU68gqcokWKswSyQC7q4Qyt4FavDbiDgr5PsJsj9QuarYdYND5n2zge5iAtx3nHKz7b2JNgvP1S7Br462N3iOuKiNDhbj2hQCZ3SMH99ZAKIHw+uAvQmfXQgrzFEFAjSi0P2r+UgGBbbbAVkUvlX3CsKhapkpHw/+/i8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=INCnP9A24mRIlw1CVYcSzlvDtbvnUNNJ0oiYNC7uwNA=;
 b=YwVq4RD+iw8j90RZKMwTEE+ASZz+kVKiGNxzgiQSGx1EjmycxjsIyjh9tnOBYamPglk56vQ6wUORxpi1gsIMLLZPs1WH581ON7zPAhRmqK0kLR1/wm9dMzASITpbnUKVbD5F4Ba0YMYzkbpYxlehqjBEMxuol0aSuEYF8l+uBKqwx23E5Jhod7kua8yjfzfIhManQ4tsd/rwHax5F35vKidKXspMfOnwu2eglWUkI5zmMAFpmiakE/AHkp3thJUewiSK4RZ5FAq4lxhO26KjK3ZLjmY/wN6F/hH68nMCoaQLGlPmhwLvPYOS/TK54YBH+dWvJ+gTYgQmfXLxDsbB5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=INCnP9A24mRIlw1CVYcSzlvDtbvnUNNJ0oiYNC7uwNA=;
 b=F7zwnB6848kpdIwR0UJKxknGsYuYGHSvgokzKOcWAQgGes4HAHDhLsP9dXx9X0bvhMVQjp02Mpu8s7iYjQWaVxzNqefz4IU+4erPRze1JaA3Z3oUkP9jVQeeLadNzeTyl+/OBC+OLAR5LdZ9KgxfGORfVzpntAji0qMStqBL6yiysFQSJC4d3lUZyimKzM9STXJvgW/ahqzBn0sCSJUe2Fl69ExZ+3UV78ShQFBWbGtpKcXBBbJ3IMKdl7NEwrjg3DUl6dXGzhdiTbWbpTNEqbk93np5EC5gsdOlM3cpqs/Ktj82fo/HZW2/avyl7mJok08XODvthxaTeZunM+3lBA==
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com (2603:10a6:10:2d8::6)
 by DBAPR02MB6021.eurprd02.prod.outlook.com (2603:10a6:10:18d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Fri, 10 Nov
 2023 12:27:47 +0000
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::8ce1:e2a8:6500:bea8]) by DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::8ce1:e2a8:6500:bea8%6]) with mapi id 15.20.6977.019; Fri, 10 Nov 2023
 12:27:46 +0000
From: Tomer Tayar <ttayar@habana.ai>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>, "Hawking.Zhang@amd.com"
 <Hawking.Zhang@amd.com>, "Harish.Kasiviswanathan@amd.com"
 <Harish.Kasiviswanathan@amd.com>, "Felix.Kuehling@amd.com"
 <Felix.Kuehling@amd.com>, "Luben.Tuikov@amd.com" <Luben.Tuikov@amd.com>,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Subject: Re: [RFC v2 5/5] drm/xe/RAS: send multicast event on occurrence of an
 error
Thread-Topic: [RFC v2 5/5] drm/xe/RAS: send multicast event on occurrence of
 an error
Thread-Index: AQHaA234AfKqUIbn90i9Sv0wgezag7Bzm8IA
Date: Fri, 10 Nov 2023 12:27:46 +0000
Message-ID: <825661de-922f-459e-b667-b95aa0df7f46@habana.ai>
References: <20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com>
 <20231020155835.1295524-6-aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20231020155835.1295524-6-aravind.iddamsetty@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR02MB7573:EE_|DBAPR02MB6021:EE_
x-ms-office365-filtering-correlation-id: 644b2c14-19c4-499b-20c4-08dbe1e87251
x-ld-processed: 0d4d4539-213c-4ed8-a251-dc9766ba127a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QNSvqgMRV25HBpgxEeOVq/zpanS26rx7drPZuDDJ4eG3U/WjA0ep6OvsycF0eeharpde0keqY1Q88KVDttqpptzsisRxxq6tBeE8mW2yAuBiHApLojwCq4NfcA2XZOhTHOJ+Bq70MW8uUFigLHSG0Sg21ocXA/OGSGR5lyCIiLryIWoZzUUlpPCth5NCq1Y9drGCo2oY4OCNoE8TOIc7Jp0SdRhKOaKtzdKT6YQBsvtUlpGa8DBdDRBtekcufRJcw3YQhHesIpDXQQiAun+Srm9vdhwlCqDPBfskBIdqeIhItka917HCqZkVMVXAgOvEZE63gy/b6Q4kcq/GxGwyILOXASNVczQhboyF8kPIict2kkMGU9EWwt4sJUXflFk1v/DhGTNzeXiecoOTgPwU9OXR65osr2koSYXnZcjtwonr/9wo8G+BazaC+wgcAuCbSxwEaUFZtexHRzs9uXQsnNAwyaV3fLow6XFI5A+TQ01tHY1DtTCBwwy3tO2HZAxUmFnVCplHHviNsRRF7HlPwa9oiehqW5iHOqPoYz5OQdCk4TG8GGyWHiu7VcRgjqxmBApguHumsMVTAea6pGOFBwtwh8PVe6H8MrkH5F4N8Dvcm7c4XcCvfXT6nF6oSRzpe4yKFRrZDXY1/yGyF+yZSsNuqKoOj/mXs6D8s/Hqhjv2YthxqDOWnF5G4gkRSdAn6YnAXOkvYDDoMneJ8VqiUw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR02MB7573.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39840400004)(136003)(346002)(366004)(376002)(396003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(6506007)(38100700002)(478600001)(31686004)(6486002)(71200400001)(53546011)(6512007)(36756003)(83380400001)(316002)(91956017)(122000001)(2616005)(64756008)(26005)(66556008)(110136005)(66946007)(66446008)(82960400001)(76116006)(66476007)(41300700001)(8936002)(7416002)(86362001)(2906002)(8676002)(38070700009)(921008)(66899024)(31696002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmVzYXVYOG1UajNuYWFTRWcxSEJFaEpSUTZqejdEOGVsaVhjVzJseXg4Und2?=
 =?utf-8?B?bVZ4eHJSdkZZY21YVE5HbVgyMll6bThoa05YTVp0enQxMGJjMEZEMFpZOGdL?=
 =?utf-8?B?YTl5dFhpYVR2Y0t3R0pNazVVemVVQStGdTNYQklLMjJsTHViYzRBU3U1RVhu?=
 =?utf-8?B?MkwybytzNGlvdGZRNVdKeW9iTUY1eGRGNk1NSFRhdWVnclZQZ1ZEK1VCZXRW?=
 =?utf-8?B?WDVBUDBMNXczUWFIREZnM3lIRWhkMEUwWnRraUZrYjFMV1d3UDNMZDF3NWRy?=
 =?utf-8?B?YUlydU0rVWQ3Y3ZYTTI5RWZDWGdXV2pJYVR6Q21PdDViOHNMYmU0S1ZINzRZ?=
 =?utf-8?B?YTcveDhaNUJWU05TUGxUYjJ5SFZBQ0I0UTA5Rm9CRG53VmRMLzFZSldmYVJi?=
 =?utf-8?B?Rmw0UWJwVGhuWDRIamprUEpNMUx6Y0xJN1l3aG1adFNkNDREWUE2L2ptTVpx?=
 =?utf-8?B?N3ZPVVNlZmJRZnhnK3Q3bnlUU1cwbXRIZmx0MFFxTXJ3dFN3YUNrR3BRd3c4?=
 =?utf-8?B?dWt4cVU3Q3puOE04UnNnVzZwem1RVDJVbEdWVDJYNXpiTDVIc2lTRnVmUlZz?=
 =?utf-8?B?VW55ZW9CTU1HT1d3aUgzUHV6N0U0UHNYaXJuYjBZdnEyWjNFeUhrV0dLR2VB?=
 =?utf-8?B?NW43SmlMNHFZaE9SbmlLVWhBaytlU0VYQUFaZFIrT2J2SGhscCtJYU9ENmdD?=
 =?utf-8?B?d2lmM1pnMmJRdnl4MStybGdPeVVzYzI0Z2NYZ1JoalJvSkt2T0luRHU5VlNJ?=
 =?utf-8?B?dm8vbmw1U3BySUdzSk5Wc25oaDhFeW1abHc5cnlxd1pYNzRGRjJoWEJMRldj?=
 =?utf-8?B?aFV0blpBSUZsaTh5VGlNbEdmNm5xK2cycndwTXJ2NnVKUDRsVjhOc09UTnNC?=
 =?utf-8?B?VzIvRmh5RVhXSmFGZUkweXJZZzBpZkZtc2IzSktzaVRQZ0I0ZEx6ZjRhZDNh?=
 =?utf-8?B?TC9CakExUW5kMmF2ZG9sYzI0dTl1UXRaVk50NHdJMitoWG83cERQdFlRbFA4?=
 =?utf-8?B?bEIrN1QwMUhyVG4zcSs2Tkl0ZHEwTG5JMzlneEV1akpMSWZ2c3dRbWlCNFY0?=
 =?utf-8?B?K0JMdmZ3Tkd0WnBkVUhlOVlrL2gyaG4xaTBWMzlxUFlkSmMvbzQvWkVQUWxN?=
 =?utf-8?B?L2pwczNtaHIzQ3lRSUxGMUI2bHQwOHpncUhlU2NodzN4SGMzSE1GSFpJVTN6?=
 =?utf-8?B?dHYxNml1anJGdVNUb1NxcFJsQUI0NkR4NnhGQy85SitkQTVLdjFEeExCT3Ew?=
 =?utf-8?B?ZmdQbkdHMDJ0TUdzYnFIR0hYRldham5rOFBObmxHeTYyK1czaWF2NVVaUzZB?=
 =?utf-8?B?TFlISkFxWU8vdXpnRm52OCsweDcySktBRllrdXNuWW91NFRjdTI5TXlBTS9S?=
 =?utf-8?B?L2tzWEI1Vk9jUEZkUjV0WUFLWnpUcmx6NWszSGhYYWtPRno1ejR0RjNpSDhn?=
 =?utf-8?B?UTZhVXA5bnE4VytEZGRGYWRMRDJvNEpHWGl4VmgyZC9mdE9vZkVIdFFWV21O?=
 =?utf-8?B?d0VzT2MxWjFUZEdZMGV5N1JWcUV4T1JMWm00NnRKeklNNVV2YzQxQkJOZFhX?=
 =?utf-8?B?clNTWnN1ZDlZSFJ6Qzc2eDJSalUxNzFnOUJDWmQ2ZFlSYkhCWndPU25CQ2hl?=
 =?utf-8?B?R0FiQUUranhRTVQxSlZMd0xhNTBjM3RRUS9EMVUrOE1HNk5ucWVKdGZIK1pK?=
 =?utf-8?B?UXljTjlpbWdUV09NNS90cURnc1ljZHArSWtaOTBybGlkVzlrWEVPakVaMFBz?=
 =?utf-8?B?enVEMVRaWlRiTXlJT3N1Zm5NeERIUHRISXppYTlGa0NIV1JVbE1MQXN3MzlR?=
 =?utf-8?B?T0E0VytmZ1lPSDJ5Tjkzc09vdUtYZE56VHQ4ajJxVFNMenloNmlrejRpQThQ?=
 =?utf-8?B?OU8wSlRpTzZMcVA3YmJLYjF1WXBKSUNmR0tndkwvVkxwK1p2Z2RMOVVRODNZ?=
 =?utf-8?B?elVORnBFaHdmdXdSL0lKejhTQ2ViYlY5SzA0RlBwY2QzbWdINDJlWERKdDFh?=
 =?utf-8?B?U0o5bWR0TUU5cXNYMjdQQmh6bUdRbjRFRmhmSDZiTnA1by9aeDEyWmhaOVdP?=
 =?utf-8?B?MHdNRDNodDdjS1h2d1lZQldHWCtTaEZoTXQ2VjRhZWdvc2syUy9kbWExdnp3?=
 =?utf-8?Q?rXHU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EEE9B3B53C7B3947860DDD8540A03ADB@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?WEdPMElHOVBlS0RobDRCWkZXa2RiUmVZb1BkcHRPWGVseEJMYUF4YXFWZHpU?=
 =?utf-8?B?b2c4VnBJenZSRlEzdjI4UkpKam1HeXRiVS85ZkNmTVFOSmY4RTJ0ZVY1KzJt?=
 =?utf-8?B?WTBoemZxSjdjUDRxZDFheEhpZ3Zxam9hK0luWS9EYTk2ZVBhd0NNczhEeW1F?=
 =?utf-8?B?NksrbzJXcWRBM1dhRG5JbnRnWHJBU3ZEajVJU29BTThUVTQ4TnFVaEVGV1U4?=
 =?utf-8?B?Vmt4OHRoRHVHVisyTlkxVzUzRkkwOWpkK25iMlBRWG11Vkhqa1QyN20wNld3?=
 =?utf-8?B?cDJkSXNHQ0ZoZVVIdUk1SlZSTjR5cXVVeTZYcytjcFVROUduMFRUZDVNUlAw?=
 =?utf-8?B?cWRTZWZVaTZmM1IzV0tZMHhlNmV1V0RvOUxsOWx2RW1KdVMvdmZCY2ZtM0JU?=
 =?utf-8?B?QnNXdjU4VHYxZUZKNVJIVTJBUkVLSUtBNjg0ZEUzYlVmMU5NR05RbE1XeDBV?=
 =?utf-8?B?VXJYdStERGpOZmpUeFExdk5ybncvZHBxTFI2WWZ2OUsxSFJ2cVlpeUtwaHFv?=
 =?utf-8?B?cFVqWFpaT3JyZkllM3lqL3FoVmJjSUpUdmc2aVZKZlBRNWd5OHNxcEg4WGMx?=
 =?utf-8?B?cnpic2tFMk9sTFlmbmF6TUV6cGozQkdYSW5OaXlkc1QyN0htOHhQc0ZrUXhx?=
 =?utf-8?B?SnFEdU12dFBlcEFKMU1xUWprZ013a1I4bWtIUHp0VWZUTHVaSDF5RTVSRFQx?=
 =?utf-8?B?Uk84elRqejM2SlJ5eU5waVdkYWVUd3lESmpGajR3Y2lZTjNqNVBGUWNkZm5u?=
 =?utf-8?B?a3M5aFRCa0JzL2JUMFRidVl0VzlOOEhjZmlFZGI1MFVIRktkV2Q1VnFLN3cy?=
 =?utf-8?B?UjdGSXI3RFNPb0JTVUpFTHJRTFIxNjF3amJ3TzN0dktFdzZLb1RNdlkwN2lr?=
 =?utf-8?B?VDBuK0tEU3BjMnZEZ3MwaVJEcTBza2UzemUwSU50cHYyRjFVQ25IWTFtS0M2?=
 =?utf-8?B?a2JHamlCMW5aN0pJdHMzWFlsRWFla2tZRDB3UE9xeU45K0VLb2NON3RWSHh3?=
 =?utf-8?B?MFcxTHJpbEtydE4rTkpYT2krbXBMVlhnQ2l2OFlxbW0rOWk5YXFBdWJoaUZQ?=
 =?utf-8?B?WWt6eTNxcEdnK0RKZitPTXllSnVYWi9ySTNoc3ZzeVN4dDFjSitHNWhlVy9M?=
 =?utf-8?B?d0xxZ3NvS0NxREIrSnhtSllKcC9NNnBKeDdjeTFjMGNyOU5yNStXTllqWTkv?=
 =?utf-8?B?b0hWN3g2U0UySEFwVWY1SEQrYlpnM0xkRWFoZ254NHA5bkprUHRnZkVXSERw?=
 =?utf-8?Q?SxPLghpolK85Nce?=
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR02MB7573.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 644b2c14-19c4-499b-20c4-08dbe1e87251
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2023 12:27:46.9261 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bfaWXq+YcIvwkYm/NK65rX+GACVC1kitKoN/PmimJ1LVSrwiPdckTmaeb2bPph4npmGZbFSiP0y+sT7AHKu57g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6021
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTY5OTYxOTMzMzpGUEtleTEucHJpdjrMcS5qBcfZdsflXW54va6m9bgYcZWSPDWS9jTCnTfmLFC3s99BvjCzMi0t6WKQNipwqTTjlGuRbTqHmDe+WwmEcEvpljqIiWfXO5i68+8n7g2MdQLIrnNRbpzheeV2g19jH2bLnm8x0e45SoPKr3qexYThtf8a6ZmKs1yyKmQ/VhRM6oABW+ASon8ZzC2d57+CRMV/xHdwHRODggKm1aJz8xi1X0GtDCcyIZwxMlUfmG5gujWzAOaehUsm4jrjzrMW20EmICkzb7NFuzMTiOTgt8Xqx8Bj3qqlNvof9HaIiw3moIuDn2lVDGi9GdfLpvipbpRPeHoNdaGodZuIysPa
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 104.47.12.50
X-Mailcontrol-Refers-To: 3AACSrNo170872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-2; bh=INCnP9A24mRIlw1CVYcSzlvDtbvnUNNJ0oiYNC7uwNA=;
 b=a966ofSf8h2hv3lqA4Av12PdMLH3EuCjSov7DUILBArZoHPx7LnWiE6YURNltUE9i/u1qRfQS7n5e1WDfmec7Y5LpttIWYgW10eyijgsDSeGTRk4un8zTHSirgJ0eP5MmrbjFQfdPPe0B+DC7fPISUhKl4QzRQwkj79TG2HEHGG2kq2kiv6SVGkopdlWWcLt7s4+oWfhyAsJUxn26CFWhPUCX3+eWsfzulYd5eLaer3w6QmP8bkzbq0Y73vANfqey1HCWumwtBCIye4HGZQnQWm6W4ok9sDEADT9SLZSPUfvNra4+nrv9QLOqjuFBVCehDAcDX5Bx6N8rUGbO3IknQ==
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

T24gMjAvMTAvMjAyMyAxODo1OCwgQXJhdmluZCBJZGRhbXNldHR5IHdyb3RlOg0KPiBXaGVuZXZl
ciBhIGNvcnJlY3RhYmxlIG9yIGFuIHVuY29ycmVjdGFibGUgZXJyb3IgaGFwcGVucyBhbiBldmVu
dCBpcyBzZW50DQo+IHRvIHRoZSBjb3JyZXNwb25kaW5nIGxpc3RlbmVycyBvZiB0aGVzZSBncm91
cHMuDQo+DQo+IHYyOiBSZWJhc2UNCj4NCj4gU2lnbmVkLW9mZi1ieTogQXJhdmluZCBJZGRhbXNl
dHR5PGFyYXZpbmQuaWRkYW1zZXR0eUBsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KPiAgIGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9od19lcnJvci5jIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2Vycm9yLmMgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfaHdfZXJyb3IuYw0KPiBpbmRleCBiYWI2ZDRjZjBiNjkuLmIwYmVmYjVlMDFjYiAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2Vycm9yLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2Vycm9yLmMNCj4gQEAgLTc4Niw2ICs3ODYsMzcgQEAg
eGVfc29jX2h3X2Vycm9yX2hhbmRsZXIoc3RydWN0IHhlX3RpbGUgKnRpbGUsIGNvbnN0IGVudW0g
aGFyZHdhcmVfZXJyb3IgaHdfZXJyKQ0KPiAgIAkJCQkoSEFSRFdBUkVfRVJST1JfTUFYIDw8IDEp
ICsgMSk7DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGljIHZvaWQNCj4gK2dlbmVyYXRlX25ldGxpbmtf
ZXZlbnQoc3RydWN0IHhlX2RldmljZSAqeGUsIGNvbnN0IGVudW0gaGFyZHdhcmVfZXJyb3IgaHdf
ZXJyKQ0KPiArew0KPiArCXN0cnVjdCBza19idWZmICptc2c7DQo+ICsJdm9pZCAqaGRyOw0KPiAr
DQo+ICsJaWYgKCF4ZS0+ZHJtLmRybV9nZW5sX2ZhbWlseS5tb2R1bGUpDQo+ICsJCXJldHVybjsN
Cj4gKw0KPiArCW1zZyA9IG5sbXNnX25ldyhOTE1TR19ERUZBVUxUX1NJWkUsIEdGUF9BVE9NSUMp
Ow0KPiArCWlmICghbXNnKSB7DQo+ICsJCWRybV9kYmdfZHJpdmVyKCZ4ZS0+ZHJtLCAiY291bGRu
J3QgYWxsb2NhdGUgbWVtb3J5IGZvciBlcnJvciBtdWx0aWNhc3QgZXZlbnRcbiIpOw0KPiArCQly
ZXR1cm47DQo+ICsJfQ0KPiArDQo+ICsJaGRyID0gZ2VubG1zZ19wdXQobXNnLCAwLCAwLCAmeGUt
PmRybS5kcm1fZ2VubF9mYW1pbHksIDAsIERSTV9SQVNfQ01EX0VSUk9SX0VWRU5UKTsNCj4gKwlp
ZiAoIWhkcikgew0KPiArCQlkcm1fZGJnX2RyaXZlcigmeGUtPmRybSwgIm11dGxpY2FzdCBtc2cg
YnVmZmVyIGlzIHNtYWxsXG4iKTsNCj4gKwkJbmxtc2dfZnJlZShtc2cpOw0KPiArCQlyZXR1cm47
DQo+ICsJfQ0KPiArDQo+ICsJZ2VubG1zZ19lbmQobXNnLCBoZHIpOw0KPiArDQo+ICsJZ2VubG1z
Z19tdWx0aWNhc3QoJnhlLT5kcm0uZHJtX2dlbmxfZmFtaWx5LCBtc2csIDAsDQo+ICsJCQkgIGh3
X2VyciA/DQo+ICsJCQkgIERSTV9HRU5MX01DQVNUX1VOQ09SUl9FUlINCj4gKwkJCSAgOiBEUk1f
R0VOTF9NQ0FTVF9DT1JSX0VSUiwNCj4gKwkJCSAgR0ZQX0FUT01JQyk7DQoNCkkgYWdyZWUgdGhh
dCBoaWRpbmcvd3JhcHBpbmcgYW55IG5ldGxpbmsvZ2VuZXRsaW5rIEFQSS9tYWNybyB3aXRoIGEg
RFJNIA0KaGVscGVyIHdvdWxkIGJlIHNvbWV0aW1lcyByZWR1bmRhbnQsDQphbmQgdGhhdCBpbiBz
b21lIGNhc2VzIHRoZSBzcGVjaWZpYyBEUk0gZHJpdmVyIHdvdWxkIGhhdmUgdG8gImRpcnQgaXRz
IA0KaGFuZHMiIGFuZCBkZWFsIHdpdGggbmV0bGluayAoZS5nLiBmaWxsX2Vycm9yX2RldGFpbHMo
KSBpbiBwYXRjaCAjMykuDQpIb3dldmVyIG1heWJlIGhlcmUgYSBEUk0gaGVscGVyIHdvdWxkIGhh
dmUgYmVlbiB1c2VmdWwsIHNvIHdlIHdvbid0IHNlZSANCmEgY29weSBvZiB0aGlzIHNlcXVlbmNl
IGluIG90aGVyIERSTSBkcml2ZXJzPw0KDQpUaGFua3MsDQpUb21lcg0KDQo+ICt9DQo+ICsNCj4g
ICBzdGF0aWMgdm9pZA0KPiAgIHhlX2h3X2Vycm9yX3NvdXJjZV9oYW5kbGVyKHN0cnVjdCB4ZV90
aWxlICp0aWxlLCBjb25zdCBlbnVtIGhhcmR3YXJlX2Vycm9yIGh3X2VycikNCj4gICB7DQo+IEBA
IC04NDksNiArODgwLDggQEAgeGVfaHdfZXJyb3Jfc291cmNlX2hhbmRsZXIoc3RydWN0IHhlX3Rp
bGUgKnRpbGUsIGNvbnN0IGVudW0gaGFyZHdhcmVfZXJyb3IgaHdfZXINCj4gICAJfQ0KPiAgIA0K
PiAgIAl4ZV9tbWlvX3dyaXRlMzIoZ3QsIERFVl9FUlJfU1RBVF9SRUcoaHdfZXJyKSwgZXJyc3Jj
KTsNCj4gKw0KPiArCWdlbmVyYXRlX25ldGxpbmtfZXZlbnQodGlsZV90b194ZSh0aWxlKSwgaHdf
ZXJyKTsNCj4gICB1bmxvY2s6DQo+ICAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnRpbGVfdG9f
eGUodGlsZSktPmlycS5sb2NrLCBmbGFncyk7DQo+ICAgfQ0KDQoNCg==
