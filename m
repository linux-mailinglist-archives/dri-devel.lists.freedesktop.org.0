Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CEB27B077
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 17:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4436489D67;
	Mon, 28 Sep 2020 15:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB47389D67
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 15:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id A27F6FB03;
 Mon, 28 Sep 2020 17:02:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q109Wptkrg7z; Mon, 28 Sep 2020 17:02:04 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 461E045BEF; Mon, 28 Sep 2020 17:02:03 +0200 (CEST)
Date: Mon, 28 Sep 2020 17:02:03 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [RFC PATCH v1 3/3] dt-binding: display: Require two rests on
 mantix panel
Message-ID: <20200928150203.GA58525@bogon.m.sigxcpu.org>
References: <cover.1600707235.git.agx@sigxcpu.org>
 <71a9108f3472ba9af4bead01b1b770d1e73eb08e.1600707235.git.agx@sigxcpu.org>
 <20200924193807.GA1223313@ravnborg.org>
 <20200928065039.GB2837573@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200928065039.GB2837573@ulmo>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thierry,
On Mon, Sep 28, 2020 at 08:50:39AM +0200, Thierry Reding wrote:
> On Thu, Sep 24, 2020 at 09:38:07PM +0200, Sam Ravnborg wrote:
> > Hi Guido.
> > =

> > On Mon, Sep 21, 2020 at 06:55:52PM +0200, Guido G=FCnther wrote:
> > > We need to reset both for the panel to show an image.
> > > =

> > > Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> > > ---
> > >  .../bindings/display/panel/mantix,mlaf057we51-x.yaml       | 7 +++++=
--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > =

> > > diff --git a/Documentation/devicetree/bindings/display/panel/mantix,m=
laf057we51-x.yaml b/Documentation/devicetree/bindings/display/panel/mantix,=
mlaf057we51-x.yaml
> > > index 937323cc9aaa..ba5a18fac9f9 100644
> > > --- a/Documentation/devicetree/bindings/display/panel/mantix,mlaf057w=
e51-x.yaml
> > > +++ b/Documentation/devicetree/bindings/display/panel/mantix,mlaf057w=
e51-x.yaml
> > > @@ -35,7 +35,9 @@ properties:
> > >    vddi-supply:
> > >      description: 1.8V I/O voltage supply
> > >  =

> > > -  reset-gpios: true
> > > +  reset-gpios:
> > > +    minItems: 2
> > > +    maxItems: 2
> > =

> > reset-gpios is, as you already wrote, defined in panel-common.yaml.
> > Do not try to change it here.
> > It would be much better, I think, to introduce a mantix,reset-gpios
> > property.
> > =

> > This would avoid that we had two different reset-gpios definitions.
> =

> My understanding is that this will only override the defaults defined in
> panel-common.yaml. So everything else about the
> panel-common.yaml#/properties/reset-gpios definition remains valid and
> all this does is say that when this matched on "mantix,mlaf057we51-x",
> then the "reset-gpios" property is expected to contain two entries as
> opposed to the single entry that is expected by default.

I thought so too but I get:

linux/Documentation/devicetree/bindings/display/panel/mantix,mlaf057we51-x.=
example.dt.yaml: panel@0: reset-gpios: [[4294967295, 29, 1], [4294967295, 2=
4, 1]] is too long
	From schema: /.../linux/Documentation/devicetree/bindings/display/panel/ma=
ntix,mlaf057we51-x.yaml

It seems to bepossible to *extend* reset-gpios though because when i use
an example like:

            reset-gpios =3D <&gpio1 29 GPIO_ACTIVE_LOW>,
                          <&gpio1 24 GPIO_ACTIVE_LOW>;

i correctly get

linux/linux/Documentation/devicetree/bindings/display/panel/mantix,mlaf057w=
e51-x.example.dt.yaml: panel@0: reset-gpios: [[4294967295, 29, 1]] is too s=
hort
	From schema: /.../linux/Documentation/devicetree/bindings/display/panel/ma=
ntix,mlaf057we51-x.yaml
 =

so the `minItems: 2` is being picked up. This mens i can add
properties but i can't overwrite the existing `maxItems: 2` - that's why
i was wondering how that is supposed to work (if properties should be
overrideable from common files or not).
Cheers,
 -- Guido

> =

> Thierry


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
